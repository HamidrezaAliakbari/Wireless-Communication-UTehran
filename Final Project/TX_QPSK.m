function [mapped_symbols]=TX_QPSK(binary_sequence)
%Converting binary to decimal
mapped_symbols = bi2de(binary_sequence,2);
%This part will do gray coding to lessen the future symbol error
%possibility as much as possible
mapped_symbols = changem(mapped_symbols, [0 1 3 2], [0 1 2 3]);
end
