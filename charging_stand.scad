// SPDX-License-Identifier: MIT

$fa = 1;
$fs = 0.4;

// pin library - pin_connectors by tbuser (https://github.com/tbuser/pin_connectors)
use<lib/pins.scad>;
use<lib/pin_joints.scad>;

module phone() {
    union() {
        difference() {
            // phone rest
            translate([0, 5, 2])
                rotate([0, 0, 45])
                    cylinder(140, 70, 35, $fn=4, center=true);
            // cut cylinder in half
            translate([-80, 0, 2])
                cube([170, 170, 170], center=true);
            // peg holes for joining to base
            translate([40, -30, -68])
                pinhole(h=10, r=4, lh=3, lt=1, t=0.3, tight=true);
            translate([40, 45, -68])
                pinhole(h=10, r=4, lh=3, lt=1, t=0.3, tight=true);
            // vertical magsafe cable run
            translate([41.5, 5, -70])
                rotate([0, -10, 0])
                    cylinder(d=12, h=60);
            // magsafe charger
            translate([28, 5, 11])
                rotate([0, 80, 0])
                    cylinder(d=59.89, h=15.5, center=true);
        }
        // rest for magsafe charger
        translate([23.75, 5.5, 11])
            rotate([0, 80, 0])
                cylinder(d=40, h=7, center=true);
    }
}

module base() {
    union() {
        difference() {
            // stand
            cube([170, 80, 15], center=true);
            // horizontal cable run magsafe charger
            translate([-35, 19, 3])
                rotate([90, 0, 0])
                    cylinder(d=14, h=45, center=true);
            // peg holes for joining to phone stand
            translate([-70.75, 5, 7.5])
                rotate([180, 0, 0])
                    pinhole(h=10, r=4, lh=3, lt=1, t=0.3, tight=true);
            translate([5.75, 5, 7.5])
                rotate([180, 0, 0])
                    pinhole(h=10, r=4, lh=3, lt=1, t=0.3, tight=true);
            // pixel 2 watch charger
            translate([(200 / 2) - 35, 0, 4.5])
                cylinder(d=30.14, h=7.78, center=true);
            // horizontal cable run watch charger
            translate([(200 / 2) - 14, 2, 0.75])
                rotate([90, 0, 90])
                    cylinder(d=12, h=20, center=true);
        }
        // phone stop
        translate([-60, -37, 7.5])
            rotate([0, 90, 0])
                cylinder(d=4, h=60);
    }
}

base=false;
phone=false;
stand=true;
pinpeg=false;

// the base of the stand
if (base == true) {
    rotate([0, 0, 90])
        base();
}

// the phone rest
if (phone == true) {
    phone();
}

// pin peg to connect phone rest to base
if (pinpeg == true) {
    pinpeg(h=20, r=4, lh=3, lt=1);
}

// the whole thing
if (stand == true) {
    union() {
        rotate([0, 0, 90])
            base();
        translate([-45, -(80 / 2), 75.5])
            phone();
    }
    translate([0, 125, 0])
        pinpeg(h=20, r=4, lh=3, lt=1);

}
