function [out_QPSK_demod_b, out_QPSK_demod_s] = Reciever(recieved, pilot, no_carriers, FFT_len, delayed_mod)
%Estimating stating point of sequence
estimated_starting_point = 1;
if delayed_mod == "True"
    estimated_starting_point = RX_startingpoint_estimation(recieved, pilot);
end
estimated_seq = recieved(estimated_starting_point:end);
%Frame Detection
RX_frame_detection_out = RX_Frames_Detection(estimated_seq, no_carriers);
%Serial to parallel
RX_serial2parallel_out = RX_serial_to_parallel(RX_frame_detection_out);
%CP Removal
CP_removal_out = RX_CP_Removal(RX_serial2parallel_out);
%FFT
FFT_out= fft(CP_removal_out, FFT_len, 2);
%Extract carriers
ExCar_out = RX_Extract_Carriers(FFT_out, no_carriers);
%DPSK Demosulation
dpsk_demododulation_out = RX_DPSK_Demodulation(ExCar_out);
%Parallel to serial in receiver
parallel2serial_out = RX_parallel_to_serial(dpsk_demododulation_out);
%cascading frames
cascadeframes_out = RX_cascade_frames(parallel2serial_out);
%DPSK demosulation
[out_QPSK_demod_b,out_QPSK_demod_s] = RX_QPSK_Demodulation(cascadeframes_out);
end

