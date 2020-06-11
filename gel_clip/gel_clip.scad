r_clip = 16.7;
throat_a = 50;
size = 20;

r_botlle = 15.9;
margen = 7;
margen_2 = 4;

width = 10;
thickness = 4;

th = 3.5;

$fn = 100;
union(){
    difference(){
        union(){
            translate([-r_clip - r_botlle - margen, 0, 0])
                cylinder(size, r_clip + th, r_clip + th);
            hull(){
                cylinder(th, r_botlle + th, r_botlle + th);
                translate([-r_clip - r_botlle - margen, 0, 0])
                cylinder(th, r_clip + th, r_clip + th);
                
                translate([r_botlle + margen + thickness, width/2, 0])  cylinder(th, th, th);
                translate([r_botlle + margen + thickness, -width/2, 0])  cylinder(th, th, th);
                
            }
        }
        cylinder(th, r_botlle, r_botlle);
        translate([-r_clip - r_botlle - margen, 0, 0]) cylinder(size, r_clip, r_clip);
        translate([r_botlle + margen, -width/2, 0]) cube([thickness, width, th]);
        
        translate([-r_clip - r_botlle - margen, 0, 0]) {
            cylinder(size, r_clip, r_clip);
            rotate([0, 0, 180 - throat_a]) rotate_extrude(angle=2*throat_a) square([r_clip/sin(throat_a), size]);
        }
    }
}

