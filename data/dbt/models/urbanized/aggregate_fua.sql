select
  max(efua_id) as efua_id,
  max(efua_name) as name,
  array_agg(distinct cntry_iso) as cnt_iso,
  sum(fua_p_2015) as fua_pop,
  ST_Union_Agg(geom) as geom
from {{ ref('_source_fua') }} group by uc_ids