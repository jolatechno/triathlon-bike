width = 51;
size = 25;
height = 15;
bottle_width = 15;
margen = 2;

r_tube = 3.7;
hole = 2.3;
hole_bottle = 2.8;
angle = 20;
gap = 0.7;
r_head = 4;

length = 63;
th = 5;

realy_big = 200;

h = bottle_width/sqrt(2);

$fn = 100;
difference(){
    union(){
        translate([-bottle_width/2 - h, 0, 0]) cube([bottle_width + 2*h, size, th + h + height]);
        
        translate([-bottle_width/2, 0, h + height]) cube([bottle_width, length + 2*size, th]);
       
        translate([bottle_width/2, 0, h + th + height]) rotate([0, 45, 0]) mirror([0, 0, 1]) cube([bottle_width, length + 2*size, th]);
        mirror([1, 0, 0]) translate([bottle_width/2, 0, h + th + height]) rotate([0, 45, 0]) mirror([0, 0, 1]) cube([bottle_width, length + 2*size, th]);
        
        translate([-realy_big/2, 0, -margen]) cube([realy_big, size, th + margen]);
    }
    translate([bottle_width/2, 0, height + h + th]) rotate([0, 45, 0]) cube([bottle_width, size, size]);
    mirror([1, 0, 0]) translate([bottle_width/2, 0, height + h + th]) rotate([0, 45, 0]) cube([bottle_width, size, size]);
    
    translate([0, size*3/2, h + height]) cylinder(th, hole_bottle, hole_bottle);
    translate([bottle_width/2, size*3/2, h + th + height]) rotate([0, 45, 0]) translate([bottle_width/2, 0, 0]) mirror([0, 0, 1]) cylinder(th, hole_bottle, hole_bottle);
    mirror([1, 0, 0]) translate([bottle_width/2, size*3/2, h + th + height]) rotate([0, 45, 0]) translate([bottle_width/2, 0, 0]) mirror([0, 0, 1]) cylinder(th, hole_bottle, hole_bottle);
    
    translate([0, length + size*3/2, h + height]) cylinder(th, hole_bottle, hole_bottle);
    translate([bottle_width/2, length + size*3/2, h + th + height]) rotate([0, 45, 0]) translate([bottle_width/2, 0, 0]) mirror([0, 0, 1]) cylinder(th, hole_bottle, hole_bottle);
    mirror([1, 0, 0]) translate([bottle_width/2, length + size*3/2, h + th + height]) rotate([0, 45, 0]) translate([bottle_width/2, 0, 0]) mirror([0, 0, 1]) cylinder(th, hole_bottle, hole_bottle);
    
    translate([width/2 + size/2, 0, -margen]) rotate([0, 0, -angle]) cube([realy_big, realy_big, th + margen]);
    mirror([1, 0, 0]) translate([width/2 + size/2, 0, -margen]) rotate([0, 0, -angle]) cube([realy_big, realy_big, th + margen]);
    
    translate([0, -size/2, 0]) cylinder(th, hole_bottle, hole_bottle);
    translate([0, length - size/2, 0]) cylinder(th, hole_bottle, hole_bottle);
    
    translate([-width/4 - size/4, size/2, -margen]) cylinder(th + margen, hole, hole);
    translate([width/4 + size/4, size/2, -margen]) cylinder(th + margen, hole, hole);
    
    translate([-width/4 - size/4, size/2, th]) cylinder(realy_big, r_head, r_head);
    translate([width/4 + size/4, size/2, th]) cylinder(realy_big, r_head, r_head);
    
    translate([width/2, 0, -margen - gap]) rotate([0, 0, -angle]) rotate([-90, 0, 0]) cylinder(realy_big, r_tube, r_tube, center=true);
    translate([-width/2, 0, -margen - gap]) rotate([0, 0, angle]) rotate([-90, 0, 0]) cylinder(realy_big, r_tube, r_tube, center=true);
}