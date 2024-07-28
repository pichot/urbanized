import { sqliteTable, text, integer, real } from 'drizzle-orm/sqlite-core'

export const cities = sqliteTable('cities', {
  efua_id: real('efua_id'),
  kontur_pop: integer('kontur_pop'),
  fua_pop: integer('fua_pop'),
  name: text('name'),
  cnt_iso: text('cnt_iso', { mode: 'json' }),
  h3: text('h3', { mode: 'json' }),
  area_km2: real('area_km2'),
  pop_per_km2: real('pop_per_km2')
});
