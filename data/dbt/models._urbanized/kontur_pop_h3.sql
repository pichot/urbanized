select population, h3_geo_to_h3(st_centroid(geom), 8) as h3_l8 from kontur.population20211109