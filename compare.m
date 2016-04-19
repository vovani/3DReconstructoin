function [ mismatched, total, score ] = compare( result, original )
Cap = result & original;
Cup = result | original;
total = nnz(Cup);
mismatched = nnz(Cup - Cap);
score = mismatched / total;
end

