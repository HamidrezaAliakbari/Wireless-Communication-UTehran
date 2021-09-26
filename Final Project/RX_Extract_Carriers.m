function [carrierextracted_mat] = RX_Extract_Carriers(seq, no_carriers)
carrierextracted_mat = seq(:,51:51+no_carriers-1,:);
end