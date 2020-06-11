length = 40;
size = 11;
th = 3;
hole = 2.3;
servo_hole = 1.8;

turn = 9;
slope = 6;
height = 7.5;

small = 0.01;

angle = atan(height/slope);
margen = sqrt(pow(length, 2) - pow(turn, 2)); // <= len^2 = turn^2 + margen^2

$fn = 100;
difference(){
    union(){
        translate([turn, -size/2, 0]) cube([margen - size/2 - slope - turn, size, th]);
        translate([0, -turn, 0]) cylinder(th, size/2, size/2);
        translate([margen - size/2, 0, 0]) hull(){
            translate([-slope, -size/2, th]) rotate([0, angle, 0]) mirror([0, 0, 1]) cube([small, size, th]);
            translate([0, -size/2, -th - height]) rotate([0, angle, 0]) cube([small, size, th]);
        }
        hull(){
            translate([margen - size/2, -size/2, -th - height]) cube([small, size, th]);
            translate([margen, 0, -th - height]) cylinder(th, size/2, size/2);
        }
        translate([turn, 0, 0]) hull(){
            cube([small, th, small], center=true);
            translate([margen - size/2 - slope - turn, 0, 0]) cube([small, th, small], center=true);
            translate([margen - size/2 - turn, 0, -th - height]) cube([small, th, small], center=true);
        }
        translate([turn, -turn, 0]) rotate([0, 0, 90]) rotate_extrude(angle=90) translate([turn - size/2, 0, 0]) square([size, th]);
    }
    translate([0, -turn, 0]) cylinder(th, servo_hole, servo_hole);
    translate([margen, 0, -th - height]) cylinder(th, hole, hole);
}