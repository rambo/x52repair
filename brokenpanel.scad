module axleholder()
{
    $fa=0.1;
    $fs=0.05;
    translate([(41/2)-(5.2/2),2.9,0])
    {
        difference()
        {
            cube([5.2,27-(2*2.9), 3.95]);
            #translate([5.2/2, -0.1, 5.5])
            {
                rotate([-90,0,0])
                {
                    cylinder(r=5.0/2,h=27-2*2.9+0.2);
                }
            }
        }
    }
}

module brokenpanel()
{
    union()
    {
        cube([41,27,1.95]);
        axleholder();
    }
}

brokenpanel();