<script setup lang="ts">
import  { MapboxOverlay } from '@deck.gl/mapbox';
import { H3HexagonLayer } from '@deck.gl/geo-layers';
import maplibregl from 'maplibre-gl';
import 'maplibre-gl/dist/maplibre-gl.css';

type DataType = {
  hex: string;
  count: number;
};

onMounted(async () => {
  const map = new maplibregl.Map({
    container: 'map',
    style: 'https://tiles-eu.stadiamaps.com/styles/osm_bright.json',
    center: [0, 0],
    zoom: 1,
  });

  await map.once('load');

  const deckOverlay = new MapboxOverlay({
    interleaved: false,
    layers: [
      new H3HexagonLayer<DataType>({
        id: 'H3HexagonLayer',
        data: 'https://raw.githubusercontent.com/visgl/deck.gl-data/master/website/sf.h3cells.json',

        extruded: true,
        getHexagon: (d: DataType) => d.hex,
        getFillColor: (d: DataType) => [255, (1 - d.count / 500) * 255, 0],
        getElevation: (d: DataType) => d.count,
        elevationScale: 20,
        pickable: true
      })
    ]
  });

  map.addControl(deckOverlay);
});
</script>

<template>
  <div id="map" />
</template>
