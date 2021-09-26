function [ber, ser] = OFDM(bit_sequence, no_carriers, IFFT_length, clippingmode, delayed_mode, eqz_mode, SNR_db, channel_mode, varargin)
 [transmitted, pilot, QPSK_out] = Transmitter(bit_sequence, no_carriers, IFFT_length, clippingmode, delayed_mode, varargin);
 recieved = channel(transmitted, channel_mode, SNR_db, eqz_mode);
 [out_QPSK_demod_b, out_QPSK_demod_s] = Reciever(recieved, pilot, no_carriers, IFFT_length, delayed_mode);
 %calculating BER and SER
 shape = size(bit_sequence);
 ber = sum(sum(out_QPSK_demod_b(1:shape(1),:) ~= bit_sequence))/(shape(1)*shape(2));
 ser = sum(out_QPSK_demod_s(1:shape(1)) ~= QPSK_out)/shape(1);
end

