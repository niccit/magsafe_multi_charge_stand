// SPDX-License-Identifier: MIT

$fa = 1;
$fs = 0.4;

include <lib/pins.scad>  // pins library from Tony Buser (https://github.com/tbuser)

stand_length = 220; // for print 220
stand_width = 70; // for print 70
stand_top_height = 5;
stand_bottom_height = 15;

show_base_bottom = 1;
show_base_top = 1;
free_cad = 0;

if (show_base_bottom == 1){
    stand_base_bottom();
}

if (show_base_top == 1) {
    if (show_base_bottom == 1) {
        translate([0, stand_width + 10, -stand_bottom_height / 2 + 2.5])
            stand_base_top();
    }
    else {
        if (free_cad == 1) {
            rotate([0, 180, 0])
                stand_base_top();
        }
        else {
            stand_base_top();
        }
    }
}

module stand_base_bottom() {
    difference() {
        cube([stand_length, stand_width, stand_bottom_height], center=true);
        translate([0, 0, 1])
            cube([stand_length - 2, stand_width - 2, stand_bottom_height], center=true);
    }
    translate([-stand_length / 2 + 5 - 0.001, stand_width / 2 - 5 - 0.001, 0 - 0.001])
        stand_base_pinhole();
    translate([stand_length / 2 - 5 - 0.001, stand_width / 2 - 5 - 0.001, 0 - 0.001])
        stand_base_pinhole();
    translate([-stand_length / 2 + 5 - 0.001, -stand_width / 2 + 5 - 0.001, 0 - 0.001])
        stand_base_pinhole();
    translate([stand_length / 2 - 5 - 0.001, -stand_width / 2 + 5 - 0.001, 0 - 0.001])
        stand_base_pinhole();
}

module stand_base_top() {
    cube([stand_length, stand_width, stand_top_height], center=true);
    translate([-stand_length / 2 + 5, stand_width / 2 - 5, 2.5 - 0.001])
        pin(r=3);
    translate([stand_length / 2 - 5, stand_width / 2 - 5, 2.5 - 0.001])
        pin(r=3);
    translate([-stand_length / 2 + 5, -stand_width / 2 + 5, 2.5 - 0.001])
        pin(r=3);
    translate([stand_length / 2 - 5, -stand_width / 2 + 5, 2.5 - 0.001])
        pin(r=3);
}

module stand_base_pinhole() {
    difference() {
        cube([8,8,stand_bottom_height], center=true);
        translate([0, 0, -stand_bottom_height / 2 + 5])
            pinhole(r=3);
    }
}


