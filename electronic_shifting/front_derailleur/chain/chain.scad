width = 11;
angle = 35;
height = 52;

size = 10;
l0 = 13;
turn = 50;
th = 4;
hole = 2.3;

hindge_width = 25;
hindge_margen = 1.5;

hindge_gap = 24.5;
hindge_height = 13.5;

realy_big = 1000;

$fn = 100;
union(){
    translate([l0 + hindge_gap, 0, 0]) difference(){
        hull(){
            translate([0, 0, size/2]) rotate([-90, 0, 0]) cylinder(th, size/2, size/2);
            translate([-size/2, 0, 0]) mirror([0, 0, 1]) cube([size, th, th]);
        }
        translate([0, 0, size/2]) rotate([-90, 0, 0]) cylinder(th, hole, hole);
    }
    translate([l0, 0, 0]) difference(){
        hull(){
            mirror([0, 0, 1]) cube([th, th, size]);
            translate([0, -size/2 - hindge_margen, hindge_height/2 - size/2]) rotate([0, 90, 0]) cylinder(th, size/2, size/2);
        }
        translate([0, -size/2 - hindge_margen, hindge_height/2 - size/2]) rotate([0, 90, 0]) cylinder(th, hole, hole);
    }
    translate([l0 + hindge_gap - hindge_width/2, 0, 0]) difference(){
        hull(){
            mirror([0, 0, 1]) cube([hindge_width, th, size]);
            translate([0, -size/2 - hindge_margen, -size/2 - hindge_height/2]) rotate([0, 90, 0]) cylinder(hindge_width, size/2, size/2);
        }
        translate([0, -size/2 - hindge_margen, -size/2 - hindge_height/2]) rotate([0, 90, 0]) cylinder(hindge_width, hole, hole);
    }
    mirror([0, 0, 1]) cube([turn, th, size]);
    translate([turn, 0, 0]) mirror([0, 0, 1]) rotate([0, -angle, 0]) difference(){
        union(){
            cube([height/sin(angle), th, size]);
            translate([height/sin(angle), 0, size/2]) rotate([-90, 0, 0]) cylinder(th, size/2, size/2);
        }
        translate([height/sin(angle), 0, size/2]) rotate([-90, 0, 0]) cylinder(th, hole, hole);
    }
}