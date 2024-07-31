select
  efua_id,
  fua.h3_l8,
  population as kontur_pop,
  h3_cell_area(fua.h3_l8) as area_km2,
  h3_to_geo_boundary_geometry(fua.h3_l8) as geom
from {{ ref('fua_h3') }} fua
left join {{ ref('kontur_pop_h3') }} kontur on fua.h3_l8 = kontur.h3_l8