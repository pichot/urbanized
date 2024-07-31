SELECT
	A.*,
  B.to_merge
FROM
    {{ ref('_fua_base') }} A
LEFT JOIN lateral (
	select Distinct A.efua_id as efua_id,
    true as to_merge from {{ ref('_fua_base') }} B WHERE ST_DistanceSphere(A.geom, B.geom) < 1000 AND A.name = B.name AND A.fua_pop != B.fua_pop
) B on A.efua_id = B.efua_id