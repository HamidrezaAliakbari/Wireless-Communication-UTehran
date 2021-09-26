function [framed] = RX_Frames_Detection(symb_seq, no_carriers)
%calculating necessary in
sfc = ceil(2^13/no_carriers);
frame_length = (1024 * (sfc+1));
header_length = 8 * frame_length;
%deleting headers
symb_seq  = symb_seq(header_length+1:length(symb_seq)- header_length); 
%detecting Frames
framed = reshape(symb_seq, frame_length*(5/4), []); 
end


