l1 = 15.2;
l2 = 7;
height = 6.5;
rotation = -65;

size = 11;
th = 3;
hole = 2.3;
width = 4;
slope = 3;

r_spacer = 3.6;
h_spacer = 4;

small = 0.01;

angle = atan(height/slope);

$fn = 100;
difference(){
    union(){
        rotate([0, 0, rotation]) hull(){
            cylinder(h_spacer, r_spacer + width, r_spacer + width);
            translate([l1, 0, 0]) cylinder(h_spacer, r_spacer + width, r_spacer + width);
        }
        hull(){
            cylinder(th, r_spacer + width, r_spacer + width);
            translate([slope -(l2/cos(rotation) - size/2), -r_spacer - width, 0]) cube([small, 2*(r_spacer + width), th]);
        }
        translate([-(l2/cos(rotation) - size/2), 0, 0]) hull(){
            translate([slope, -r_spacer - width, 0]) cube([th*cos(angle), 2*(r_spacer + width), th]);
            translate([0, -size/2, height]) mirror([1, 0, 0]) cube([th*cos(angle), size, th]);
        }
        translate([-l2/cos(rotation), 0, height]) hull(){
            cylinder(th, size/2, size/2);
            translate([size/2, -size/2, 0]) cube([small, size, th]);
        }
    }
    cylinder(h_spacer, r_spacer, r_spacer);
    rotate([0, 0, rotation]) translate([l1, 0, 0]) cylinder(h_spacer, r_spacer, r_spacer);
    translate([-l2/cos(rotation), 0, height]) cylinder(th, hole, hole);
}