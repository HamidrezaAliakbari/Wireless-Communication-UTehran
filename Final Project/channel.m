function [received] = channel(transmitted, channel_mode, SNR_db, eqz_mode)
SNR = 10.^(SNR_db/10);
% AWGN Channel:
if channel_mode == "AWGN"
    received = awgn(transmitted, SNR_db); 
% + Rayleigh fading
elseif channel_mode == "Rayleigh"
    rayleigh_samples = raylrnd(1, 1, length(transmitted));
    received = awgn(rayleigh_samples.*transmitted, SNR_db);  
end
if eqz_mode == "True"
    H_f = rayleigh_samples;
    received = received.*(conj(H_f)./(abs(H_f).^2+1./(SNR)));
end

end

