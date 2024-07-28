<script setup lang="ts">
import maplibregl from 'maplibre-gl';
import 'maplibre-gl/dist/maplibre-gl.css';

onMounted(() => {
  const map = new maplibregl.Map({
    container: 'map',
    style: 'https://tiles.stadiamaps.com/styles/alidade_smooth.json',
    center: [0, 0],
    zoom: 1,
  });

  // map.on('load', () => {
  //   map.addSource('countries', {
  //     type: 'geojson',
  //     data: 'https://d2ad6b4ur7yvpq.cloudfront.net/naturalearth-3.3.0/ne_110m_admin_0_countries.geojson',
  //   });

  //   map.addLayer({
  //     id: 'countries',
  //     type: 'fill',
  //     source: 'countries',
  //     paint: {
  //       'fill-color': '#627BC1',
  //       'fill-opacity': 0.5,
  //     },
  //   });
  // });
});
</script>

<template>
  <div id="map" />
</template>
