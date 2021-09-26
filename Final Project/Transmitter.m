function [out, pilot, QPSK_out] = Transmitter(bit_sequence, no_carriers, IFFT_length, clippingmode, delayed_mode, varargin)
%QPSK Modulation
QPSK_out = TX_QPSK(bit_sequence);
%Frame Divider
framedivider_out = TX_Frame_Divider(QPSK_out', no_carriers);
%Serial to parallel
seri2parallel_out = TX_Serial2parallel(framedivider_out, no_carriers);
%DPSK Modulation
dpsk_out = TX_DPSK_modulation(seri2parallel_out);
%Setting IFFT Bins allocation
IFFT_bins_out = TX_IFFT_bins_allocation(dpsk_out);
%IFFT
IFFT_out= ifft(IFFT_bins_out, IFFT_length, 2);
%Adding cycle prefix
CP_out = TX_CP_addition(IFFT_out);
%Parallel to serial
parallel2serial_out = TX_parallel_to_serial(CP_out);
%Cascade Frames 
[cascadeframe_out, pilot] = TX_cascade_frames(parallel2serial_out,no_carriers, delayed_mode);
out = cascadeframe_out;
%This part will clip signal by desired clipping level as an input of type
%Varargin.
if clippingmode == "True"
    clipping_out = TX_clipping(cascadeframe_out, varargin{1});
    out = clipping_out;
end
end

