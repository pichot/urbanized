<script setup lang="ts">
import type { City } from '@/server/utils/drizzle'

const { data: cities } = await useAsyncData('cities', async () => {
  return $fetch('/api/v0/cities')
})
</script>

<template>
  <UContainer class="text-center mt-4">
    <h1 class="text-lg">
      urbanized.🌎
    </h1>
    <h2>an atlas of urban complexity</h2>

    <ul>
      <li 
        v-for="city in cities"
        :key="city.efua_id"
      >
        {{ city.name }}
        {{ city.kontur_pop }}
      </li>
    </ul>

    <Map 
      class="mt-4 min-h-[640px]"
    />
  </UContainer>
</template>
