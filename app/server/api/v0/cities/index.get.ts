import { desc } from 'drizzle-orm'

export default eventHandler(async () => {
  const cities = await useDrizzle().select().from(tables.cities).orderBy(desc(tables.cities.kontur_pop)).limit(10)

  return cities
})
