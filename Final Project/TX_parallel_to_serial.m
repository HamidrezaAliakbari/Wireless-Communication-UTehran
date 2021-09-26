function [seri_out] = TX_parallel_to_serial(Framed_in)
shape = size(Framed_in);
seri_out = reshape(Framed_in, shape(1)*shape(2), shape(3));
end

