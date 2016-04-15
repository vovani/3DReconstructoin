function [ C ] = simply_different_average( A, B, t )

if ~islogical(A) || ~islogical(B)
    error('This was not my intention mate');
elseif size(A) ~= size(B)
    error('Our lame code can not handle different sized bw-s');
end

ASymDiffB = xor(A, B);
A_weighted_distance = weighted_distance(A);
B_weighted_distance = weighted_distance(B);

simple_op = @(A, B, t) (t .* A_weighted_distance + (1 - t) .* B_weighted_distance) >= 0;
score = @(candidate)(sign(candidate) * nnz(xor(simple_op(A, B, candidate), B)) / nnz(ASymDiffB));

ubound = t;
highest = score(t);
while highest < t && ubound < 5
    ubound = ubound + 1;
    highest = score(ubound);
end

lbound = 0;
lowest = score(lbound);
while lowest > t && lbound > -5
    lbound = lbound - 1;
    lowest = score(lbound);
end

candidate = divide_and_conquer(score, lbound, ubound, t, 0.0001, 0.000001);
fprintf('cand : %d , score : %d \n',candidate,score(candidate));
C = simple_op(A, B, candidate);
end

