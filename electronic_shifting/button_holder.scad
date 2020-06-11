r_bar = 12;
width_button = 7;
height_button = 5;

step_height = 1.5;
step_width = 1.5;

r_curve = 11;
l_curve = 25;

th= 1;

$fn = 100;
difference(){
    hull(){
        translate([0, r_bar + height_button/2, 0]) cube([width_button + 2*th, height_button, width_button + 2*th], center=true);
        cylinder(l_curve, r_curve, r_curve, center=true);
    }
    cylinder(l_curve, r_bar, r_bar, center=true);
    
    translate([-width_button/2 - step_height, 0, -width_button/2 - step_width]) cube([width_button + 2*step_width, step_height + r_bar, width_button/2 + step_width + l_curve/2]);
    
    translate([0, r_bar/2 + height_button/2, 0]) cube([width_button, height_button + r_bar, width_button], center=true);
}