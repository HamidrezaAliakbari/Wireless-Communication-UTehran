function [] = plot_enhanced(range1,plot1, xlab, ylab, title_1, varargin)
figure
s = semilogy(range1, plot1);
s.Color = [0.4118 .749 0.3922];
s.LineWidth = 2;
if nargin>5
    hold on
    s = semilogy(range1, varargin{1});
    s.Color = [0.8863 0.3255 0.0118];
    s.LineWidth = 2;
    leg = varargin{2};
    legend(leg(1),leg(2),'Location', "southwest");
end
grid on;
xlabel(xlab);
ylabel(ylab);
title(title_1);
end

