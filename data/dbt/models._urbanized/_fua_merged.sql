SELECT
  max(efua_id) as efua_id,
  max(name) as name,
  array_agg(distinct cnt) as cnt_iso,
  sum(fua_pop) as fua_pop,
  st_union(geom) as geom
FROM {{ ref('_fua_to_merge_2') }} A, unnest(cnt_iso) cnt
GROUP BY efua_id