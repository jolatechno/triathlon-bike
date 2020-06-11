width = 35;
height = 44;

gap = 63.5;
hole = 2.8;
th = 2.3;
size = 12;

insert = 3;

$fn = 40;
union(){
    difference(){
        hull(){
            translate([gap/2, 0, 0]) cylinder(height, width/2, width/2);
            translate([-gap/2, 0, 0]) cylinder(height, width/2, width/2);
        }
        hull(){
            translate([gap/2, 0, th]) cylinder(height - th, width/2 - th, width/2 - th);
            translate([-gap/2, 0, th]) cylinder(height - th, width/2 - th, width/2 - th);
        }
        
        translate([gap/2, 0, 0]) cylinder(th, hole, hole);
        translate([-gap/2, 0, 0]) cylinder(th, hole, hole);
    }
    
    difference(){
        translate([gap/2 + width/2 - insert - th, 0, 0]) cylinder(height, insert + th, insert + th);
        translate([gap/2 + width/2 - insert - th, 0, 0]) cylinder(height, insert, insert);
    }
    difference(){
        translate([insert + th - gap/2 - width/2, 0, 0]) cylinder(height, insert + th, insert + th);
        translate([insert + th - gap/2 - width/2, 0, 0]) cylinder(height, insert, insert);
    }
}