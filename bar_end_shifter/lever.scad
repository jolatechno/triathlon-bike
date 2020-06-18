r = 25/2;

hole = 2.2;

height = 8;
chanfer = 2;

length = 45;
th = 6;

length_support = 3;
th_support = 12;
transition = 13;

support_offset = -1;
r_support = 2.5;
depth_support = 4;
angle = 10;

r_cable = 0.75;
groove = 1;

module main() {
    difference() {
        union() {
            cylinder(height, r, r);
            translate([0, 0, height]) cylinder(chanfer, r, r - chanfer);
        }
        
        translate([0, 0, height/2]) rotate_extrude(convexity = 10) translate([r, 0, 0]) circle(groove);
    }
}

module body() {
    union() {
        hull() {
            translate([0, -th_support/2, 0]) cube([length_support + r, th_support, height + chanfer]);
            translate([support_offset + length_support + r + transition - th, -th_support/2, 0]) cube([th, th, height + chanfer]);
        }
        translate([0, -th_support/2, 0]) cube([length, th, height + chanfer]);
        translate([length, -th_support/2, (height + chanfer)/2]) rotate([-90, 0, 0]) cylinder(th, (height + chanfer)/2, (height + chanfer)/2);
    }
}

module holes() {
    union() {
        cylinder(height + chanfer, hole, hole);
        translate([r + support_offset, 0, height/2]) rotate([0, 0, angle]) {
            rotate([90, 0, 0]) {
                translate([0, 0, th_support/2 - depth_support]) cylinder(r, r_support, r_support);
                cylinder(2*th_support, r_cable, r_cable, center=true);
            }
            translate([-r_cable, -th_support, -height/2]) cube([2*r_cable, 2*th_support, height/2]);
        }
    }
}

$fn = 100;
difference() {
    union() {
        main();
        body();
    }
    holes();
}