CREATE INDEX supplier_id
ON supplier(supplier_id);

CREATE INDEX nyc_on_hand
ON part_nyc(on_hand);

CREATE INDEX sfo_on_hand
ON part_sfo(on_hand);

CREATE INDEX color_id
ON color(color_id);

CREATE INDEX nyc_color
ON part_nyc(on_hand);

CREATE INDEX sfo_color
ON part_sfo(on_hand);

CREATE INDEX color_name
ON color(color_name);

CREATE INDEX supplier_name
ON supplier(supplier_name);

CREATE INDEX nyc_part_number
ON part_nyc(part_number);

CREATE INDEX sfo_part_number
ON part_sfo(part_number);

CREATE INDEX supplier_sfo
ON part_sfo(supplier);

CREATE INDEX supplier_nyc
ON part_nyc(supplier);
