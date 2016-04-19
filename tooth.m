PROJ_BASE_DIR = 'C:\Users\Vladimir Anisimov\Documents\MATLAB\3DReconstruction\';

tooth_voxelized = false(366, 366, 257);
tooth_voxelized(30:335, 30:335,:) = VOXELISE(306, 306, 257, strcat(PROJ_BASE_DIR, 'Tooth\tooth.stl'));
tooth_slices = tooth_voxelized(:,:,linspace(1,257,17));
drawcontour3(tooth_slices, 1:size(tooth_slices,3));
for j = 1:4
   tooth_slices = four_point(tooth_slices, 1/16, @general_average, 1);
   drawcontour3(tooth_slices, 1:size(tooth_slices,3));
end
drawobject(tooth_slices)