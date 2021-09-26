function [removedCP_mat] = RX_CP_Removal(sequence)
shape = size(sequence);
removedCP_mat = sequence(:,(shape(2)/5+1):shape(2),:);
end



