$fn = 48;

base_x = 133.95;
base_y = 56.45;
base_z = 1.00;

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

module base() {
    cube([base_x, base_y, base_z]);
}

module base_upper() {
    translate([base_upper_left_margin, base_y, 0]) {
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
        translate([base_x-base_lower_left_margin-base_lower_fourth_x, base_lower_gamma_y-base_lower_fourth_y, 0]) {
            cube([base_lower_fourth_x, base_lower_fourth_y, base_lower_fourth_z]);
        }
    }
}

module case() {
    translate([0, base_lower_gamma_y, 0]) {
        base_upper();
        base();
    }
    base_lower();
}

case();
