function [predicted_bit, predicted_symbol] = RX_QPSK_Demodulation(seq)
%retrieving gray coding
predicted_symbol = changem(seq, [0 1 2 3], [0 1 3 2]);
%decimal to binary
predicted_bit = de2bi(predicted_symbol);
end

