function [out] = TX_IFFT_bins_allocation(complex_syms)
shape = size(complex_syms);
%Building matrix to set a technique that after getting IFFt of rows, result
%be real.
out = zeros(shape(1), 1024, shape(3));
out(:,(51:51+shape(2)-1),:) = complex_syms;
out(:,(575:575+shape(2)-1),:) = conj(complex_syms);
end

