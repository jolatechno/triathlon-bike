width = 9.5;
angle = 35;
height = 52;

size = 10;
l0 = 13;
turn = 50;
th = 4;
hole = 2.3;

hindge_width = 7;
hindge_margen = 1.5;

hindge_gap = 24.5;
hindge_height = 13.5;

realy_big = 1000;

$fn = 100;
mirror([0, 1, 0]) union(){
    translate([l0 + hindge_gap, 0, 0]) difference(){
        hull(){
            translate([0, 0, size/2]) rotate([-90, 0, 0]) cylinder(th + width, size/2, size/2);
            translate([-size/2, 0, 0]) mirror([0, 0, 1]) cube([size, th, th]);
        }
        translate([0, 0, size/2]) rotate([-90, 0, 0]) cylinder(th + width, hole, hole);
    }
    mirror([0, 0, 1]) cube([turn, th, size]);
    translate([turn, 0, 0]) mirror([0, 0, 1]) rotate([0, -angle, 0]) difference(){
        union(){
            cube([height/sin(angle), th, size]);
            translate([height/sin(angle), 0, size/2]) rotate([-90, 0, 0]) cylinder(th + width, size/2, size/2);
        }
        translate([height/sin(angle), 0, size/2]) rotate([-90, 0, 0]) cylinder(th + width, hole, hole);
    }
}