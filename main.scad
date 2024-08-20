gap = 5;
thickness = 11;

square_chain(gap, thickness, 10);

module square_chain(gap, thickness, length) {
    for (i = [0: length - 1]) {
        translate([(thickness*2 + gap*2 ) * i, i%2 ==0?0:(2*thickness), 0])
        scale([1, i%2==0?1:-1, 1]) {
            square_link(gap, thickness);
        }
            
    }
}

module square_link(gap, thickness) {
    union(){
        cube([thickness*4 + gap*3, thickness, thickness]);

        translate([0, thickness, thickness * 2 ])
            cube([thickness*4 + gap*3, thickness, thickness]);

        translate([0, 0, thickness]){
            square_pilar(thickness);
            translate([thickness * 3 + gap * 3 , 0, 0])
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