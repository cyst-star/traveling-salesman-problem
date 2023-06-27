COPY(
	WITH SEARCH AS (
		WITH SCORE AS (
			SELECT
				S.item_index
				,S.series_index
				,sort_recommend_index
				,S.dad_flg
				,ARRAY[
					FALSE
					,FALSE
					,ARRAY[ja_normalize('単三電池')] <@ ary_word
					,order_keyword_10_1 LIKE likequery(_normalize_keyword('単三電池'))
					,_normalize_keyword(MI.display_article) LIKE likequery(_normalize_keyword('単三電池'))
					,_normalize_keyword(MI.pord_cd) LIKE likequery(_normalize_keyword('単三電池'))
					,_normalize_keyword(MI.jan_cd) LIKE likequery(_normalize_keyword('単三電池'))
					,order_keyword_7_1 LIKE likequery(_normalize_keyword('単三電池'))
					,order_keyword_7_2 LIKE likequery(_normalize_keyword('単三電池'))
					,_normalize_keyword(MM.name) LIKE likequery(_normalize_keyword('単三電池'))
					,_normalize_keyword(MM.maker_name_kana) LIKE likequery(_normalize_keyword('単三電池'))
					,_normalize_keyword(MB.brand_name) LIKE likequery(_normalize_keyword('単三電池'))
					,_normalize_keyword(MB.brand_name_kana) LIKE likequery(_normalize_keyword('単三電池'))
					,order_keyword_5_1 LIKE likequery(_normalize_keyword('単三電池'))
					,_normalize_keyword(MI.article_name) LIKE likequery(_normalize_keyword('単三電池'))
					,_normalize_keyword(MI.article_name_kn) LIKE likequery(_normalize_keyword('単三電池'))
					,order_keyword_3_1 LIKE likequery(_normalize_keyword('単三電池'))
					,_normalize_keyword(MOP.option_name) LIKE likequery(_normalize_keyword('単三電池'))
					,_normalize_keyword(MOP.option_name_kana) LIKE likequery(_normalize_keyword('単三電池'))
					,order_keyword_2_1 LIKE likequery(_normalize_keyword('単三電池'))
					,order_keyword_1_1 LIKE likequery(_normalize_keyword('単三電池'))
				] AS ary_hit_column_org_keyword
				,ARRAY[
					FALSE
					,FALSE
					,ARRAY[ja_normalize('単三電池')] <@ ary_word OR ARRAY[ja_normalize('電池単三')] <@ ary_word OR ARRAY[ja_normalize('単３電池')] <@ ary_word OR ARRAY[ja_normalize('単三')] <@ ary_word
					,order_keyword_10_1 LIKE likequery(_normalize_keyword('単三電池'))
						OR order_keyword_10_1 LIKE likequery(_normalize_keyword('電池単三'))
						OR order_keyword_10_1 LIKE likequery(_normalize_keyword('単三'))
						OR order_keyword_10_1 LIKE likequery(_normalize_keyword('単３'))
					,_normalize_keyword(MI.display_article) LIKE likequery(_normalize_keyword('単三電池'))
						OR _normalize_keyword(MI.display_article) LIKE likequery(_normalize_keyword('電池単三'))
						OR _normalize_keyword(MI.display_article) LIKE likequery(_normalize_keyword('単三'))
						OR _normalize_keyword(MI.display_article) LIKE likequery(_normalize_keyword('単３'))
					,_normalize_keyword(MI.pord_cd) LIKE likequery(_normalize_keyword('単三電池'))
						OR _normalize_keyword(MI.pord_cd) LIKE likequery(_normalize_keyword('電池単三'))
						OR _normalize_keyword(MI.pord_cd) LIKE likequery(_normalize_keyword('単三'))
						OR _normalize_keyword(MI.pord_cd) LIKE likequery(_normalize_keyword('単３'))
					,_normalize_keyword(MI.jan_cd) LIKE likequery(_normalize_keyword('単三電池'))
						OR _normalize_keyword(MI.jan_cd) LIKE likequery(_normalize_keyword('電池単三'))
						OR _normalize_keyword(MI.jan_cd) LIKE likequery(_normalize_keyword('単三'))
						OR _normalize_keyword(MI.jan_cd) LIKE likequery(_normalize_keyword('単３'))
					,order_keyword_7_1 LIKE likequery(_normalize_keyword('単三電池'))
						OR order_keyword_7_1 LIKE likequery(_normalize_keyword('電池単三'))
						OR order_keyword_7_1 LIKE likequery(_normalize_keyword('単三'))
						OR order_keyword_7_1 LIKE likequery(_normalize_keyword('単3'))
					,order_keyword_7_2 LIKE likequery(_normalize_keyword('単三電池'))
						OR order_keyword_7_2 LIKE likequery(_normalize_keyword('電池単三'))
						OR order_keyword_7_2 LIKE likequery(_normalize_keyword('単三'))
						OR order_keyword_7_2 LIKE likequery(_normalize_keyword('単３'))
					,_normalize_keyword(MM.name) LIKE likequery(_normalize_keyword('単三電池'))
						OR _normalize_keyword(MM.name) LIKE likequery(_normalize_keyword('電池単三'))
						OR _normalize_keyword(MM.name) LIKE likequery(_normalize_keyword('単三'))
						OR _normalize_keyword(MM.name) LIKE likequery(_normalize_keyword('単３'))
					,_normalize_keyword(MM.maker_name_kana) LIKE likequery(_normalize_keyword('単三電池'))
						OR _normalize_keyword(MM.maker_name_kana) LIKE likequery(_normalize_keyword('電池単三'))
						OR _normalize_keyword(MM.maker_name_kana) LIKE likequery(_normalize_keyword('単三'))
						OR _normalize_keyword(MM.maker_name_kana) LIKE likequery(_normalize_keyword('単３'))
					,_normalize_keyword(MB.brand_name) LIKE likequery(_normalize_keyword('単三電池'))
						OR _normalize_keyword(MB.brand_name) LIKE likequery(_normalize_keyword('電池単三'))
						OR _normalize_keyword(MB.brand_name) LIKE likequery(_normalize_keyword('単三'))
						OR _normalize_keyword(MB.brand_name) LIKE likequery(_normalize_keyword('単３'))
					,_normalize_keyword(MB.brand_name_kana) LIKE likequery(_normalize_keyword('単三電池'))
						OR _normalize_keyword(MB.brand_name_kana) LIKE likequery(_normalize_keyword('電池単三'))
						OR _normalize_keyword(MB.brand_name_kana) LIKE likequery(_normalize_keyword('単三'))
						OR _normalize_keyword(MB.brand_name_kana) LIKE likequery(_normalize_keyword('単３'))
					,order_keyword_5_1 LIKE likequery(_normalize_keyword('単三電池'))
						OR order_keyword_5_1 LIKE likequery(_normalize_keyword('電池単三'))
						OR order_keyword_5_1 LIKE likequery(_normalize_keyword('単三'))
						OR order_keyword_5_1 LIKE likequery(_normalize_keyword('単３'))
					,_normalize_keyword(MI.article_name) LIKE likequery(_normalize_keyword('単三電池'))
						OR _normalize_keyword(MI.article_name) LIKE likequery(_normalize_keyword('電池単三'))
						OR _normalize_keyword(MI.article_name) LIKE likequery(_normalize_keyword('単三'))
						OR _normalize_keyword(MI.article_name) LIKE likequery(_normalize_keyword('単３'))
					,_normalize_keyword(MI.article_name_kn) LIKE likequery(_normalize_keyword('単三電池'))
						OR _normalize_keyword(MI.article_name_kn) LIKE likequery(_normalize_keyword('電池単三'))
						OR _normalize_keyword(MI.article_name_kn) LIKE likequery(_normalize_keyword('単三'))
						OR _normalize_keyword(MI.article_name_kn) LIKE likequery(_normalize_keyword('電池単３'))
					,order_keyword_3_1 LIKE likequery(_normalize_keyword('単三電池'))
						OR order_keyword_3_1 LIKE likequery(_normalize_keyword('電池単三'))
						OR order_keyword_3_1 LIKE likequery(_normalize_keyword('単三'))
						OR order_keyword_3_1 LIKE likequery(_normalize_keyword('単３'))
					,_normalize_keyword(MOP.option_name) LIKE likequery(_normalize_keyword('単三電池'))
						OR _normalize_keyword(MOP.option_name) LIKE likequery(_normalize_keyword('電池単三'))
						OR _normalize_keyword(MOP.option_name) LIKE likequery(_normalize_keyword('単三'))
						OR _normalize_keyword(MOP.option_name) LIKE likequery(_normalize_keyword('単３'))
					,_normalize_keyword(MOP.option_name_kana) LIKE likequery(_normalize_keyword('単三電池'))
						OR _normalize_keyword(MOP.option_name_kana) LIKE likequery(_normalize_keyword('電池単三'))
						OR _normalize_keyword(MOP.option_name_kana) LIKE likequery(_normalize_keyword('単三'))
						OR _normalize_keyword(MOP.option_name_kana) LIKE likequery(_normalize_keyword('単３'))
					,order_keyword_2_1 LIKE likequery(_normalize_keyword('単三電池'))
						OR order_keyword_2_1 LIKE likequery(_normalize_keyword('電池単三'))
						OR order_keyword_2_1 LIKE likequery(_normalize_keyword('単三'))
						OR order_keyword_2_1 LIKE likequery(_normalize_keyword('単３'))
					,order_keyword_1_1 LIKE likequery(_normalize_keyword('単三電池'))
						OR order_keyword_1_1 LIKE likequery(_normalize_keyword('電池単三'))
						OR order_keyword_1_1 LIKE likequery(_normalize_keyword('単三'))
						OR order_keyword_1_1 LIKE likequery(_normalize_keyword('単３'))
				] AS ary_hit_column_synonym
				,(CASE
					WHEN (order_keyword_10_1 LIKE likequery(_normalize_keyword('単三電池')))
						THEN 10 * 1
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_7_1 LIKE likequery(_normalize_keyword('単三電池')))
						THEN 7 * 1
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_7_2 LIKE likequery(_normalize_keyword('単三電池')))
						THEN 7 * 1
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_5_1 LIKE likequery(_normalize_keyword('単三電池')))
						THEN 5 * 1
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_3_1 LIKE likequery(_normalize_keyword('単三電池')))
						THEN 3 * 1
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_2_1 LIKE likequery(_normalize_keyword('単三電池')))
						THEN 2 * 1
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_1_1 LIKE likequery(_normalize_keyword('単三電池')))
						THEN 1 * 1
					ELSE
						0
				END)::int2 
				+
				(CASE
					WHEN (ARRAY[ja_normalize('単三電池')] <@ ary_word)
						THEN 15 * 1
					ELSE
						0
				END) AS score_org_keyword
				,(CASE
					WHEN (order_keyword_10_1 LIKE likequery(_normalize_keyword('単三電池')) OR order_keyword_10_1 LIKE likequery(_normalize_keyword('電池単三')) OR order_keyword_10_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_10_1 LIKE likequery(_normalize_keyword('単３')))
						THEN 10 * 0.9
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_7_1 LIKE likequery(_normalize_keyword('単三電池')) OR order_keyword_7_1 LIKE likequery(_normalize_keyword('電池単三')) OR order_keyword_7_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_7_1 LIKE likequery(_normalize_keyword('単３')))
						THEN 7 * 0.9
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_7_2 LIKE likequery(_normalize_keyword('単三電池')) OR order_keyword_7_2 LIKE likequery(_normalize_keyword('電池単三')) OR order_keyword_7_2 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_7_2 LIKE likequery(_normalize_keyword('単３')))
						THEN 7 * 0.9
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_5_1 LIKE likequery(_normalize_keyword('単三電池')) OR order_keyword_5_1 LIKE likequery(_normalize_keyword('電池単三')) OR order_keyword_5_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_5_1 LIKE likequery(_normalize_keyword('単３')))
						THEN 5 * 0.9
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_3_1 LIKE likequery(_normalize_keyword('単三電池')) OR order_keyword_3_1 LIKE likequery(_normalize_keyword('電池単三')) OR order_keyword_3_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_3_1 LIKE likequery(_normalize_keyword('単３')))
						THEN 3 * 0.9
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_2_1 LIKE likequery(_normalize_keyword('単三電池')) OR order_keyword_2_1 LIKE likequery(_normalize_keyword('電池単三')) OR order_keyword_2_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_2_1 LIKE likequery(_normalize_keyword('単３')))
						THEN 2 * 0.9
					ELSE
						0
				END)::int2  + 
				(CASE
					WHEN (order_keyword_1_1 LIKE likequery(_normalize_keyword('単三電池')) OR order_keyword_1_1 LIKE likequery(_normalize_keyword('電池単三')) OR order_keyword_1_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_1_1 LIKE likequery(_normalize_keyword('単３')))
						THEN 1 * 0.9
					ELSE
						0
				END)::int2 
				+
				(CASE
					WHEN (ARRAY[ja_normalize('単三電池')] <@ ary_word  OR ARRAY[ja_normalize('電池単三')] <@ ary_word OR ARRAY[ja_normalize('単三')] <@ ary_word OR ARRAY[ja_normalize('単３')] <@ ary_word)
						THEN 15 * 0.9
					ELSE
						0
				END) AS score_synonym
			FROM(
				SELECT
					*
				FROM
					_search_item_cy3
				WHERE
					((search_keyword LIKE likequery(_normalize_keyword('単三電池')) OR search_keyword LIKE likequery(_normalize_keyword('電池単三')) OR search_keyword LIKE likequery(_normalize_keyword('単三')) OR search_keyword LIKE likequery(_normalize_keyword('単３'))))
					AND (ary_category_index && ARRAY[1])
					AND is_oc_only IS FALSE
			)S
			INNER JOIN _master_item MI USING(item_index)
			LEFT JOIN _master_brand MB ON (MB.brand_cd = MI.brand_cd)
			LEFT JOIN _master_maker MM ON (MM.ary_maker_cd && ARRAY[MI.maker_cd]::_text)
			LEFT JOIN _master_option MOP USING (option_cd)
		),KWD AS (
			SELECT
				item_index
				,series_index
				,sort_recommend_index
				,dad_flg
				,getKeywordOrderWeight(
					ia_maxel(0, ARRAY[score_org_keyword, score_synonym]::_int4)::int2
				) AS keywordOrderWeight
				,ia_maxel(0, ARRAY[score_org_keyword, score_synonym]::_int4)::int2 AS score
				,score_org_keyword
				,score_synonym
				,score_org_keyword >= score_synonym AS is_hit_org_keyword
				,(CASE
					WHEN (score_org_keyword >= score_synonym) THEN ary_hit_column_org_keyword
					ELSE ary_hit_column_synonym
				END) AS ary_hit_column
			FROM
				SCORE
		)
		SELECT
			uniq(array_agg(KWD.item_index ORDER BY KWD.item_index)) AS ary_item_index
			,KWD.series_index
			,(row_number()
				OVER (ORDER BY first(dad_flg ORDER BY dad_flg NULLS LAST)
				,first(keywordOrderWeight ORDER BY keywordOrderWeight)
				,first(sort_recommend_index ORDER BY sort_recommend_index) NULLS LAST, KWD.series_index))::int4 AS sort_order -- sort_orderは表示のソートに使う
			,first(keywordOrderWeight ORDER BY keywordOrderWeight) AS keywordOrderWeight
			,first(item_index ORDER BY score DESC) AS max_score_item_index
			,first(score ORDER BY score DESC) AS score
			,first(is_hit_org_keyword ORDER BY score DESC) AS is_hit_org_keyword
			,first(ary_hit_column ORDER BY score DESC) AS ary_hit_column
			FROM
				KWD
			GROUP BY
				series_index
			ORDER BY
				first(dad_flg ORDER BY dad_flg NULLS LAST)
				,first(keywordOrderWeight ORDER BY keywordOrderWeight)
				,first(sort_recommend_index ORDER BY sort_recommend_index) NULLS LAST
				,KWD.series_index
			LIMIT
				20
			OFFSET
				0
		), S AS (
			SELECT
				unnest(ary_item_index) AS item_index
				,series_index
				,sort_order -- sort_orderでorderBYしてる
				,keywordOrderWeight
				,max_score_item_index
				,score
				,is_hit_org_keyword
				,ary_hit_column
			FROM 
				SEARCH
		)
		SELECT
				first(S.sort_order) AS numorder
				,(CASE WHEN COUNT(MI.item_index) > 1
					THEN TRUE
					ELSE FALSE
				END) AS is_series
				,(CASE WHEN COUNT(MI.item_index) > 1
					THEN first(MS.series_cd)
					ELSE first(MI.trusco_mng_article)
				END) AS code
				,(CASE WHEN COUNT(MI.item_index) > 1
					THEN coalesce(first(MS.series_name), (array_agg(MI.article_name ORDER BY MI.series_order_index))[1] || '等')
					ELSE first(MI.article_name)
				END) AS name
				,first(MI.dad_flg ORDER BY MI.dad_flg NULLS LAST) AS dad_flg

				,first(MIS.trusco_mng_article) AS second_sort_key_item
				,first(S.keywordOrderWeight ORDER BY keywordOrderWeight DESC) AS keywordOrderWeight
				,first(S.score) AS score
				,first(is_hit_org_keyword) AS is_hit_org_keyword
				,(first(ary_hit_column))[1] AS is_hit_id_1
				,(first(ary_hit_column))[2] AS is_hit_id_2
				,(first(ary_hit_column))[3] AS is_hit_id_3
				,(first(ary_hit_column))[4] AS is_hit_id_4
				,(first(ary_hit_column))[5] AS is_hit_id_4_display_article
				,(first(ary_hit_column))[6] AS is_hit_id_4_pord_cd
				,(first(ary_hit_column))[7] AS is_hit_id_4_jan_cd
				,(first(ary_hit_column))[8] AS is_hit_id_5
				,(first(ary_hit_column))[9] AS is_hit_id_6
				,(first(ary_hit_column))[10] AS is_hit_id_6_maker_name
				,(first(ary_hit_column))[11] AS is_hit_id_6_maker_name_kana
				,(first(ary_hit_column))[12] AS is_hit_id_6_brand_name
				,(first(ary_hit_column))[13] AS is_hit_id_6_brand_name_kana
				,(first(ary_hit_column))[14] AS is_hit_id_7
				,(first(ary_hit_column))[15] AS is_hit_id_7_article_name
				,(first(ary_hit_column))[16] AS is_hit_id_7_article_name_kana
				,(first(ary_hit_column))[17] AS is_hit_id_8
				,(first(ary_hit_column))[18] AS is_hit_id_8_option_name
				,(first(ary_hit_column))[19] AS is_hit_id_8_option_name_kana
				,(first(ary_hit_column))[20] AS is_hit_id_9
				,(first(ary_hit_column))[21] AS is_hit_id_10

				,first(MI.trusco_mng_article ORDER BY SI.sort_recommend_index) AS third_sort_key_item
				,first(MIW.order_num ORDER BY SI.sort_recommend_index) AS item_weight
				,first(MMW.order_num ORDER BY SI.sort_recommend_index) AS maker_weight
				,first(LOA.access_num ORDER BY SI.sort_recommend_index) AS access_num
				,first(LOP.purchase_num ORDER BY SI.sort_recommend_index) AS purchase_num
				,first(MI.is_pb ORDER BY SI.sort_recommend_index) AS is_pb
				,first(MI.trusco_mng_article ORDER BY SI.sort_recommend_index) AS trusco_mng_article
		FROM 
			S
		INNER JOIN(
			SELECT
				*
				,null::text AS other_entry_price
				,null::text AS maker_name
				,null::text stand_dlv_date_lt
				,FALSE AS is_item_other_entry
			FROM
				_master_item
		)MI USING (item_index)
		INNER JOIN _search_item_cy3 SI USING(item_index)
		LEFT JOIN _master_series MS ON (MS.series_index = S.series_index)
		LEFT JOIN _master_maker MM ON (MM.ary_maker_cd && array[MI.maker_cd]::_text)
		LEFT JOIN _master_brand_maker_cy3 MBM ON (MBM.ary_maker_cd && ARRAY[MI.maker_cd]::_text AND ARRAY[MI.brand_index]::_text && MBM.ary_brand_index::_text)
		LEFT JOIN _master_item_inherit MII ON (MII.item_index = MI.item_index)
		LEFT JOIN _master_item_inherit_oc MIIOC ON (MIIOC.item_index = MI.item_index)
		LEFT JOIN _data_spec_series_cy3 DSS ON (DSS.series_index = S.series_index)
		LEFT JOIN _data_spec_item_cy3 DSI ON (DSI.item_index = MI.item_index)
		LEFT JOIN _master_item_weight MIW ON(MIW.item_index = MI.item_index)
		LEFT JOIN _master_maker_weight MMW ON (MMW.maker_index = MM.maker_index)
		LEFT JOIN _log_ob_access LOA ON (LOA.item_index = MI.item_index)
		LEFT JOIN _log_ob_purchase LOP ON (LOP.item_index = MI.item_index)
		LEFT JOIN _master_item MIS ON (MIS.item_index = S.max_score_item_index)
		GROUP BY
			S.series_index
		ORDER BY
			first(S.sort_order ORDER BY sort_order)
) TO '/data/work/forcia/detail_score_tansandenchi.csv' WITH CSV NULL AS '' HEADER;
