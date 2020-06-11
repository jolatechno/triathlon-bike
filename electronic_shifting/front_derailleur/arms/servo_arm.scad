length = 22;
size = 9;
secondary_size = 7;
th = 1;
h = 3;
hole = 2.3;

r_hole = 9.2;
screw = 0.5;
n_holes = 4;

$fn = 100;
difference(){
    hull(){
        cylinder(h + th, r_hole + secondary_size/2, r_hole + secondary_size/2);
        translate([length, 0, 0]) cylinder(h + th, size/2, size/2);
    }
    cylinder(h + th, r_hole - secondary_size/2, r_hole - secondary_size/2);
    translate([length, 0, 0]) cylinder(h + th, hole, hole);
    for(i=[1:n_holes])
        rotate([0, 0, 360/n_holes*i]) translate([r_hole, 0, 0]) cylinder(h + th, screw, screw);
}