function [cyphered] = RX_DPSK_Demodulation(seq)
Re_in_signal = real(seq);
Im_in_signal = imag(seq);
shape = size(seq);
concellation_distance = zeros(shape(1), shape(2), shape(3), 4);
%Calculating distance from desired concellations
concellation_distance(:,:,:,1) = (Re_in_signal-1).^2 + Im_in_signal.^2;
concellation_distance(:,:,:,2) = (Re_in_signal).^2 + (Im_in_signal-1).^2;
concellation_distance(:,:,:,3) = (Re_in_signal+1).^2 + Im_in_signal.^2;
concellation_distance(:,:,:,4) = (Re_in_signal).^2 + (Im_in_signal+1).^2;
[~, detected] = min(concellation_distance, [], 4);
detected=detected - 1;
%retrieving arithmetic calculation.
for row = 2:shape(1)
    detected(row,:,:) = mod(detected((row),:,:)-detected((row-1),:,:), 4);
end
%omitting first randomly-selected symbol row.
cyphered = detected((2:shape(1)),:,:);
end

