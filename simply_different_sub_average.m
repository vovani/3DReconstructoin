function [ C ] = simply_different_sub_average(A, B, t)

if ~islogical(A) || ~islogical(B)
    error('This was not my intention mate');
elseif size(A) ~= size(B)
    error('Out lame code can not handle different sized bw-s');
end

A_weighted_distance = weighted_distance(A);
B_weighted_distance = weighted_distance(B);

C = (t * A_weighted_distance + (1 - t) * B_weighted_distance) >= 0;
end

