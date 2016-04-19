function [h] = drawobject(obj, normal)
   obj = padarray(obj, [1 1 1], 0);
    h = figure;
    p1 = patch(isosurface(obj,0.0));
    if (nargin > 1 && normal == true)
     isonormals(obj, p1);
    end

    set(p1,'FaceColor',[0.75 0.75 .75],'EdgeColor','none');
    material dull
    view(3); axis tight; axis off;set(h, 'Color', 'white');
    view(0,0);
    %[whitebg([0.95 0.95 0.95]);
    camlight 
    lighting gouraud
   
  