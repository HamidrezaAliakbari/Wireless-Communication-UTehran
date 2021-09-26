function [out] = TX_Serial2parallel(symbols, no_carriers)
shape = size(symbols);
out = reshape(symbols, ceil(2^13/no_carriers), no_carriers, shape(2));
end

