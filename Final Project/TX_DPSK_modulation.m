function [complex_syms] = TX_DPSK_modulation(symbols)
shape = size(symbols);
Firstrowadded_symbols = zeros(shape(1)+1,shape(2),shape(3));
%Adding a random row of symbols based on QPSK. Note that based on the fact
%that sybmbols shape is 3D matrix, ading a random row means: adding a radom
%matrix with shape of second and third dimensions of input symbols.
Firstrowadded_symbols(1,:,:) = randi([0 3], shape(2), shape(3));
Firstrowadded_symbols(2:(shape(1)+1),:,:) = symbols;
complex_syms = zeros(shape(1)+1,shape(2),shape(3));
%doing arithmatic based on what was said in callocation.
for row = 2:(shape(1)+1)
    complex_syms(row,:,:) = mod(Firstrowadded_symbols(row,:,:)+Firstrowadded_symbols(row-1,:,:),4);
end
complex_syms(1,:,:) = Firstrowadded_symbols(1,:,:);
complex_syms = changem(complex_syms, [1 -1 j -j], [0 2 1 3]);
end

