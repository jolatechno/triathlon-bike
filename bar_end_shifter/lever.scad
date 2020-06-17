r = 22.5/2;
r_small = 21/2;

hole = 2.2;

height = 8;
chanfer = 2;

length = 50;
th = 5;

length_support = 4;
th_support = 14;
transition = 12;

r_support = 3;
depth_support = 4;
r_cable = 0.75;

module main() {
    difference() {
        union() {
            cylinder(height, r, r);
            translate([0, 0, height]) cylinder(chanfer, r, r - chanfer);
        }
        
        translate([0, 0, height/2]) rotate_extrude(convexity = 10) translate([r, 0, 0]) circle(r - r_small);
    }
}

module body() {
    union() {
        hull() {
            translate([0, -th_support/2, 0]) cube([length_support + r, th_support, height + chanfer]);
            translate([length_support + r + transition - th, -th_support/2, 0]) cube([th, th, height + chanfer]);
        }
        translate([0, -th_support/2, 0]) cube([length, th, height + chanfer]);
        translate([length, -th_support/2, (height + chanfer)/2]) rotate([-90, 0, 0]) cylinder(th, (height + chanfer)/2, (height + chanfer)/2);
    }
}

module holes() {
    union() {
        cylinder(height + chanfer, hole, hole);
        translate([r + length_support/2, 0, height/2]) {
            rotate([90, 0, 0]) {
                translate([0, 0, th_support/2 - depth_support]) cylinder(depth_support, r_support, r_support);
                cylinder(th_support, r_cable, r_cable, center=true);
            }
            translate([-r_cable, -th_support/2, -height/2]) cube([2*r_cable, th_support, height/2]);
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