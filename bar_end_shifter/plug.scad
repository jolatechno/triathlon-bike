r = 9.5;
lip = 2.5;
th = 2;

depth = 10;
wedge = 4;

r_cable = 1.2;
r_tube = 2.5;

depth_cable = 10;

module body() {
    union() {
        cylinder(th, r + lip, r + lip);
        cylinder(th + depth, r, r);
        translate([0, 0, th + depth]) cylinder(wedge, r, r - wedge);
    }
}
module hole() {
    union() {
        cylinder(depth_cable, r_tube, r_tube);
        cylinder(th + depth + wedge, r_cable, r_cable);
        translate([-r_cable, 0, 0]) cube([2*r_cable, r + lip, th + depth + wedge]);
    }
}

$fn = 100;
difference() {
    body();
    hole();
}