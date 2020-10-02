include <fillets3d.scad>;

r_big = 106;
hole = 5.2;
r_hole = 105/2;
margen_in = 2.7;
th_0 = 3;

th = 2;
width = 15.7;

h0 = 12;
transition = 10;

margen = 8;
offset_axis = 6.3;

small_hole = 2;

module arm() {
    union() {
        translate([-width/2, 0, 0]) cube([width, r_hole + h0, th_0]);
        hull() {
            translate([-width/2, r_hole + h0, 0]) cube([width, th, th_0]);
            translate([-width/2, r_hole + h0 + transition, offset_axis - th]) cube([width, r_big - (r_hole + h0 + transition), 2*th + margen]);
        }
    }
}

module disk() {
    difference() {
        cylinder(2*th + offset_axis + margen, r_big, r_big);
        cylinder(2*th + offset_axis + margen, r_hole - hole - margen_in,, r_hole - hole - margen_in);
    }
}

module body() {
    intersection() {
        disk();
        arm();
    }
}

module hole() {
    union() {
        translate([0, r_hole + h0 + transition/2 + margen/4, offset_axis/2 + th]) rotate([0, 90, 0]) cylinder(width, small_hole, small_hole, center=true);
        translate([0, r_hole, 0]) cylinder(2*th + offset_axis + margen, hole, hole);
        translate([-width/2, r_hole + h0 + transition + margen/2, offset_axis]) cube([width, r_big, margen]);
        translate([0, r_hole + h0 + transition + margen/2, offset_axis + margen/2]) rotate([0, 90, 0]) cylinder(width, margen/2, margen/2, center=true);
    }
}

$fn = 150;
difference() {
    topBottomFillet(b = 0, t = th + margen + offset_axis, r = th/2, s = 100, e = enable) body();
    hole();
}
