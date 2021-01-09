$fn = 48;

base_main_x = 133.95;
base_main_y = 56.45;
base_main_z = 1.00;

base_upper_left_margin = 38.00;

base_upper_first_x = 19.00;
base_upper_first_y = 4.75;
base_upper_first_z = 1.00;

base_upper_second_x = 18.20;
base_upper_second_y = 7.00;
base_upper_second_z = 1.00;

base_upper_third_x = 19.00;
base_upper_third_y = 4.75;
base_upper_third_z = 1.00;

base_upper_fourth_x = 19.00;
base_upper_fourth_y = 2.25;
base_upper_fourth_z = 1.00;

base_lower_alpha_y = 14.75;
base_lower_beta_y = 19.60;
base_lower_gamma_y = 28.66;

base_lower_left_margin = 66.55;

base_lower_first_x = 18.25;
base_lower_first_z = 1.00;
base_lower_first_angle = 36.0;

base_lower_second_x = 38.00;
base_lower_second_x_ext = 8.00;
base_lower_second_z = 1.00;
base_lower_second_angle = -7.5;

base_lower_third_x = 18.18;
base_lower_third_y = 28.20;
base_lower_third_z = 1.00;
base_lower_third_angle = -22.1;

base_lower_fourth_x = 50.00;
base_lower_fourth_y = 4.17;
base_lower_fourth_z = 1.00;

wall_thicknes = 2.00;

module base_main() {
    cube([base_main_x, base_main_y, base_main_z]);
}

module base_upper() {
    translate([base_upper_left_margin, base_main_y, 0]) {
        cube([base_upper_first_x, base_upper_first_y, base_upper_first_z]);
        translate([base_upper_first_x, 0, 0]) {
            cube([base_upper_second_x, base_upper_second_y, base_upper_second_z]);
        }
        translate([base_upper_first_x+base_upper_second_x, 0, 0]) {
            cube([base_upper_third_x, base_upper_third_y, base_upper_third_z]);
        }
        translate([base_upper_first_x+base_upper_second_x+base_upper_third_x, 0, 0]) {
            cube([base_upper_fourth_x, base_upper_fourth_y, base_upper_fourth_z]);
        }
    }
}

module base_lower() {
    translate([base_lower_left_margin, 0, 0]) {
        translate([0, base_lower_gamma_y-base_lower_alpha_y, 0]) {
            rotate([0, 0, base_lower_first_angle]) {
                cube([base_lower_first_x, base_lower_first_x, base_lower_first_z]);
            }
            rotate([0, 0, base_lower_second_angle]) {
                cube([base_lower_second_x+base_lower_second_x_ext, base_lower_second_x, base_lower_second_z]);
            }
            rotate([0, 0, base_lower_second_angle]) {
                translate([base_lower_second_x, 0, 0]) {
                    rotate([0, 0, base_lower_third_angle]) {
                        cube([base_lower_third_x, base_lower_third_y, base_lower_third_z]);
                    }
                }
            }
        }
        translate([base_main_x-base_lower_left_margin-base_lower_fourth_x, base_lower_gamma_y-base_lower_fourth_y, 0]) {
            cube([base_lower_fourth_x, base_lower_fourth_y, base_lower_fourth_z]);
        }
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

module base() {
    translate([0, base_lower_gamma_y, 0]) {
        base_upper();
        base_main();
        standoffs();
    }
    base_lower();
}

module case() {
    base();
}

case();
