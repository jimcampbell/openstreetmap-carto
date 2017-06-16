// --- Parks, woods, other green things ---

@grass: #cdebb0; // also meadow, common, garden, village_green
@scrub: #b5e3b5;
@forest: #add19e;       // Lch(80,30,135)
@forest-text: #46673b;  // Lch(40,30,135)
@park: #f4f9f5;         // Lch(94,30,145) also recreation_ground
@orchard: #aedfa3; // also vineyard, plant_nursery

// --- "Base" landuses ---

@residential: #e0dfdf;      // Lch(89,0,0)
@residential-line: #b9b9b9; // Lch(75,0,0)
@retail: #ffd6d1;           // Lch(89,16,30)
@retail-line: #d99c95;      // Lch(70,25,30)
@commercial: #f2dad9;       // Lch(89,8.5,25)
@commercial-line: #d1b2b0;  // Lch(75,12,25)
@industrial: #e0e0e0;       // Lch(89,9,330) (Also used for railway)
@industrial-line: #c6b3c3;  // Lch(75,11,330) (Also used for railway-line)
@farmland: #fbecd7;         // Lch(94,12,80)
@farmland-line: #d6c4ab;    // Lch(80,15,80)
@farmyard: #f5dcba;         // Lch(89,20,80)
@farmyard-line: #d1b48c;    // Lch(75,25,80)

// --- Transport ----

@aerodrome: #e9e7e2;
@apron: #e9d1ff;
@garages: #dfddce;
@parking: #f7efb7;
@railway: @industrial;
@railway-line: @industrial-line;
@rest_area: #efc8c8; // also services
@station: #d4aaaa;

// --- Other ----

@allotments: #eecfb3;       // Lch(85,19,70)
@bare_ground: #eee5dc;
@campsite: #f4f9f5; // also caravan_site, picnic_site
@cemetery: #f4f9f5; // also grave_yard
@construction: #c7c7b4; // also brownfield
@danger_area: pink;
@heath: #d6d99f;
@mud: rgba(203,177,154,0.3); // produces #e6dcd1 over @land
@place_of_worship: #cdccc9;
@place_of_worship_outline: #111;
@playground: lighten(@park, 5%);
@power: darken(@industrial, 5%);
@power-line: darken(@industrial-line, 5%);
@sand: #f5e9c6;
@societal_amenities: #f0f0d8;
@tourism: #e0e0e0;
@quarry: #c5c3c3;
@military: #f55;
@beach: #fff1ba;

// --- Sports ---

@pitch: #aae0cb; // also track
@track: @pitch;
@stadium: @societal_amenities; // also fitness_centre and sports_centre
@golf_course: #b5e3b5;

#landcover-low-zoom[zoom < 10],
#landcover[zoom >= 10] {

  ::first {
    [feature = 'wetland_mud'],
    [feature = 'wetland_tidalflat'] {
      [zoom >= 9] {
        polygon-fill: @mud;
        [way_pixels >= 4]  { polygon-gamma: 0.75; }
        [way_pixels >= 64] { polygon-gamma: 0.3;  }
      }
    }
  }


  [feature = 'landuse_cemetery'],
  [feature = 'amenity_grave_yard'] {
    [zoom >= 10] {
      polygon-fill: @cemetery;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

}

/* man_made=cutline */
#landcover-line {
  [zoom >= 14] {
    line-width: 3;
    line-join: round;
    line-cap: square;
    line-color: @grass;
    [zoom >= 16] {
      line-width: 6;
      [zoom >= 18] {
        line-width: 12;
      }
    }
  }
}

#landcover-area-symbols {

  //Also landuse = forest, converted in the SQL
}

#landuse-overlay {
  [landuse = 'military'][zoom >= 20][way_pixels > 75] {
    polygon-pattern-file: url('symbols/military_red_hatch.png');
    polygon-pattern-alignment: global;
    line-color: @military;
    line-width: 3;
    line-opacity: 0.329;
  }
}

#cliffs {
  [natural = 'cliff'][zoom >= 13] {
    line-pattern-file: url('symbols/cliff.svg');
    [zoom >= 15] {
      line-pattern-file: url('symbols/cliff2.svg');
    }
  }
  [man_made = 'embankment'][zoom >= 15]::man_made {
    line-pattern-file: url('symbols/embankment.svg');
  }
}

#area-barriers {
  [zoom >= 16] {
    line-color: #444;
    line-width: 0.4;
    [feature = 'barrier_hedge'] {
      polygon-fill: #aed1a0;
    }
  }
}

.barriers {
  [zoom >= 16] {
    line-width: 0.4;
    line-color: #444;
  }
  [feature = 'barrier_embankment'][zoom >= 14] {
    line-width: 0.4;
    line-color: #444;
  }
  [feature = 'barrier_hedge'][zoom >= 16] {
    line-width: 3;
    line-color: #aed1a0;
  }
  [feature = 'historic_citywalls'],
  [feature = 'barrier_city_wall'] {
    [zoom >= 15] {
      line-width: 1.5;
      line-color: lighten(#444, 30%);
    }

    [zoom >= 17] {
      line-width: 3;
      barrier/line-width: 0.4;
      barrier/line-color: #444;
    }
  }
}

#tourism-boundary {
  [tourism = 'zoo'][zoom >= 10][way_pixels >= 20],
  [tourism = 'theme_park'][zoom >= 10][way_pixels >= 20] {
    a/line-width: 1;
    a/line-offset: -0.5;
    a/line-color: @tourism;
    a/line-opacity: 0.5;
    a/line-join: round;
    a/line-cap: round;
    [zoom >= 17],
    [way_pixels >= 60] {
      b/line-width: 4;
      b/line-offset: -2;
      b/line-color: @tourism;
      b/line-opacity: 0.3;
      b/line-join: round;
      b/line-cap: round;    
    }
    [zoom >= 17] {
      a/line-width: 2;
      a/line-offset: -1;
      b/line-width: 6;
      b/line-offset: -3;
    }
  }
}

#text-line {
  [feature = 'natural_cliff'][zoom >= 15],
  [feature = 'man_made_embankment'][zoom >= 15] {
    text-name: "[name]";
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-fill: #999;
    text-size: 10;
    text-face-name: @book-fonts;
    text-placement: line;
    text-dy: 8;
    text-vertical-alignment: middle;
    text-spacing: 400;
  }
}
