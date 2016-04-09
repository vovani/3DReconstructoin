function [ slices ] = four_point( slices, w, op, steps)
    for j = 1:steps
        [x, y, num_slices] = size(slices);
        layer = false(x, y, num_slices - 1);
        for s = 2:num_slices-2
            p1 = op(slices(:,:,s - 1), slices(:,:,s), -2*w);
            p2 = op(slices(:,:,s + 2), slices(:,:,s + 1), -2*w);
            layer(:,:,s) = op(p1, p2, 0.5);
        end
        layer(:,:,1) = op(slices(:,:,1), slices(:,:,2), 0.5);
        layer(:,:,end) = op(slices(:,:,end-1), slices(:,:,end), 0.5);
        new_slices = false(x, y, 2*num_slices - 1);
        new_slices(:, :, 1:2:end) = slices;
        new_slices(:, :, 2:2:end) = layer;
        slices = new_slices;
    end
end

