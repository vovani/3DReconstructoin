function [ H ] = drawcontour3( V, heights, specialHeights, indices, h)
%drawcontour3 draw contours in 3D binary volume
%   V the volume
% heights - heights where the contours are created 
% indices - z-indices into volume V
% specialHeights - contours to be highlighted
% figure to use
% H - handle to created figure

if nargin < 4
    indices = heights;
end

if nargin < 5
    H = figure;
else
    H = h;
end
hold;

sz = size(V);
sz = sz(1 : end - 1);
j  = 1;
for i = indices
z = zeros(sz);
h = heights(j);
z(V(:,:,i)) = h;
color = 'blue';
if nargin > 2 &&  any(specialHeights == i)
   color = 'red';
end
contour3(z, [h h], color);
j = j + 1;
end
view(3)
set(H, 'Color', 'white');
hold
axis tight
axis off
end


