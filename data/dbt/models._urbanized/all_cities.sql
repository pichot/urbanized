select
	distinct(pop.efua_id)::bigint as id,
	sum(pop.kontur_pop)::integer as kontur_pop,
	max(fua.fua_pop)::integer as fua_pop,
	max(fua.name) as name,
	max(fua.cnt_iso) as cnt_iso,
	array_agg(pop.h3_l8::text) as h3,
	sum(pop.area_km2) as area_km2,
	sum(pop.kontur_pop)::integer / sum(pop.area_km2) as pop_per_km2,
	ST_Union(pop.geom) as geom
from {{ ref('fua_pop') }} pop
join {{ ref('_fua_merged') }} fua on fua.efua_id = pop.efua_id
group by pop.efua_id