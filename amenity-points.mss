@marina-text: #576ddf; // also swimming_pool
@wetland-text: darken(#4aa5fa, 25%); /* Also for marsh and mud */
@shop-icon: #ac39ac;
@shop-text: #939;
@transportation-icon: #0092da;
@transportation-text: #0066ff;
@airtransport: #8461C4;
@health-color: #da0092;
@amenity-brown: #734a08;
@man-made-icon: #555;
@landform-color: #d08f55;

@landcover-font-size: 10;
@landcover-font-size-big: 12;
@landcover-font-size-bigger: 15;
@landcover-wrap-width-size: 25;
@landcover-wrap-width-size-big: 35;
@landcover-wrap-width-size-bigger: 45;
@landcover-face-name: @oblique-fonts;

@standard-wrap-width: 30;
@standard-text-size: 10;
@standard-font: @book-fonts;

/* Note that .points is also used in water-features.mss */
.points {
  [feature = 'man_made_windmill'][zoom >= 16] {
    marker-file: url('symbols/windmill.svg');
    marker-placement: interior;
    marker-fill: @amenity-brown;
    marker-clip: false;
  }

  [feature = 'amenity_hunting_stand'][zoom >= 16] {
    marker-file: url('symbols/hunting_stand.svg');
    marker-fill: @man-made-icon;
    marker-placement: interior;
    marker-clip: false;
  }
}

.amenity-low-priority {
  [feature = 'amenity_waste_basket'][zoom >= 19]::amenity {
    marker-file: url('symbols/waste_basket.10.svg');
    marker-fill: @amenity-brown;
    marker-placement: interior;
  }
}

/* Note that .text is also used in water.mss */
.text-low-zoom[zoom < 10],
.text[zoom >= 10] {
  [feature = 'place_island'][zoom >= 7][way_pixels > 3000][way_pixels < 800000],
  [feature = 'place_island'][zoom >= 16][way_pixels < 800000],
  [feature = 'place_islet'][zoom >= 14][way_pixels > 3000][way_pixels < 800000],
  [feature = 'place_islet'][zoom >= 17][way_pixels < 800000] {
    text-name: "[name]";
    text-fill: #a5a5a5;
    text-size: @standard-text-size;
    [way_pixels > 12000] { text-size: 12; }
    [way_pixels > 48000] { text-size: 15; }
    text-face-name: @oblique-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-wrap-width: @standard-wrap-width;
    text-placement: interior;
  }

  [feature = 'natural_bay'][zoom >= 14],
  [feature = 'natural_spring'][zoom >= 16] {
    text-name: "[name]";
    text-size: 10;
    text-fill: @water-text;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-wrap-width: @standard-wrap-width;
    text-placement: interior;
    [feature = 'natural_spring'] {
      text-dy: 6;
    }
  }

}

