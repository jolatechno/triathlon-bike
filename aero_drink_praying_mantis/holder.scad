r_hole = 2.2;
th = 3.5;

arm = 6.90;
margen = 1.7;
angle_x = 22;
angle_z = 
;

r_bar = 11;

th_zip = 3;

module body() {
    difference() {
        union() {
            translate([th + r_hole/2 + margen/2, 0, 0]) cube([margen + 2*th + r_hole, 2*(r_hole + th), 3*arm], center=true);
            translate([2*th + r_hole + margen, 0, 0]) cylinder(3*arm, r_hole + th, r_hole + th, center=true);
        }
        
        translate([5/2*th + r_hole + margen/2, 0, 0]) cube([3*th + 2*r_hole, 2*(r_hole + th), arm], center=true);
        translate([2*th + r_hole + margen, 0, 0]) cylinder(3*arm, r_hole, r_hole, center=true);
    }
}

module zip() {
    translate([0, -(r_hole + th), -3/2*arm]) cube([th_zip, 2*(r_hole + th), th]);
}

module bar() {
    difference() {
        translate([th/2 + r_bar/2, 0, 0]) cube([th + r_bar, 2*(r_hole + th), 3*arm], center=true);
        translate([th + r_bar, 0, 0]) rotate([0, 0, angle_z]) rotate([angle_x, 0, 0]) cylinder(10*arm, r_bar, r_bar, center=true);
    }
}

$fn=100;
union() {
    body();
    mirror([1, 0, 0]) zip();
    mirror([0, 0, 1]) mirror([1, 0, 0]) zip();
    translate([-th_zip, 0, 0]) mirror([1, 0, 0]) bar();
}