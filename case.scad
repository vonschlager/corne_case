$fn = 50;

case_wall_width = 2.00;

base_height = 3.00;

base_main_x = 133.95;
base_main_y = 56.45;
base_main_height = base_height;

base_upper_left_margin = 38.00;

base_upper_first_x = 19.00;
base_upper_first_y = 4.75;
base_upper_first_height = base_height;

base_upper_second_x = 18.20;
base_upper_second_y = 7.00;
base_upper_second_height = base_height;

base_upper_third_x = 19.00;
base_upper_third_y = 4.75;
base_upper_third_height = base_height;

base_upper_fourth_x = 19.00;
base_upper_fourth_y = 2.25;
base_upper_fourth_height = base_height;

base_lower_alpha_y = 14.75;
base_lower_beta_y = 19.60;
base_lower_gamma_y = 28.66;

base_lower_left_margin = 66.55;

base_lower_first_x = 18.25;
base_lower_first_height = base_height;
base_lower_first_angle = 36.0;

base_lower_second_x = 38.00;
base_lower_second_x_ext = 8.00;
base_lower_second_height = base_height;
base_lower_second_angle = -7.5;

base_lower_third_x = 18.18;
base_lower_third_y = 28.20;
base_lower_third_height = base_height;
base_lower_third_angle = -22.1;

base_lower_fourth_x = 50.00;
base_lower_fourth_y = 4.17;
base_lower_fourth_height = base_height;

wall_thicknes = 2.00;

module base_main() {
    cube([base_main_x, base_main_y, base_main_height]);
}

module base_upper() {
    translate([base_upper_left_margin, base_main_y, 0]) {
        cube([base_upper_first_x, base_upper_first_y, base_upper_first_height]);
        translate([base_upper_first_x, 0, 0]) {
            cube([base_upper_second_x, base_upper_second_y, base_upper_second_height]);
        }
        translate([base_upper_first_x+base_upper_second_x, 0, 0]) {
            cube([base_upper_third_x, base_upper_third_y, base_upper_third_height]);
        }
        translate([base_upper_first_x+base_upper_second_x+base_upper_third_x, 0, 0]) {
            cube([base_upper_fourth_x, base_upper_fourth_y, base_upper_fourth_height]);
        }
    }
}

module base_lower() {
    translate([base_lower_left_margin, 0, 0]) {
        translate([0, base_lower_gamma_y-base_lower_alpha_y, 0]) {
            rotate([0, 0, base_lower_first_angle]) {
                cube([base_lower_first_x, base_lower_first_x, base_lower_first_height]);
            }
            rotate([0, 0, base_lower_second_angle]) {
                cube([base_lower_second_x+base_lower_second_x_ext, base_lower_second_x, base_lower_second_height]);
            }
            rotate([0, 0, base_lower_second_angle]) {
                translate([base_lower_second_x, 0, 0]) {
                    rotate([0, 0, base_lower_third_angle]) {
                        cube([base_lower_third_x, base_lower_third_y, base_lower_third_height]);
                    }
                }
            }
        }
        translate([base_main_x-base_lower_left_margin-base_lower_fourth_x, base_lower_gamma_y-base_lower_fourth_y, 0]) {
            cube([base_lower_fourth_x, base_lower_fourth_y, base_lower_fourth_height]);
        }
    }
}

widgets_cutout_margin_left = 114.59;
widgets_cutout_margin_bottom = 4.43;
widgets_cutout_x = 19.32;
widgets_cutout_y = 51.98;
widgets_cutout_height = base_height + 1;

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
standoff_height = 4.00;

module standoff(height)
{
    cylinder(h = standoff_height, d = standoff_diameter);
}

module standoffs() {
    translate([0, 0, base_height]) {
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
switch_height = base_height + standoff_height + 1;

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

module base() {
    translate([0, base_lower_gamma_y, 0]) {
        base_upper();
        base_main();
        standoffs();
    }
    base_lower();
}

module cutouts() {
    translate([0, base_lower_gamma_y, 0]) {
        switches();
        widgets_cutout();
    }
}

module case() {
    difference() {
        base();
        cutouts();
    }
}

case();
