d_left = 7.7;
d_right = 13.8 - 7.7;

length = 17;

r_renfort = 8;
renfort = 2.5;

r_head = 4.5;
th_head = 2.5;

r_hole = 2;

r_insert = 3;
th_insert = 6;

r = 9.5;
lip = 2.5;
th = 4.5;

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

module holder() {
    hull() {
        cylinder(th, r + lip, r + lip);
        translate([-renfort - th_head - d_left, 0, length]) rotate([0, 90, 0]) cylinder(renfort + th_head + d_left + d_right + th_insert, r_renfort, r_renfort);
    }
}

module holder_hole() {
    union() {
        translate([0, 0, length]) rotate([0, -90, 0]) cylinder(r + th, r_hole, r_hole);
        translate([0, 0, length]) rotate([0, 90, 0]) cylinder(r + th, r_insert, r_insert);
        
        translate([-renfort - 2*th_head - d_left, 0, length]) rotate([0, 90, 0]) cylinder(2*th_head, r_head, r_head);
        
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