PROJ_BASE_DIR = 'C:\Users\Vladimir Anisimov\Documents\MATLAB\3DReconstruction\';

hand_voxelized = false(360,360,257);
hand_voxelized(30:329, 30:329,:) = VOXELISE(300,300,257,strcat(PROJ_BASE_DIR, 'Hand\Hand.stl'));
hand_slices = hand_voxelized(:,:,1:8:257);
drawcontour3(hand_slices, 1:size(hand_slices,3));
for j = 1:3
   hand_slices = four_point(hand_slices, 1/16, @general_average, 1);
   drawcontour3(hand_slices, 1:size(hand_slices,3));
end
drawobject(hand_slices)