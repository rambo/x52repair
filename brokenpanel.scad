/**************************
 * Basic units.
 * 
 * Originally by Hans Häggström, 2010.
 * Dual licenced under Creative Commons Attribution-Share Alike 3.0 and LGPL2 or later
 */

mm = 1;
cm = 10 * mm;
dm = 100 * mm;
m = 1000 * mm;
inch = 25.4 * mm;

M3 = 3*mm;
M4 = 4*mm;
M5 = 5*mm;
M6 = 6*mm;
M8 = 8*mm;

// When a small distance is needed to overlap shapes for boolean cutting, etc.
epsilon = 0.01*mm;

TAU = 6.2831853071; //2*PI, see http://tauday.com/
PI = TAU/2;

/************************/


module axleholder()
{
    $fa=0.1;
    $fs=0.05;
    translate([(41/2)-(5.2/2), 2.9, 0])
    {
        difference()
        {
            cube([5.2, 27-(2*2.9), 3.95]);
            translate([5.2/2, -epsilon, 5.5])
            {
                rotate([-90,0,0])
                {
                    cylinder(r=5.0/2,h=27-2*2.9+2*epsilon);
                }
            }
        }
    }
}

module semicirclethingy()
{
    $fa=0.1;
    $fs=0.05;
    difference()
    {
        union()
        {
            translate([8.2/2,6.7/2,0])
            {
                cylinder(r=8.2/2, h=3.95);
            }
            cube([8.2,6.7/2,3.95]);
        }
        translate([-epsilon,-3,-epsilon])
        {
            cube([8.2+2*epsilon, 3, 3.95+2*epsilon]);
        }
    }
}
//semicirclethingy();

module oppsemicirl()
{
    semicirclethingy();
    translate([0,27,0])
    {
        mirror([0,1,0])
        {
            semicirclethingy();
        }
    }
}

module semicirclethingy_screwhole()
{
    $fa=0.1;
    $fs=0.05;
    sloth = 3.95-1.7;
    translate([8.2/2,2.5, -epsilon])
    {
        union()
        {
            cylinder(r=2.5/2, h=3.95+2*epsilon);
            cylinder(r=5.0/2, h=sloth+epsilon);
            translate([-5.0/2, -2.5-epsilon, 0])
            {
                cube([5.0, 2.5+epsilon, sloth+epsilon]);
            }
        }
    }
}

module semicirclethingy_whole()
{
    difference()
    {
        semicirclethingy();
        #semicirclethingy_screwhole();
    }
}
//semicirclethingy_whole();

module oppsemicirlholes()
{
    semicirclethingy_screwhole();
    translate([0,27,0])
    {
        mirror([0,1,0])
        {
            semicirclethingy_screwhole();
        }
    }
}


module brokenpanel()
{
    difference()
    {
        union()
        {
            cube([41,27,1.95]);
            axleholder();
            translate([7.0,0,0])
            {
                oppsemicirl();
            }
            translate([41-7.0-8.2,0,0])
            {
                oppsemicirl();
            }
        }
        translate([7.0,0,0])
        {
            oppsemicirlholes();
        }
        translate([41-7.0-8.2,0,0])
        {
            oppsemicirlholes();
        }
    }
}

brokenpanel();
