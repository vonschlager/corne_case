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

module diagonal_cut() {
    translate([-20, -50, 5.05]) {
        rotate([5, 0, 0]) {
            cube([170, 150, 20]);
        }
    }
}

module case() {
    difference() {
        base_outer();
        base_inner();
        //diagonal_cut();
    };
}

case();
