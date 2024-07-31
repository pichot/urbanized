{{ config(
    pre_hook=[
      "INSTALL h3 FROM community",
      "LOAD h3"
    ],
) }}

SELECT h3_latlng_to_cell(37.7887987, -122.3931578, 9)
