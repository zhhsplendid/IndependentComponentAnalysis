function showSignal( signals, length)
% This function is used for showing generated signals    

% the length is how long time we show
% if not specify length, we will show all;
    [numSources, time] = size(signals);
    if nargin < 2
        length = time;
    end
    
    figure;

    for i = 1: numSources
        subplot(numSources, 2, 2 * i - 1);
        plot(signals(i, 1:length));
        title(['Mixed Signals ', num2str(i)]);
    end
end

