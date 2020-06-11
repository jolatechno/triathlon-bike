width = 35;

gap = 63.5;
hole = 2;
th = 2.3;
size = 12;

insert = 3;

$fn = 40;
difference(){
    hull(){
        translate([gap/2, 0, 0]) cylinder(th, width/2, width/2);
        translate([-gap/2, 0, 0]) cylinder(th, width/2, width/2);
    }
    
    translate([gap/2 + width/2 - insert - th, 0, 0]) cylinder(th, hole, hole);
    translate([insert + th - gap/2 - width/2, 0, 0]) cylinder(th, hole, hole);
}