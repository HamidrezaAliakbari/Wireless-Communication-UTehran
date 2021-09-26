function [cpadded_matrix] = TX_CP_addition(matrix)
shape = size(matrix);
cpadded_matrix = zeros(shape(1), 1280, shape(3));
cpadded_matrix(:, (257:1280), :) = matrix;
cpadded_matrix(:, (1:256), :) = matrix(:, (769:1024), :);
end

