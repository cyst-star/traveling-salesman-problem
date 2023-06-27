WITH SEARCH AS (
			
		WITH KWD AS (
			
SELECT
	item_index
	,series_index
	,
			sort_recommend_index
			,dad_flg
		
		
		
			,
	getKeywordOrderWeight(
		
		
		ia_maxel(0, ARRAY[
			
	
		(CASE
			WHEN (order_keyword_15_1 LIKE likequery(_normalize_keyword('単三電池')))
				THEN 15 * 1
			ELSE
				0
		END)::int2  + 
	
		(CASE
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
			WHEN (length(ja_normalize('単三電池')) > 0 AND ARRAY[ja_normalize('単三電池')] <@ ary_word)
				THEN 15 * 1
			ELSE
				0
		END)
	
	
	, 
		(CASE
		WHEN (display_article = '単三電池')
			THEN 100 * 1
		ELSE
			0
		END)::int2  + 
	
	
		(CASE
		WHEN (pord_cd = '単三電池')
			THEN 100 * 1
		ELSE
			0
		END)::int2 
	

			,
	
		(CASE
			WHEN (order_keyword_15_1 LIKE likequery(_normalize_keyword('単3')) OR order_keyword_15_1 LIKE likequery(_normalize_keyword('単3電池')) OR order_keyword_15_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_15_1 LIKE likequery(_normalize_keyword('電池単三')))
				THEN 15 * 0.9
			ELSE
				0
		END)::int2  + 
	
		(CASE
			WHEN (order_keyword_10_1 LIKE likequery(_normalize_keyword('単3')) OR order_keyword_10_1 LIKE likequery(_normalize_keyword('単3電池')) OR order_keyword_10_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_10_1 LIKE likequery(_normalize_keyword('電池単三')))
				THEN 10 * 0.9
			ELSE
				0
		END)::int2  + 
	
		(CASE
			WHEN (order_keyword_7_1 LIKE likequery(_normalize_keyword('単3')) OR order_keyword_7_1 LIKE likequery(_normalize_keyword('単3電池')) OR order_keyword_7_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_7_1 LIKE likequery(_normalize_keyword('電池単三')))
				THEN 7 * 0.9
			ELSE
				0
		END)::int2  + 
	
		(CASE
			WHEN (order_keyword_5_1 LIKE likequery(_normalize_keyword('単3')) OR order_keyword_5_1 LIKE likequery(_normalize_keyword('単3電池')) OR order_keyword_5_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_5_1 LIKE likequery(_normalize_keyword('電池単三')))
				THEN 5 * 0.9
			ELSE
				0
		END)::int2  + 
	
		(CASE
			WHEN (order_keyword_3_1 LIKE likequery(_normalize_keyword('単3')) OR order_keyword_3_1 LIKE likequery(_normalize_keyword('単3電池')) OR order_keyword_3_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_3_1 LIKE likequery(_normalize_keyword('電池単三')))
				THEN 3 * 0.9
			ELSE
				0
		END)::int2  + 
	
		(CASE
			WHEN (order_keyword_2_1 LIKE likequery(_normalize_keyword('単3')) OR order_keyword_2_1 LIKE likequery(_normalize_keyword('単3電池')) OR order_keyword_2_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_2_1 LIKE likequery(_normalize_keyword('電池単三')))
				THEN 2 * 0.9
			ELSE
				0
		END)::int2  + 
	
		(CASE
			WHEN (order_keyword_1_1 LIKE likequery(_normalize_keyword('単3')) OR order_keyword_1_1 LIKE likequery(_normalize_keyword('単3電池')) OR order_keyword_1_1 LIKE likequery(_normalize_keyword('単三')) OR order_keyword_1_1 LIKE likequery(_normalize_keyword('電池単三')))
				THEN 1 * 0.9
			ELSE
				0
		END)::int2 
	
	
		+
		(CASE
			WHEN (length(ja_normalize('単3')) > 0 AND ARRAY[ja_normalize('単3')] <@ ary_word OR length(ja_normalize('単3電池')) > 0 AND ARRAY[ja_normalize('単3電池')] <@ ary_word OR length(ja_normalize('単三')) > 0 AND ARRAY[ja_normalize('単三')] <@ ary_word OR length(ja_normalize('電池単三')) > 0 AND ARRAY[ja_normalize('電池単三')] <@ ary_word)
				THEN 15 * 0.9
			ELSE
				0
		END)
	
	
	, 
		(CASE
		WHEN (display_article = '単3' OR display_article = '単3電池' OR display_article = '単三' OR display_article = '電池単三')
			THEN 100 * 0.9
		ELSE
			0
		END)::int2  + 
	
	
		(CASE
		WHEN (pord_cd = '単3' OR pord_cd = '単3電池' OR pord_cd = '単三' OR pord_cd = '電池単三')
			THEN 100 * 0.9
		ELSE
			0
		END)::int2 
	

		]::_int4)::int2
	) AS keywordOrderWeight

		

FROM(
	SELECT
		*
	FROM
		_search_item_cy3


	WHERE
		(((search_keyword LIKE likequery(_normalize_keyword('単三電池'))) OR search_keyword LIKE likequery(_normalize_keyword('単3')) OR search_keyword LIKE likequery(_normalize_keyword('単3電池')) OR search_keyword LIKE likequery(_normalize_keyword('単三')) OR search_keyword LIKE likequery(_normalize_keyword('電池単三'))))
		
			AND (ary_category_index && ARRAY[1])
			
			AND is_oc_only IS FALSE
		
		
)S





		)
		SELECT
			
			uniq(array_agg(KWD.item_index ORDER BY KWD.item_index)) AS ary_item_index
			
			,KWD.series_index
			,(row_number()
				OVER (ORDER BY first(dad_flg ORDER BY dad_flg NULLS LAST)
,first(keywordOrderWeight ORDER BY keywordOrderWeight)
,first(sort_recommend_index ORDER BY sort_recommend_index) NULLS LAST, KWD.series_index))::int4 AS sort_order
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
			10
		OFFSET
			0

		), S AS (
			SELECT
				
				unnest(ary_item_index) AS item_index
				
				,series_index
				,sort_order
			FROM 
				SEARCH
		)
		SELECT
			
				(CASE WHEN COUNT(MI.item_index) > 1
					THEN coalesce(first(MS.series_name), (array_agg(MI.article_name ORDER BY MI.series_order_index))[1] || '等')
					ELSE first(MI.article_name)
				END) AS name
				,(CASE WHEN COUNT(MI.item_index) > 1
					THEN first(MS.series_cd)
					ELSE first(MI.formal_article)
				END) AS code
				,(CASE WHEN COUNT(MI.item_index) > 1
					THEN first(MS.series_cd)
					ELSE first(MI.trusco_mng_article)
				END) AS trusco_mng_article
				,first(MS.series_index) AS series_index
				,(CASE WHEN COUNT(MI.item_index) > 1
					THEN TRUE
					ELSE FALSE
				END) AS is_series
				,first(MI.has_series) AS has_series
				,first(MI.series_cd) AS series_cd
				,(CASE WHEN array_length(first(MI.ary_group_index), 1) > 0 THEN TRUE ELSE FALSE END) AS has_ary_group_index
				,coalesce(first(MI.image_file ORDER BY MI.series_order_index), '') AS imagename
				,coalesce(first(MI.image_file_large ORDER BY MI.series_order_index), '') AS imagename_large
				,coalesce(first(MI.logo ORDER BY MI.series_order_index), '') AS logoname
				,coalesce(first(MI.feature ORDER BY MI.series_order_index), '') AS features
				,uniq(sort(array_accumArray(MI.ary_page_cy2))) AS ary_page  -- オレンジブックページ
				,(first(MI.price ORDER BY MI.price))::text AS min_regularprice
				,coalesce(first(MI.digital_catalog_link ORDER BY MI.series_order_index), '') AS digital_catalog_link
				
				,(CASE
					WHEN first(is_item_other_entry ORDER BY MI.series_order_index) IS TRUE
						THEN coalesce(first(MI.maker_name), '')
					ELSE
						coalesce(first(MM.name), '')
				END) AS makername
				,coalesce(first(MBM.brand_spec_value ORDER BY MI.series_order_index), '') AS makercond
				,coalesce(first(DSS.json_common_spec::text ORDER BY MI.series_order_index), '') AS ary_common_spec
				
				,COUNT(MI.item_index) AS numitems
				
				,array_agg(S.sort_order ORDER BY MI.series_order_index) AS ary_numorder 
				,first(S.sort_order) AS numorder 

				
				,first(MS.series_name ORDER BY MI.series_order_index) AS series_name
				,first(MI.maker_product_hp_url ORDER BY MI.series_order_index) AS makerurl
				

				
				,array_agg(coalesce(MI.image_file, '') ORDER BY MI.series_order_index) AS ary_imagename  -- 商品画像パス（配列）
				,array_agg(coalesce(MI.pord_cd, '-') ORDER BY MI.series_order_index) AS ary_pordcd  -- 発注コード
				,array_agg(coalesce(MI.formal_article, '-') ORDER BY MI.series_order_index) AS ary_articlecd
				,array_agg(coalesce(MI.trusco_mng_article, '-') ORDER BY MI.series_order_index) AS ary_trusco_mng_article
				,array_agg(coalesce(MI.option_cd, '-') ORDER BY MI.series_order_index) AS ary_optioncd  -- オプション(OP)
				,array_agg(coalesce(MI.fare, '') ORDER BY MI.series_order_index) AS ary_fare -- 運賃
				,array_agg(stock_num ORDER BY MI.series_order_index) AS ary_stock_num -- 全国在庫数
				,array_agg(coalesce(MI.del_time_flg, '') ORDER BY MI.series_order_index) AS ary_del_time_flg -- 納期フラグ
				,array_agg(coalesce(MI.fare_special_flg, '') ORDER BY MI.series_order_index) AS ary_fare_special_flg -- 運賃別途フラグ
				,array_agg(coalesce(MI.direct_hin_flg, '') ORDER BY MI.series_order_index) AS ary_direct_hin_flg -- 直送品
				,array_agg(coalesce(MI.lgst_dfct_kbn, '') ORDER BY MI.series_order_index)::_text AS ary_lgst_dfct_kbn -- 物流難品区分
				,array_agg(MI.price::text ORDER BY MI.series_order_index) AS ary_price  -- 定価（メーカー希望小売価格）
				,array_agg(coalesce(MI.open_prc_flg, '') ORDER BY MI.series_order_index) AS ary_open_prc_flg  -- オープン価格フラグ
				
				,array_agg(coalesce(comma3(MI.wholesale_price::text), '-') ORDER BY MI.series_order_index) AS ary_wholesale_price -- 卸価格
				
				
				,array_agg(coalesce(prc_unit, '') ORDER BY MI.series_order_index) AS ary_prc_unit -- 価格単位
				,array_agg(coalesce(min_aord_qty, '') ORDER BY MI.series_order_index) AS ary_min_aord_qty -- 最小受注数量（FW）
				,array_agg(coalesce(prc_single_unit_qty, '') ORDER BY MI.series_order_index) AS ary_single_unit_qty -- 価格単品単位数量
				,array_agg(coalesce(prc_single_unit, '') ORDER BY MI.series_order_index) AS ary_single_unit -- 価格単品単位
				,first(DSS.ary_spec_name) as ary_specname
				,first(DSS.ary_spec_index) as ary_spec_index
				,array_agg(DSI.json_item_spec::text ORDER BY MI.series_order_index) as ary_json_item_spec
				,array_agg(DSI.json_item_spec_index::text ORDER BY MI.series_order_index) as ary_json_item_spec_index
				,array_agg(coalesce(MII.next_model, '') ORDER BY MI.series_order_index) as ary_next_model 
				,array_agg( (CASE WHEN MI.dad_flg IS TRUE THEN '1' ELSE '0' END)::text ORDER BY MI.series_order_index) as ary_dad_flg 
				,(CASE WHEN first(MI.dad_flg ORDER BY MI.dad_flg ASC NULLS LAST) IS TRUE THEN '1' ELSE '0' END)::text AS is_dad  -- 廃番フラグ(シリーズ全てが廃番なら1）
				,array_agg(MI.price_change_flg ORDER BY MI.series_order_index)::_text AS ary_price_change_flg -- 価格改定あり

				
				,array_agg(coalesce(MI.article_name, '') ORDER BY MI.series_order_index) AS ary_article_name
				,first(coalesce(MI.all_category_cy3, '') ORDER BY MI.series_order_index) AS all_category

				

				
				,array_agg(coalesce(MI.lgst_stock_color, '') ORDER BY MI.series_order_index) AS ary_stock_color -- 物流在庫色

				
				
				,array_agg(MI.ob_price ORDER BY MI.series_order_index) AS ary_ob_price  -- OB，または，OCで価格が「変動」の場合に表示するオレンジブック価格
				


				

				
				
				,ARRAY[]::_text AS ary_oc_price
				,ARRAY[]::_text AS ary_shipping_fee
				
				,(CASE
					WHEN first(is_item_other_entry) IS TRUE THEN
						(CASE
							WHEN first(MI.stand_dlv_date_lt) IS NOT NULL THEN first(MI.stand_dlv_date_lt)::text || '日'
							ELSE '-'
						END)
					ELSE
						'-'
				END)::text AS standard_del_time  -- 目安納期（個別登録品のみ）
				,(CASE WHEN first(is_item_other_entry) IS TRUE THEN '1' ELSE '0' END) AS is_item_other_entry  -- 個別登録品はシリーズではないので並び順未指定のfirstで問題無し
				,array_agg(((FALSE)) ORDER BY MI.series_order_index) AS ary_hit_inherited_article_flg
				,array_agg(array_to_string(((ARRAY[]::text[])), '###') ORDER BY MI.series_order_index) AS ary_hit_inherited_article

		FROM 
			S
		
		 
		INNER JOIN(
			SELECT
				*
				,
null::text AS other_entry_price
,null::text AS maker_name
,null::text stand_dlv_date_lt

				,FALSE AS is_item_other_entry
			FROM
				_master_item
		)MI USING (item_index)
		
		LEFT JOIN _master_series MS ON (MS.series_index = S.series_index)
		LEFT JOIN _master_maker MM ON (MM.ary_maker_cd && array[MI.maker_cd]::_text)
		LEFT JOIN _master_brand_maker_cy3 MBM ON (MBM.ary_maker_cd && ARRAY[MI.maker_cd]::_text AND ARRAY[MI.brand_index]::_text && MBM.ary_brand_index::_text)
		LEFT JOIN _master_item_inherit MII ON (MII.item_index = MI.item_index)
		
		LEFT JOIN _master_item_inherit_oc MIIOC ON (MIIOC.item_index = MI.item_index)
		
		LEFT JOIN _data_spec_series_cy3 DSS ON (DSS.series_index = S.series_index)
		LEFT JOIN _data_spec_item_cy3 DSI ON (DSI.item_index = MI.item_index)
		GROUP BY
			S.series_index
		ORDER BY
			first(S.sort_order ORDER BY sort_order)
		
		;
