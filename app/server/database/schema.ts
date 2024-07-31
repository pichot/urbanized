import { sqliteTable, text, integer, real } from 'drizzle-orm/sqlite-core'

export const cities = sqliteTable('cities', {
  efua_id: integer('efua_id').unique().notNull(),
  kontur_pop: integer('kontur_pop'),
  fua_pop: integer('fua_pop'),
  name: text('name'),
  cnt_iso: text('cnt_iso'),
});

export const cities_h3_pop = sqliteTable('cities_h3_pop', {
  h3: text('h3'),
  efua_id: integer('efua_id').unique().notNull(),
  population: integer('pop'),
});
