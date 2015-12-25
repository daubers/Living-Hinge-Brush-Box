box_radius = 25;
box_length = 350;
material_thickness=3;

module endcap() {
    rotate([90,0,0]) {
            cylinder(r=box_radius, h=material_thickness);
            translate([0,0,material_thickness]) cylinder(r=box_radius-material_thickness, h=material_thickness);
        }
}

module body_piece(){
    hinge_cut_length = 50;
    hinge_cut_width = 1;
    hinge_cut_gap = 2;
    
    tmp_val = 0;
    row = 0;
    col = 0;
    
    difference(){
            cube([box_length,box_radius*PI*PI,material_thickness]);
            row=0;
            for (x = [ 0 : 2 : box_radius*PI*PI]){

                for (i = [ 0 : 1 : box_length/(hinge_cut_length+hinge_cut_gap)]){
                        
                    translate([i*(hinge_cut_gap+hinge_cut_length),hinge_cut_gap+(hinge_cut_gap*x),0])
                            cube([hinge_cut_length, hinge_cut_width, material_thickness]);
                    translate([i*(hinge_cut_gap+hinge_cut_length)+hinge_cut_gap,hinge_cut_gap+(hinge_cut_gap*(x+1)),0])
                            cube([hinge_cut_length, hinge_cut_width, material_thickness]);
                    }
                        
            }
    }
}
    

projection(cut=true) body_piece();