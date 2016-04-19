PROJ_BASE_DIR = 'C:\Users\Vladimir Anisimov\Documents\MATLAB\3DReconstruction\';

buddha_voxelized = false(260,260,600);
buddha_voxelized(30:229, 30:229,:) = VOXELISE(200,200,600,strcat(PROJ_BASE_DIR, 'Buddha\Buddha.stl'));
buddha_slices = buddha_voxelized(:,:,1:8:600);
for j = 1:3
   drawcontour3(buddha_slices, 1:size(buddha_slices,3));
   buddha_slices = four_point(buddha_slices, 1/16, @general_average, 1);
end
drawobject(buddha_slices)