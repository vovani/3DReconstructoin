function [ C ] = general_average( A, B, t )
    
    if t < 0
        C = general_average(B, A, 1 - t);
        return
    end
    
    ACapB = A & B;
    AMinB = A & ~B;
    BMinA = ~A & B;
    [CCAMinB, nCCAMinB] = bwlabel(AMinB);
    [CCBMinA, nCCBMinA] = bwlabel(BMinA);
    
    if t >= 0 && t <= 1
        R1 = false(size(A));
        for j = 1:nCCAMinB
            C = (CCAMinB == j);
            R1 = R1 | simply_different_average(C | ACapB, ACapB, t);
        end
        R2 = false(size(A));
        for j = 1:nCCBMinA
            C = (CCBMinA == j);
            R2 = R2 | simply_different_average(C | ACapB, ACapB, 1- t);
        end

        C = R1 | R2;
    else
        R1 = false(size(A));
        for j = 1:nCCAMinB
            C = (CCAMinB == j);
            R1 = R1 | simply_different_average(C | ACapB, ACapB, t);
        end
        R2 = ACapB;
        for j = 1:nCCBMinA
            C = (CCBMinA == j);
            R2 = R2 & simply_different_average(C | ACapB, ACapB, 1- t);
        end

        C = (R1 & (~ACapB)) | R2;
    end
end

