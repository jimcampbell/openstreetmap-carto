@admin-boundaries: #ac46ac;

/* For performance reasons, the admin border layers are split into three groups
for low, middle and high zoom levels.
For each zoomlevel, all borders come from a single attachment, to handle
overlapping borders correctly.
*/

#admin-low-zoom[zoom < 11],
#admin-mid-zoom[zoom >= 11][zoom < 13],
#admin-high-zoom[zoom >= 13] {
  /*
  The following code prevents admin boundaries from being rendered on top of
  each other. Comp-op works on the entire attachment, not on the individual
  border. Therefore, this code generates an attachment containing a set of
  @admin-boundaries/white dashed lines (of which only the top one is visible),
  and with `comp-op: darken` the white part is ignored, while the
  @admin-boundaries colored part is rendered (as long as the background is not
  darker than @admin-boundaries).
  The SQL has `ORDER BY admin_level`, so the boundary with the lowest
  admin_level is rendered on top, and therefore the only visible boundary.
  */
  opacity: 0.4;
  comp-op: darken;
}

#admin-mid-zoom[zoom >= 11][zoom < 13],
#admin-high-zoom[zoom >= 13] {
  opacity: 0.5;
  comp-op: darken;
}

#admin-high-zoom[zoom >= 13] {
  opacity: 0.5;
  comp-op: darken;
}

#admin-text[zoom >= 16] {
  text-name: "[name]";
  text-face-name: @book-fonts;
  text-fill: @admin-boundaries;
  text-halo-radius: @standard-halo-radius;
  text-halo-fill: @standard-halo-fill;
  text-placement: line;
  text-clip: true;
  text-vertical-alignment: middle;
  text-dy: -10;
}

