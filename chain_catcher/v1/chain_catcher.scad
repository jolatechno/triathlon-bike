r_tube = 16.5;
h_tube = 22;
a_tube = 17.5;

size = 10;
flex = 12;
flex_holder = 3;
r_holder = 4;

th = 3.5;
th_holder = 2.5;
hole = 2.3;

realy_big = 1000;
small = 0.01;

$fn = 100;
difference(){
    union(){
        cylinder(h_tube, r_tube + th_holder, r_tube + th_holder);
        hull(){
            cylinder(h_tube - 2*(r_holder + th_holder), r_tube + th_holder, r_tube + th_holder);
            translate([-flex/2 - th, 0, 0]) cube([2*th + flex, r_tube + th_holder + size, size]);
        }
        translate([0, 0, h_tube]) mirror([0, 0, 1]) hull(){
            rotate_extrude(angle=90) square([r_tube + th_holder, 2*(r_holder + th_holder)]);
            translate([flex/2, r_tube + r_holder + 2*th_holder, r_holder + th_holder]) rotate([0, 90, 0]) cylinder(size, r_holder + th_holder, r_holder + th_holder);
        }
        hull(){
            translate([flex/2, r_tube + r_holder + 2*th_holder, h_tube -r_holder - th_holder]) rotate([0, 90, 0]) cylinder(size, r_holder + th_holder, r_holder + th_holder);
            translate([flex/2, r_tube + r_holder + 3*th_holder, h_tube -r_holder - th_holder - th - flex_holder/2]) cube([size, r_holder + size, 2*th + flex_holder]);
        }
    }
    cylinder(h_tube, r_tube, r_tube);
    translate([0, r_tube + r_holder + 2*th_holder, h_tube -r_holder - th_holder]) rotate([0, 90, 0]) cylinder(realy_big, r_holder, r_holder);
    translate([-flex/2, 0, 0]) cube([flex, realy_big, h_tube]);
    translate([flex/2, r_tube + r_holder + 3*th_holder, h_tube -r_holder - th_holder - flex_holder/2])cube([realy_big, realy_big, flex_holder]);
    
     translate([0, r_tube + th_holder + size/2, size/2]) rotate([0, 90, 0]) cylinder(realy_big, hole, hole, center=true);
    translate([size/2 + flex/2, r_tube + th_holder + 2*(r_holder + th_holder) + size/2, h_tube - 2*(r_holder + th_holder)]) cylinder(2*(r_holder + th_holder), hole, hole);
}