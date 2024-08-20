gap = 1;
thickness = 2;

square_link(gap, thickness);

module square_link(gap, thickness) {
    union(){
        cube([thickness*3 + gap*2, thickness, thickness]);

        translate([0, thickness, thickness * 2 ])
            cube([thickness*3 + gap*2, thickness, thickness]);

        translate([0, 0, thickness]){
            square_pilar(thickness);
            translate([thickness * 2 + gap * 2 , 0, 0])
                square_pilar(thickness);
        }
    }
}

module square_pilar(thickness) {
    multmatrix(m = [
        [1, 0, 0, 0],
        [0, 1, tan(45), 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1]
        ])

    cube(thickness);
}