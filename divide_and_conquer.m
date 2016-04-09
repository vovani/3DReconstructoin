function [ candidate ] = divide_and_conquer( op, lbound, ubound, aim, err, resolution )

candidate = ubound;
lowest = op(lbound);
highest = op(ubound);
while abs(highest - lowest) > err && abs(ubound - lbound) > resolution
    candidate = (ubound + lbound) / 2;
    new_score = op(candidate);
    
    if new_score >= aim
        ubound = candidate;
        highest = new_score;
    elseif new_score < aim
        lbound = candidate;
        lowest = new_score;
    end
end
end

