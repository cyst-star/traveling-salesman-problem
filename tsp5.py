import numpy as np
import random
import matplotlib.pyplot as plt

#順序交叉と転座
def generate_rand_cities(num_cities):#num_cities分の都市を生成(座標は0~1)
    """
    generate random city layout

    parameter
    ---
    num_cities: int
        number of cities

    return
    ---
    positions: array like
        city layout(x, y)
        size = (num_cities, 2)
    """
    positions = np.zeros((num_cities, 2))
    for i in range(num_cities):
        positions[i, 0] = input()
        positions[i, 1] = input()
    return positions

def generate_init_genes(num_indivisual, num_cities):#1世代の遺伝子の個体数と都市の数
    """
    generate genes of indivisuals at initial generation

    parameter
    ---
    num_indivisual: int
        number of indivisuals
    
    num_cities:
        number of cities

    return
    ---
    genes: array like
        genes of initial indivisuals
        size = (num_indivisual, num_cities)
    """
    genes = np.zeros((num_indivisual, num_cities), dtype=np.int16)
    for i in range(num_indivisual):
        genes[i,] = random.sample(range(num_cities), k=num_cities)
    return genes

def sum_path(cities, gene):#評価関数,世代の解の数分距離を求めて評価する
    """
    caluculate summantion of path

    parameter
    ---
    cities: array like
        positions(x, y) of cities
        size = (number of cities, 2)
    
    gene: array like
        a gene of an indivisual
        size = (num_cities)

    return
    ---
    sum: float
        the length of the travelling path
    """
    sum = 0.
    for i in range(len(cities)-1):
        sum += np.linalg.norm(cities[int(gene[i])]-cities[int(gene[i+1])])
    return sum

def genes_path(genes, cities):  #経路の長さをまとめて出力
    """
    calculate path lengthes of all indivisuals

    parameters
    ---
    genes: array like
        a gene of an indivisual
        size = (num_cities)
    
    cities: array like
        positions(x, y) of cities
        size = (number of cities, 2)
    
    return
    ---
    pathlength_vec: array like
        path lengthes of each indivisuals
        size = (num_indivisual)
    """
    pathlength_vec = np.zeros(len(genes))
    for i in range(len(genes)):
        indices = genes[i]
        pathlength_vec[i] = sum_path(cities, indices)
        #print(pathlength_vec[i])
    return pathlength_vec

def generate_roulette(fitness_vec):#適応度(総和は1)の配列を入力,ルーレット方式で交叉する遺伝子を選ぶためのルーレットを作成
    """
    obtain probabilities for roulette choice

    parameter
    ---
    fitness_vec: array like
        fitnesses of target indivisuals
        size = (indivisual)

    return
    ---
    roulette: array like
        table of probabilities for choice
    """
    total = np.sum(fitness_vec)
    roulette = np.zeros(len(fitness_vec))
    for i in range(len(fitness_vec)):
        roulette[i] = fitness_vec[i]/total
    return roulette

fitness = np.array([20,50,30])
generate_roulette(fitness)


def roulette_choice(fitness_vec):#ルーレットを用いて交叉する個体を選択
    """
    choice genes for crossover by using generate_roulette

    parameter
    ---
    fitness_vec: array like
        fitnesses of target indivisuals
        size = (indivisual)

    return
    ---
    choiced: array like
        indicies of choiced indivisuals
        size = (1, 2)
    """
    roulette = generate_roulette(fitness_vec)
    choiced = np.random.choice(len(roulette), 2, replace=True, p=roulette)#個体数,重複を許すか,それぞれが選ばれる確率
    return choiced#交叉する遺伝子が決定された

def partial_crossover(parent1, parent2):#順序交叉,親1と親2
    num = len(parent1)

    r1 = list(range(num))#rの宣言これやらないとエラー出る
    r2 = list(range(num))
    r3 = list(range(num))
    r4 = list(range(num))

    for i in range(0, num):#rに順序の基準をいれる[0,1,2,3...]
        r1[i] = i
        r2[i] = i
        r3[i] = i
        r4[i] = i

    child1 = np.zeros(num)
    child2 = np.zeros(num)

    
    for i in range(0, num):
        target_value1 = parent1[i]
        target_value2 = parent2[i]

        for j in range(0, num):
            if r1[j] == target_value1:
                index1 = j
                break

        for k in range(0, num):
            if r2[k] == target_value2:
                index2 = k
                break

        child1[i] = index1
        child2[i] = index2
        
        r1.pop(index1)
        r2.pop(index2)

        cross_point = random.randrange(0, num - 1)  #交叉の切れ目選択

        C1 = np.zeros(num)
        C2 = np.zeros(num)

        for l in range(0, cross_point):
            C1[l]=child1[l]
            C2[l]=child2[l]

        for m in range(cross_point + 1, num):
            C1[m] = child2[m]
            C2[m] = child1[m]

    
    B1 = np.zeros(num)
    B2 = np.zeros(num)
    for i in range(0,num):#デコード開始

        index3 = C1[i]#C1デコード
        index3=round(index3)
        target_value3 = r3[index3]
        B1[i] = target_value3
        r3.pop(index3)

        index4 = C2[i]#C2デコード
        index4=round(index4)
        target_value4 = r4[index4]
        B2[i] = target_value4
        r4.pop(index4)

        """
        for j in range(0, num):
            if target_value3 == r3[j]:
                index3 = j
                break
        """

    child1 = B1
    child2 = B2

    return child1, child2

def translocation_mutation(genes, num_mutation, p_value,cities):#突然変異、転座
    """
    translocation mutation algorithm

    parameters
    ---
    genes: array like
        genes of initial indivisuals
        size = (nm_indivisual, num_cities)
    
    num_mutation: int
        number of mutation target
    
    p_value: float
        probability of mutation

    returns
    ---
    mutated_genes: array like
        mutated genes with translocation
        size = (num_indivisual, num_cities)
    """
    mutated_genes = genes
    for i in range(num_mutation):
        mutation_flg = np.random.choice(2, 1, p = [1-p_value, p_value])
        if mutation_flg == 1:
            mutation_value = np.random.choice(genes[i], 2, replace=  False)
            mutation_position1 = np.where(genes[i] == mutation_value[0])
            mutation_position2 = np.where(genes[i] == mutation_value[1])
            mutated_genes[i][mutation_position1] = mutation_value[1]
            mutated_genes[i][mutation_position2] = mutation_value[0]

    r1 = genes_path(mutated_genes, cities)
    r2 = genes_path(genes, cities)
    
    if min(r1) < min(r2):
        print('not happen')
    else:
        mutated_genes=genes

    #print('r1')
    #print(r1)
    return mutated_genes


def show_cities(cities):
    """
    show layout of cities

    parameter
    ---
    cities: array like
        positions(x, y) of cities
        size = (number of cities, 2)
    """
    for i in range(len(cities)):
        plt.scatter(cities[i][0], cities[i][1],c='black')

def show_route(cities, genes):
    """
    show route of traveling cities

    parameter
    ---
    cities: array like
        positions(x, y) of cities
        size = (number of cities, 2)

    genes: array like
        a gene of an indivisual
        size = (num_cities)
    """
    for i in range(len(genes)-1):
        if i == 0:
            plt.text(cities[int(genes[i])][0], cities[int(genes[i])][1], "start")
        else:
            plt.text(cities[int(genes[i])][0], cities[int(genes[i])][1], str(i))
        plt.plot([cities[int(genes[i])][0], cities[int(genes[i+1])][0]], 
                 [cities[int(genes[i])][1], cities[int(genes[i+1])][1]],'k')
    plt.text(cities[int(genes[i + 1])][0], cities[int(genes[i + 1])][1], "goal")
    
def main():
    num_cities = 30#都市数
    indivisuals = 21#1世代の解の数
    generation = 1000#世代
    elite = 9#エリート個体
    p_mutation = 0.01  #突然変異確率
    o_solution=0.0001#最適解

    cities = generate_rand_cities(num_cities)
    genes = generate_init_genes(indivisuals, num_cities)
    show_cities(cities)
    top_indivisual=[]
    max_fit = 0
    for i in range(generation):
        fitness_vec = np.reciprocal(genes_path(genes, cities))
        child = np.zeros(np.shape(genes))
        for j in range(int((indivisuals-elite)/2)):
            parents_indices = roulette_choice(fitness_vec)
            child[2*j], child[2*j+1] = partial_crossover(genes[parents_indices[0]], 
                                                         genes[parents_indices[1]])
    
        for j in range(indivisuals-elite, indivisuals):#エリート選択
            child[j] = genes[np.argsort(fitness_vec)[j]]

        path = min(genes_path(genes, cities))#その地点での最短路
        accuracy = o_solution / path  #解精度
        
        if accuracy < 0.4:
            p_mutation = 0.01
        elif 0.6<accuracy<0.4:
            p_mutation = 0.1
        else:
            p_mutation = 0.15

        child = translocation_mutation(child, indivisuals-elite, p_mutation,cities)
        top_indivisual.append(max(fitness_vec))
        genes = child
        if max(fitness_vec) > max_fit:#新しい最短経路を見つけたときに描画
            max_fit = max(fitness_vec)
            show_cities(cities)
            show_route(cities, child[np.argmax(fitness_vec)])
            #plt.text(300, 600, "generation: " + str(i))#generationを画像に
            #plt.text(300, 500, "path_length: " + str(min(genes_path(genes,cities))))#pathlengthを画像に
            #plt.title("Generation: {}".format(i + 1))
            print("Generation")
            print(i+1)
            print("sum_path")
            print(min(genes_path(genes, cities)))
            plt.savefig("img_5_17_change/tsp{}".format(i+1))  # pngとして保存。カレントディレクトリにimgフォルダを置く必要あり。
            plt.show()
    #print(num_cities)
    #print(cities)

if __name__ == '__main__':
    main()

