function [clipped_cascaded] = TX_clipping(cascaded,clipping_db)
clipping_db = clipping_db{1};
% inSignal = abs(inSignal);
% in_signal_db = 20*log(inSignal)./log(10);
% max_db = max(in_signal_db);
% in_signal_db(in_signal_db> max_db - clipping_db) = max_db - clipping_db;
% outSignal = 10.^(in_signal_db/20);
clipping = 10^(clipping_db/10);
max_value = max(abs(cascaded));
cascaded(abs(cascaded)>max_value/clipping)= max_value/clipping;
clipped_cascaded = cascaded;
end

