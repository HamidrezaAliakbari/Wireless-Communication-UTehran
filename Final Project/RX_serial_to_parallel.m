function [matrix] = RX_serial_to_parallel(sequence)
shape = size(sequence);
matrix = reshape(sequence, [],1280, shape(2));
end

