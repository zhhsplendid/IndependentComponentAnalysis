function showResult( sourceSignals, estimatedSources, length)
% This function shows result via figure. 
% We compare source signals and estimated source

% the length is how long time we show
% if not specify length, we will show all;

    [numSources, time] = size(sourceSignals);
    
    if nargin < 3
        length = time;
    end
    
    figure;

    for i = 1: numSources
        subplot(numSources, 2, 2 * i - 1);
        plot(sourceSignals(i, 1:length));
        title(['Source Signals ', num2str(i)]);
        
        subplot(numSources, 2, 2 * i);
        plot(estimatedSources(i, 1:length));
        title(['Estimated Signals ', num2str(i)]);
    end
end

