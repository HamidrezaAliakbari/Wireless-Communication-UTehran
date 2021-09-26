function [cascaded_sym] = RX_cascade_frames(seq)
shape = size(seq);
cascaded_sym = reshape(seq, shape(1)*shape(2), 1);
end

