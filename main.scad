gap = 0.35;
height = 1.25;
width = 1;
rotation = 4;

circle_square_chain3(gap, height, width, rotation,0.0035,0.000005, 300);

module square_chain(gap, height, width, length)
{
    for (i = [0:length - 1]) {
        translate([
            (width * 2 + gap * 2) * i,
            i % 2 == 0 ? 0 : (2 * height + gap),
            0
        ])

        scale([ 1, i % 2 == 0 ? 1 : -1, 1 ])

        square_link(gap, height, width);
    }
}

module circle_square_chain(gap, height, width, rotation, length)
{
    if (length > 0) {
        square_link(gap, height, width);
        translate([
                    (width*2 +gap*2 ),
                    2*width + 2*gap,
                    0
                ])
        rotate([0,0,rotation])
        scale([ 1, -1, 1 ])
        circle_square_chain(gap, height, width, -rotation, length-1);
    }
}

module circle_square_chain2(gap, height, width, from, augmention,length)
{
    if (length > 0) {
        square_link(gap, height, width);
        translate([
                    (width*2 +gap*2 ),
                    2*width + 2*gap,
                    0
                ])
        rotate([0,0,from])
        scale([ 1, -1, 1 ])
        circle_square_chain2(gap, height, width, -from+augmention, -augmention, length-1);
    }
}

module circle_square_chain3(gap, height, width, from, speed, acceleration, length)
{
    if (length > 0) {
        square_link(gap, height, width);
        translate([
                    (width*2 +gap*2 ),
                    2*width + 2*gap,
                    0
                ])
        rotate([0,0,from])
        scale([ 1, -1, 1 ])
        circle_square_chain3(gap, height, width, -from+speed, -speed+acceleration, -acceleration, length-1);
    }
}


module square_link(gap, height, width)
{
    union()
    {
        cube([ width * 4 + gap * 3, height, height ]);

        translate([ 0, height + gap, height * 2 + gap ])
          cube([ width * 4 + gap * 3, height, height ]);

        translate([ 0, 0, height ])
        {
            square_pilar(gap, height, width);
            translate([ width * 3 + gap * 3, 0, 0 ])
              square_pilar(gap, height, width);
        }
    }
}

module square_pilar(gap, height, width)
{
    multmatrix(m =
                 [
                     [ 1, 0, 0, 0 ],
                     [ 0, 1, tan(45), 0 ],
                     [ 0, 0, 1, 0 ],
                     [ 0, 0, 0, 1 ]
                 ])

      cube([ width, height, height + gap ]);
}