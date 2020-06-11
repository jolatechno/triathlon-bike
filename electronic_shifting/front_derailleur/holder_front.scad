th = 1.8;
th_servo = 2.6;
cable_hole = 3;

hole = 2.3;
servo_flex = 3.5;
main_flex = 5;

servo_width = 12.5;
servo_length = 31.2;
servo_height = 15;

hindge_width = 25;
hindge_margen = 2;

size = 10;
r_tube = 16.5;

r_curve = 14;
l_flex = 15;
h_curve = 10;

realy_big = 100;

$fn = 100;
difference(){
    union(){
        hull(){
            length = min(hindge_width, servo_height);
            translate([r_tube + th, -length/2, -servo_length/2 - th]) cube([servo_width, length, th]);
            translate([r_tube + th + servo_width/2, 0, -servo_length/2 - th - hindge_margen - size/2]) rotate([90, 0, 0]) cylinder(hindge_width, size/2, size/2, center=true);
        }
        hull(){
            translate([r_tube + servo_width + th + th_servo - h_curve, -l_flex/2, 0]) cube([h_curve, l_flex, servo_length/2 + th]);
            translate([r_tube + servo_width + th_servo + th, 0, servo_length/2 + th + size/2]) rotate([0, -90, 0]) cylinder(2*th_servo + servo_flex, size/2, size/2);
        }
        hull(){
            cylinder(servo_length + 2*th_servo, r_curve, r_curve, center=true);
            translate([r_tube + servo_width/2 + th, 0, 0]) cube([servo_width + 2*th_servo, servo_height, servo_length + th + th_servo], center=true);
        }
        hull(){
            cylinder(servo_length + 2*th_servo, r_tube + th, r_tube + th, center=true);
            translate([-th - main_flex/2, r_tube + th, -size/2]) cube([2*th + main_flex, size, size]);
        }
    }
    translate([0, realy_big/2, 0]) cube([main_flex, realy_big, realy_big], center=true);
    cylinder(servo_length + 2*th_servo, r_tube, r_tube, center=true);
    
    translate([r_tube + servo_width/2 + th, 0, 0]) cube([servo_width, realy_big, servo_length], center=true);
    
    translate([r_tube + servo_width + th - servo_flex, -realy_big/2, 0]) cube([servo_flex, realy_big, realy_big]);
    translate([r_tube + servo_width + th + th_servo, 0, servo_length/2 + th + size/2]) rotate([0, -90, 0]) cylinder(realy_big, hole, hole);
    
    translate([0, r_tube + th + size/2, 0]) rotate([0, 90, 0]) cylinder(realy_big, hole, hole, center=true);
    
    translate([r_tube + th + servo_width/2, 0, -servo_length/2 - th - hindge_margen - size/2]) rotate([90, 0, 0]) cylinder(hindge_width, hole, hole, center=true);
}