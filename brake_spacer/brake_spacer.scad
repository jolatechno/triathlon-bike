r = 3.1;
th = 6;
length = 11;

$fn = 100;
difference(){
    union(){
        translate([0, -r, 0]) cube([length, 2*r, th]);
        cylinder(th, r, r);
    }
    translate([length, 0, 0]) cylinder(th, r, r);
}