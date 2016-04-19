PROJ_BASE_DIR = 'C:\Users\Vladimir Anisimov\Documents\MATLAB\3DReconstruction\';

hand_voxelized = false(160,160,300);
hand_voxelized(30:129, 30:129,:) = VOXELISE(100,100,300,strcat(PROJ_BASE_DIR, 'Hand\Hand.stl'));
hand_slices = hand_voxelized(:,:,1:8:300);
drawcontour3(hand_slices, 1:size(hand_slices,3));
for j = 1:3
   hand_slices = four_point(hand_slices, 1/16, @general_average, 1);
   drawcontour3(hand_slices, 1:size(hand_slices,3));
end
drawobject(hand_slices)