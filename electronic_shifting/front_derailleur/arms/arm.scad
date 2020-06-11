length = 22;
hindge_width = 25.5;
size = 9;
th = 3;
hole = 2.3;

$fn = 100;
difference(){
    union(){
        translate([0, 0, hindge_width/2]) hull(){
            translate([-length/2, 0, 0]) cylinder(th, size/2, size/2); 
            translate([length/2, 0, 0]) cylinder(th, size/2, size/2);
        }
        mirror([0, 0, 1]) translate([0, 0, hindge_width/2]) hull(){
            translate([-length/2, 0, 0]) cylinder(th, size/2, size/2); 
            translate([length/2, 0, 0]) cylinder(th, size/2, size/2);
        }
        translate([-size/2, -size/2, -hindge_width/2]) cube([size, th, hindge_width]);
    }
    translate([-length/2, 0, 0]) cylinder(hindge_width + 2*th, hole, hole, center=true);
    translate([length/2, 0, 0]) cylinder(hindge_width + 2*th, hole, hole, center=true);
}