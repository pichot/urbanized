<script setup lang="ts">
import type { City } from '@/server/utils/drizzle'

const { data: cities } = await useAsyncData('cities', async () => {
  return $fetch('/api/v0/cities')
}) as { data: City[] }
</script>

<template>
  <div>
    <ul>
      <li 
        v-for="city in cities"
        :key="city.efua_id"
      >
        <ULink :to="`/cities/${city.efua_id}`">
          {{ city.name }}
          {{ compactInteger(city.kontur_pop, 1) }}
        </ULink>
      </li>
    </ul>

    <Map 
      class="mt-4 min-h-[640px]"
    />
  </div>
</template>
