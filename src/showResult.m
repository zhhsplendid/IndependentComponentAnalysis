function showResult( sourceSignals, estimatedSources)
% This function shows result via figure

    [numSources, time] = size(sourceSignals);
    
    figure;

    for i = 1: numSources
        subplot(numSources, 2, 2 * i - 1);
        plot(sourceSignals(i,:));
        title(['Source Signals ', num2str(i)]);
        
        subplot(numSources, 2, 2 * i);
        plot(estimatedSources(i,:));
        title(['Estimated Signals ', num2str(i)]);
    end
end

