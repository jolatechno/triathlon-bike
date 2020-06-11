width_hole = 15;
r_insert = 7;
h_insert = 9;

th_thin = 1.8;
th = 3;

length = 140;
height = 90;

r_bar = 13.7;
gap = 5;

r_end = 10;

$fn = 70;
hull(){
    cylinder(height, r_bar + th, r_bar + th);
    translate([-r_bar -width_hole, -gap/2 - th, 0]) cube([width_hole, gap + 2*th, height]);
    
    translate([length, -width_bottle/2, 0]) cube([small, width_bottle, height]);
    
    translate([length, 0, 0]) cylinder(height, r_end, r_end);
}