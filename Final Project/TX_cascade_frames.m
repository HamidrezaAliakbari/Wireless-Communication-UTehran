function [out_cascaded, header] = TX_cascade_frames(seri_in, no_carriers, delayed_mode)
sfc = ceil(2^13/no_carriers);
%setting a random header
header = randi([0 1], 1, 8*1024*(sfc+1));
shape = size(seri_in);
out_cascaded = reshape(seri_in, 1, shape(1)*shape(2));
out_cascaded = cat(2, cat(2, header, out_cascaded), header);
if delayed_mode == "True"
    %Generating a random delay
    delay = randi([1 5*1024*(sfc+1)]);
    %adding 0 1 as much as randomly genrated delay
    out_cascaded = cat(2, randi([0 1], 1, delay), out_cascaded);
end

end

