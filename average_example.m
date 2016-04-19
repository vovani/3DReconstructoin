T = false(100);
T(25:75,25:75) = true;
K = T;
K(40:60, 40:60) = false;

T2 = false(100);
T2(10:90, 10:90) = true;

% example(T, K, @simply_different_sub_average)
% example(T, K, @simply_different_average)
example([T T; T T], [ K T2; T2 K], @simply_different_average)
example([T T; T T], [ K T2; T2 K], @general_average)