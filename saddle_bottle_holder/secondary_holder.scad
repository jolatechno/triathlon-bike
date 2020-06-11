width = 51;
size = 25;
margen = 10;

r_tube = 3.7;
hole = 2.3;
angle = 20;
gap = 0.7;

length = 62;
th = 5;

realy_big = 200;

$fn = 100;
difference(){
    translate([-realy_big/2, 0, -th]) cube([realy_big, size, th + r_tube - gap]);
    
    translate([width/2 + size/2, 0, -th]) rotate([0, 0, -angle]) cube([realy_big, realy_big, th + r_tube - gap]);
    mirror([1, 0, 0]) translate([width/2 + size/2, 0, -th]) rotate([0, 0, -angle]) cube([realy_big, realy_big, th + r_tube - gap]);
    
    translate([-width/4 - size/4, size/2, -th]) cylinder(th + r_tube - gap, hole, hole);
    translate([width/4 + size/4, size/2, -th]) cylinder(th + r_tube - gap, hole, hole);
    
    translate([width/2, 0, r_tube]) rotate([0, 0, -angle]) rotate([-90, 0, 0]) cylinder(realy_big, r_tube, r_tube, center=true);
    translate([-width/2, 0, r_tube]) rotate([0, 0, angle]) rotate([-90, 0, 0]) cylinder(realy_big, r_tube, r_tube, center=true);
}