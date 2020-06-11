th_strength = 3 ;
th_holder = 1.5;
th_flex = 1.8;

hole = 2.3;
flex = 6;

servo_width = 20;
servo_length = 41;
servo_height = 12;

margen = 11;
lateral_offset = 14;
size = 11;
gap = 48;
height = 23.9;

curve = 15;

realy_big = 100;

$fn = 100;
mirror([0, 1, 0]) difference(){
    union(){
        hull(){
            cube([servo_width + th_holder + th_strength, servo_length + 2*th_holder, servo_height]);
            translate([0, 0, height + th_strength]) cube([th_strength, lateral_offset + size/2, th_strength]);
        }
        hull(){
            translate([0, 0, height + th_strength]) cube([th_strength, lateral_offset + size/2, th_strength]);
            translate([-margen, lateral_offset, height + th_strength]) cylinder(th_strength, size/2, size/2);
        }
        
        translate([0, servo_length/2 + th_holder - curve/2, 0]) hull(){
            cube([servo_width + th_holder + th_strength, curve, servo_height]);
            translate([servo_width + servo_height/2 + th_holder + th_strength, curve/2, servo_height/2]) rotate([90, 0, 0]) cylinder(flex + 2*th_flex, servo_height/2, servo_height/2, center=true);
        }
        
        hull(){
            translate([-margen, lateral_offset, 0]) cylinder(th_strength, size/2, size/2);
            cube([servo_width + th_holder + th_strength, servo_length + 2*th_holder, th_strength]);
        }
        hull(){
            translate([-margen, lateral_offset + gap, 0]) cylinder(th_strength, size/2, size/2);
            cube([servo_width + th_holder + th_strength, servo_length + 2*th_holder, th_strength]);
        }
    }
    
    translate([th_strength, th_holder, 0]) cube([servo_width, servo_length, realy_big]);
    translate([servo_width + servo_height/2 + th_holder + th_strength, curve/2, servo_height/2]) rotate([90, 0, 0]) cylinder(realy_big, hole, hole, center=true);
    
    translate([th_strength, servo_length/2 + th_holder - flex/2, 0]) cube([servo_width + th_holder + servo_height, flex, realy_big]);
    
    translate([-margen, lateral_offset, 0]) cylinder(realy_big, hole, hole);
    translate([-margen, lateral_offset + gap, 0]) cylinder(th_strength, hole, hole);
}