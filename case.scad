$fn = 50;

plate = 3;
height = 15;
wall = 2;
radious = wall;

inner_shape = [
    [0,0],
    [55.75,0],
    [66.60,-14.70],
    [103.90,-19.58],
    [119.72,-28.64],
    [133.91,-3.97],
    [133.91,56.41],
    [113.16,56.41],
    [113.16,58.66],
    [94.16,58.66],
    [94.16,61.16],
    [75.16,61.16],
    [75.16,63.41],
    [57.00,63.41],
    [57.00,61.16],
    [38.00,61.16],
    [38.00,56.41],
    [0,56.41]
];

module base_inner() {
    translate([0, 0, plate]) {
        linear_extrude(height=height) {
            polygon(inner_shape);
        }
    }
}

module base_outer() {
    minkowski() {
        linear_extrude(height=height) {
        translate([-wall, -wall, 0]) {
                polygon(inner_shape);
            }
        }
        translate ([radious, radious, 0]) {
            cylinder(r = radious, h = 0.1);
        }
    }
}

widgets_cutout_margin_left = 114.59;
widgets_cutout_margin_bottom = 4.43;
widgets_cutout_x = 19.32;
widgets_cutout_y = 51.98;
widgets_cutout_height = plate + 1;

module widgets_cutout() {
    translate([widgets_cutout_margin_left, widgets_cutout_margin_bottom, -0.5]) {
        cube([widgets_cutout_x, widgets_cutout_y, widgets_cutout_height]);
    }
}

standoff_margin_first_left = 18.58;
standoff_margin_first_bottom = 37.57;
standoff_margin_second_left = 37.58;
standoff_margin_second_bottom = 37.57;
standoff_margin_third_left = 18.58;
standoff_margin_third_bottom = 18.82;
standoff_margin_fourth_left = 37.58;
standoff_margin_fourth_bottom = 18.82;
standoff_margin_fifth_left = 61.83;
standoff_margin_fifth_bottom = 1.58;
standoff_margin_sixth_left = 94.58;
standoff_margin_sixth_bottom = 41.33;
standoff_margin_seventh_left = 108.33;
standoff_margin_seventh_bottom = -6.17;
standoff_diameter = 4.20;
standoff_radious = standoff_diameter / 2;
standoff_height = height;

module standoff(height)
{
    cylinder(h = standoff_height, d = standoff_diameter);
}

module standoffs() {
    translate([0, 0, plate]) {
        // first
        translate([standoff_margin_first_left, standoff_margin_first_bottom, 0]) {
            standoff();
        }
        // second
        translate([standoff_margin_second_left, standoff_margin_second_bottom, 0]) {
            standoff();
        }
        // third
        translate([standoff_margin_third_left, standoff_margin_third_bottom, 0]) {
            standoff();
        }
        // fourth
        translate([standoff_margin_fourth_left, standoff_margin_fourth_bottom, 0]) {
            standoff();
        }
        // fifth
        translate([standoff_margin_fifth_left, standoff_margin_fifth_bottom, 0]) {
            standoff();
        }
        // sixth
        translate([standoff_margin_sixth_left, standoff_margin_sixth_bottom, 0]) {
            standoff();
        }
        // seventh
        translate([standoff_margin_seventh_left, standoff_margin_seventh_bottom, 0]) {
            standoff();
        }
    }
}

switch_cutout = 1.6;
switch_holesize = 14;
switch_height = plate + standoff_height + 1;

module switch() {
    union() {
        translate([0, 0, 0]) {
            translate([switch_cutout / 2, 0, -0.5]) {
                cube([switch_holesize, switch_holesize, switch_height]);
            }
            translate([0, 0.98, -0.5]) {
                cube([switch_holesize + switch_cutout, 3.5, switch_height]);
            }
            translate([0, switch_holesize - 3.5 - 0.98, -0.5]) {
                cube([switch_holesize + switch_cutout, 3.5, switch_height]);
            }
        }
    }
}

switch_cutout_width = switch_cutout + switch_holesize;
switch_cutout_height = switch_holesize;
switch_center_diff_width = switch_cutout_width / 2;
switch_center_diff_height = switch_cutout_height / 2;
switches_first_column_margin_left = 9.08 - switch_center_diff_width;
switches_first_column_first_switch_margin_bottom = 9.205 - switch_center_diff_height;
switches_first_column_second_switch_margin_bottom = 28.205 - switch_center_diff_height;
switches_first_column_third_switch_margin_bottom = 47.205 - switch_center_diff_height;
switches_second_column_margin_left = 28.08 - switch_center_diff_width;
switches_second_column_first_switch_margin_bottom = 9.205 - switch_center_diff_height;
switches_second_column_second_switch_margin_bottom = 28.205 - switch_center_diff_height;
switches_second_column_third_switch_margin_bottom = 47.205 - switch_center_diff_height;
switches_third_column_margin_left = 47.08 - switch_center_diff_width;
switches_third_column_first_switch_margin_bottom = 13.955 - switch_center_diff_height;
switches_third_column_second_switch_margin_bottom = 32.955 - switch_center_diff_height;
switches_third_column_third_switch_margin_bottom = 51.955 - switch_center_diff_height;
switches_fourth_column_margin_left = 66.08 - switch_center_diff_width;
switches_fourth_column_first_switch_margin_bottom = 16.33 - switch_center_diff_height;
switches_fourth_column_second_switch_margin_bottom = 35.33 - switch_center_diff_height;
switches_fourth_column_third_switch_margin_bottom = 54.33 - switch_center_diff_height;
switches_fifth_column_margin_left = 85.08 - switch_center_diff_width;
switches_fifth_column_first_switch_margin_bottom = 13.955 - switch_center_diff_height;
switches_fifth_column_second_switch_margin_bottom = 32.955 - switch_center_diff_height;
switches_fifth_column_third_switch_margin_bottom = 51.955 - switch_center_diff_height;
switches_sixth_column_margin_left = 104.08 - switch_center_diff_width;
switches_sixth_column_first_switch_margin_bottom = 11.58 - switch_center_diff_height;
switches_sixth_column_second_switch_margin_bottom = 30.58 - switch_center_diff_height;
switches_sixth_column_third_switch_margin_bottom = 49.58 - switch_center_diff_height;
switches_first_bottom_margin_left = 75.58 - switch_center_diff_width;
switches_first_bottom_margin_bottom = -5.67 - switch_center_diff_height;
switches_second_bottom_angle = -15.00;
switches_second_bottom_margin_left_shift = 1.50;
switches_second_bottom_margin_left = 96.57 - switch_center_diff_width - switches_second_bottom_margin_left_shift;
switches_second_bottom_margin_bottom_shift = 2.20;
switches_second_bottom_margin_bottom = -8.42 - switch_center_diff_height + switches_second_bottom_margin_bottom_shift;
switches_third_bottom_angle = 59.50;
switches_third_bottom_margin_left_shift = 10.00;
switches_third_bottom_margin_left = 118.83 - switch_center_diff_width + switches_third_bottom_margin_left_shift;
switches_third_bottom_margin_bottom_shift = -3.00;
switches_third_bottom_margin_bottom = -12.17 - switch_center_diff_height + switches_third_bottom_margin_bottom_shift;

module switches() {
    // first column
    translate([switches_first_column_margin_left, 0, 0]) {
        translate([0, switches_first_column_first_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_first_column_second_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_first_column_third_switch_margin_bottom, 0]) {
            switch();
        }
    }
    // second column
    translate([switches_second_column_margin_left, 0, 0]) {
        translate([0, switches_second_column_first_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_second_column_second_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_second_column_third_switch_margin_bottom, 0]) {
            switch();
        }
    }
    // third column
    translate([switches_third_column_margin_left, 0, 0]) {
        translate([0, switches_third_column_first_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_third_column_second_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_third_column_third_switch_margin_bottom, 0]) {
            switch();
        }
    }
    // fourth column
    translate([switches_fourth_column_margin_left, 0, 0]) {
        translate([0, switches_fourth_column_first_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_fourth_column_second_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_fourth_column_third_switch_margin_bottom, 0]) {
            switch();
        }
    }
    // fifth column
    translate([switches_fifth_column_margin_left, 0, 0]) {
        translate([0, switches_fifth_column_first_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_fifth_column_second_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_fifth_column_third_switch_margin_bottom, 0]) {
            switch();
        }
    }
    // sixth column
    translate([switches_sixth_column_margin_left, 0, 0]) {
        translate([0, switches_sixth_column_first_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_sixth_column_second_switch_margin_bottom, 0]) {
            switch();
        }
        translate([0, switches_sixth_column_third_switch_margin_bottom, 0]) {
            switch();
        }
    }
    // first bottom
    translate([switches_first_bottom_margin_left, switches_first_bottom_margin_bottom, 0]) {
        switch();
    }
    // second bottom
    translate([switches_second_bottom_margin_left, switches_second_bottom_margin_bottom, 0]) {
        rotate([0, 0, switches_second_bottom_angle]) {
            switch();
        }
    }
    // third bottom
    translate([switches_third_bottom_margin_left, switches_third_bottom_margin_bottom, 0]) {
        rotate([0, 0, switches_third_bottom_angle]) {
            switch();
        }
    }
}

module diagonal_cut() {
    translate([-20, -50, 5.00]) {
        rotate([5, 0, 0]) {
            cube([170, 150, 20]);
        }
    }
}

module case() {
    difference() {
        union() {
            difference() {
                base_outer();
                base_inner();
            };
            standoffs();
        }
        switches();
        widgets_cutout();
        diagonal_cut();
    }
}

case();
