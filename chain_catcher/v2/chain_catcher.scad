spacing = 64;
r_hole = 2.5;
width = 12;

gard_width = 10;
height = 8;
length = 20;

x_gap = -46.7;
z_gap = 79.5;
l0 = 9;
guard_angle = 15;

th_plate = 5;

th = 2.5;
r_tube = 4;

transition = 10;

small = 0.1;
big = 100;

module holder() {
    translate([0, - spacing - width/2 - transition, 0]) difference() {
        union() {
            cylinder(th_plate, width/2, width/2);
            translate([-width/2, 0, 0]) cube([width, spacing + width/2, th_plate]);
            translate([0, spacing + width/2, 0]) hull() {
                translate([-width/2, 0, 0]) cube([width, small, th_plate]);
                translate([0, transition, r_tube]) rotate([-90, 0, 0]) cylinder(small, r_tube, r_tube);
            }
        }
        
        cylinder(th_plate, r_hole, r_hole);
        translate([0, spacing, 0]) cylinder(th_plate, r_hole, r_hole);
    }
}

angle = atan(x_gap/(z_gap - transition - width/2));

module arm() {
    translate([0, 0, r_tube])hull() {
        rotate([-90, 0, 0]) cylinder(small, r_tube, r_tube);
        translate([x_gap, z_gap - transition - width/2, 0]) rotate([0, 0, -angle]) rotate([-90, 0, 0]) cylinder(small, r_tube, r_tube); 
    }
}

module gard_rail(th_) {
    rotate([guard_angle, 0, 0]) translate([0, 0, -big/2]) union() {
        cylinder(big, gard_width/2 + th_, gard_width/2 + th_);
        translate([-gard_width/2 - th_, 0, 0]) cube([gard_width + 2*th_, height + (th - th_), big]);
    }
}

module gard() {
    difference() {
        union(){
            arm();
            
            translate([x_gap, z_gap - transition - width/2, 0]) intersection() {
                gard_rail(th);
                translate([-big/2, -big/2, 0]) cube([big, big, length]);
            }
        }
        
        translate([x_gap, z_gap - transition - width/2, 0]) gard_rail(0);
    }
    
}

$fn=100;
union() {
    translate([0, 0, 2*r_tube]) mirror([0, 0, 1]) holder();
    gard();
}