<script setup lang="ts">
import  { MapboxOverlay } from '@deck.gl/mapbox';
import { H3HexagonLayer, H3ClusterLayer } from '@deck.gl/geo-layers';
import maplibregl from 'maplibre-gl';
import 'maplibre-gl/dist/maplibre-gl.css';

import type { CityH3Pop } from '@/server/utils/drizzle'

const props = defineProps<{
  h3_pop: CityH3Pop[];
}>();

onMounted(async () => {
  const map = new maplibregl.Map({
    container: 'city-map',
    style: 'https://tiles-eu.stadiamaps.com/styles/osm_bright.json',
    center: [0, 0],
    zoom: 1,
  });

  await map.once('load');

  const deckOverlay = new MapboxOverlay({
    interleaved: false,
    layers: [
      // new H3HexagonLayer<CityH3Pop>({
      //   id: 'H3HexagonLayer',
      //   data: props.h3_pop,

      //   extruded: true,
      //   getHexagon: (d: CityH3Pop) => d.h3,
      //   getFillColor: (d: CityH3Pop) => [255, (1 - d.population / 500) * 255, 0],
      //   getElevation: (d: CityH3Pop) => d.population,
      //   elevationScale: 20,
      //   pickable: true
      // })
      new H3ClusterLayer<CityH3Pop>({
        id: 'H3ClusterLayer',
        data: props.h3_pop,

        getHexagons: (d: CityH3Pop) => [d.h3],
        getFillColor: (d: CityH3Pop) => [255, (1 - d.population / 5000) * 255, 0],
        getLineColor: [255, 255, 255],
        pickable: true,
        opacity: 0.8,
      })
    ]
  });

  map.addControl(deckOverlay);
});
</script>

<template>
  <div id="city-map" />
</template>
