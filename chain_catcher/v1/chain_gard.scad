r_holder = 3.8;
width = 11.5;
height = 7;
length = 30;

gap = 48;
l0 = 9;
th = 2;

$fn = 100;
difference(){
    union(){
        cylinder(length, width/2 + th, width/2 + th);
        translate([-width/2 - th, 0, 0]) cube([width + 2*th, height, length]);
        translate([0, -width/2 - th + r_holder, l0]) rotate([0, 90, 0]) cylinder(gap, r_holder, r_holder);
    }
    cylinder(length, width/2, width/2);
    translate([-width/2, 0, 0]) cube([width, max(height, width/2 + th) , length]);
}