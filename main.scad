gap = 1;
thickness = 2;

square_link(gap, thickness);

module square_link(gap, thickness) {
    union(){
        square_pilar(thickness);
        translate([0, 0, thickness * 2 + gap * 2 ])
            square_pilar(thickness);
    }
}

module square_pilar(thickness) {
    hull(){
        square(thickness);
        translate([0, thickness, thickness])
            square(thickness);
    }
}