<script setup lang="ts">
const { params } = useRoute()
const efua_id = params.efua_id as string

const { data: city } = await useAsyncData(`city-${efua_id}`, async () => {
  return $fetch(`/api/v0/cities/${efua_id}`)
})

const { data: h3_pop } = await useAsyncData(`h3_pop-${efua_id}`, async () => {
  return $fetch(`/api/v0/cities/h3_pop/${efua_id}`)
})
</script>

<template>
<h1>{{ city.name }}</h1>

<CityMap 
  :h3_pop="h3_pop"
  class="mt-4 min-h-[640px]"
/>
</template>