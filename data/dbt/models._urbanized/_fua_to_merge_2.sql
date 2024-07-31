SELECT
	CASE 
		WHEN to_merge THEN (select max(efua_id) from dbt_urbanized_fyi._fua_to_merge where to_merge is true and name = a.name group by name)
		ELSE efua_id
	END as efua_id,
	name,
	cnt_iso,
	fua_pop,
	geom
FROM {{ ref('_fua_to_merge') }} a