import { eq } from "drizzle-orm";

export default eventHandler(async (event) => {
  const efua_id = getRouterParam(event, 'efua_id')
  
  const city = await useDrizzle().query.cities.findFirst({
    where: (cities, { eq }) => eq(cities.efua_id, efua_id)
  });

  return city;
})
