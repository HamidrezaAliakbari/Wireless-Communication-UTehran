function [estimated_starting_point] = RX_startingpoint_estimation(delayed_sig, pilot)
len = length(pilot);
%estimated delay region is till 4 length of array witch is good.
[correlation_with_pilot,Lags]=xcorr(delayed_sig(1:4*len),pilot);
%getting positive lags' max to determine the starting point.
correlation_with_pilot=correlation_with_pilot(Lags>=0);
estimated_starting_point=find(correlation_with_pilot==max(correlation_with_pilot));
end

