select 
  efua_id,
  h3_polyfill(geom, 8) as h3_l8 
from {{ ref('_fua_merged') }}