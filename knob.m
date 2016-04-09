PROJ_BASE_DIR = 'C:\Users\Vladimir Anisimov\Documents\MATLAB\3DReconstruction\';


knob_voxelized = false(160,160,300);
knob_voxelized(30:129, 30:129,:) = VOXELISE(100,100,300,strcat(PROJ_BASE_DIR, 'Door Knob\Door Knob.stl'));
knob_slices = knob_voxelized(:,:,1:20:300);
for j = 1:5
   drawcontour3(knob_slices, 1:size(knob_slices,3));
   knob_slices = four_point(knob_slices, 1/16, @simply_different_average, 1);
end