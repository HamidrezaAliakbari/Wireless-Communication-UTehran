function [out] = TX_Frame_Divider(symbols, no_carriers)
Frame_size = ceil(2^13/no_carriers)*no_carriers;
len = length(symbols);
reminder = mod(Frame_size - mod(len, Frame_size), Frame_size);
enhanced_sequence = cat(2, symbols, zeros(1, reminder));
out = reshape(enhanced_sequence, Frame_size, length(enhanced_sequence)/Frame_size);
end

