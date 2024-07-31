select *
from {{ ref('all_cities') }}
where kontur_pop is not null and name <> 'UNNAMED'
order by fua_pop desc
limit 2000