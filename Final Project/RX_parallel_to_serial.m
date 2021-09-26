function [seri_mat] = RX_parallel_to_serial(mat)
shape = size(mat);
seri_mat = reshape(mat, shape(1)*shape(2), shape(3));
end

