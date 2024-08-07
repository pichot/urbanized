import { eq } from "drizzle-orm";

export default eventHandler(async (event) => {
  const efua_id = getRouterParam(event, 'efua_id')
  
  const h3_pop = await useDrizzle().query.cities_h3_pop.findMany({
    columns: {
      h3: true,
      population: true
    },
    where: (cities_h3_pop, { eq }) => eq(cities_h3_pop.efua_id, efua_id),
  });

  return h3_pop;
})
