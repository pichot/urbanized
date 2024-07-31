{{  
  config(
    post_hook=[
      spatial_index("dbt_urbanized_fyi._fua_base", "_fua_base", "geom")
    ]
  ) 
}}


select
  max(efua_id) as efua_id,
  max(efua_name) as name,
  array_agg(distinct cntry_iso) as cnt_iso,
  sum(fua_p_2015) as fua_pop,
  st_union(geom) as geom
from fua."2019" group by uc_ids