module axleholder()
{
    $fa=0.1;
    $fs=0.05;
    translate([(41/2)-(5.2/2), 2.9, 0])
    {
        difference()
        {
            cube([5.2, 27-(2*2.9), 3.95]);
            translate([5.2/2, -0.1, 5.5])
            {
                rotate([-90,0,0])
                {
                    cylinder(r=5.0/2,h=27-2*2.9+0.2);
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
        translate([-0.1,-3,-0.1])
        {
            cube([8.2+0.2, 3, 3.95+0.2]);
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

module brokenpanel()
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
}

brokenpanel();
