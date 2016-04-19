PROJ_BASE_DIR = 'C:\Users\Vladimir Anisimov\Documents\MATLAB\3DReconstruction\';

knob_voxelized = false(360,360,257);
knob_voxelized(30:329, 30:329,:) = VOXELISE(300,300,257,strcat(PROJ_BASE_DIR, 'Door Knob\Door Knob.stl'));
knob_slices = knob_voxelized(:,:,1:8:257);
drawcontour3(knob_slices, 1:size(knob_slices,3));
for j = 1:3
   knob_slices = four_point(knob_slices, 1/16, @simply_different_average, 1);
   drawcontour3(knob_slices, 1:size(knob_slices,3));
end
drawobject(knob_slices)