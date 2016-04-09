function [ rv ] = weighted_distance(A)
%SYMMETRIC_DIFFERENCE Summary of this function goes here
%   Detailed explanation goes here

if ~islogical(A)
    error('Was not my intention, mate.');
end

rv = -bwdist(A) + bwdist(~A);
end

