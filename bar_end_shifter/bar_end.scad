d_left = 7.7;
d_right = 13.8 - 7.7;

length = 22;

r_renfort = 8;
renfort = 4;
r_hole = 2.2;

r = 9.5;
th = 3;

depth = 10;
wedge = 4;

r_cable = 1.2;
r_tube = 2.5;

depth_cable = 10;

module body() {
    union() {
        cylinder(th, r + th, r + th);
        cylinder(th + depth, r, r);
        translate([0, 0, th + depth]) cylinder(wedge, r, r - wedge);
    }
}

module hole() {
    union() {
        cylinder(depth_cable, r_tube, r_tube);
        cylinder(th + depth + wedge, r_cable, r_cable);
        translate([-r_cable, 0, 0]) cube([2*r_cable, r + th, th + depth + wedge]);
    }
}

module holder() {
    hull() {
        cylinder(th, r + th, r + th);
        translate([- renfort - d_left, 0, length]) rotate([0, 90, 0]) cylinder(2*renfort + d_left + d_right, r_renfort, r_renfort);
    }
}

module holder_hole() {
    union() {
        translate([0, 0, length]) rotate([0, 90, 0]) cylinder((r + th)*2, r_hole, r_hole, center=true);
        translate([-d_left, - r - th, 0]) cube([d_left + d_right, 2*(r + th), length + r + th]);
    }
}

$fn = 100;
difference() {
    union() {
        body();
        mirror([0, 0, 1]) holder();
    }
    
    mirror([0, 0, 1]) holder_hole();
    translate([0, 0, th + depth + wedge]) mirror([0, 0, 1]) hole();
}