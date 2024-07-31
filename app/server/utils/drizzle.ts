import { drizzle } from 'drizzle-orm/d1'
export { sql, eq, and, or } from 'drizzle-orm'

import * as schema from '../database/schema'

export const tables = schema

export function useDrizzle() {
  return drizzle(hubDatabase(), { schema })
}

export type City = typeof schema.cities.$inferSelect
export type CityH3Pop = typeof schema.cities_h3_pop.$inferSelect
