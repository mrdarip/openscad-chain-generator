gap = 0.35;
height = 1.25;
width = 1;

square_chain(gap, height, width, 10);

module square_chain(gap, height, width, length)
{
    for (i = [0:length - 1]) {
        translate([
            (width * 2 + gap * 2) * i,
            i % 2 == 0 ? 0 : (2 * height + gap),
            0
        ]) scale([ 1, i % 2 == 0 ? 1 : -1, 1 ])
        {
            square_link(gap, height, width);
        }
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