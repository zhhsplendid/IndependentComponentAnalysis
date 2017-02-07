function main()
    % Change your directory where you put data
    DATA_DIR = '../data/';
    
    % Data from http://www.cs.utexas.edu/~dana/MLClass/icaTest.mat
    SMALL_SET = [DATA_DIR, 'icatest.mat'];
    
    % Data from http://www.cs.utexas.edu/~dana/MLClass/sounds.mat
    STANDARD_SET = [DATA_DIR, 'sounds.mat'];
    
    %{
    % Small experiment:
  
    load(SMALL_SET, 'U', 'A');
    observedSignals = mixSignals(U, A);
    showSignal(observedSignals);

    [unmixingMatrix, estimatedSources] = ICA( observedSignals, size(U, 1));
    normalizedSources = rescaleVector(estimatedSources, 0, 1);
    normalizedU = rescaleVector(U, 0, 1);
    showResult(normalizedU, normalizedSources);
    
    % Large experiment with different number of source signals
    
    load(STANDARD_SET, 'sounds');
    for i = 3:size(sounds, 1)
        load(STANDARD_SET, 'sounds');
        sounds = sounds(1:i,:);
        observedSignals = mixSignals(sounds, zeros(6, 0));
        showSignal(observedSignals);
        [unmixingMatrix, estimatedSources] = ICA( observedSignals, size(sounds, 1));
        normalizedSources = rescaleVector(estimatedSources, -1, 1);
        normalizedSounds = rescaleVector(sounds, -1, 1);
        showResult(normalizedSounds, normalizedSources);
        showResult(normalizedSounds, normalizedSources, 120);
    end
    
    
    % Large experiment but cut piece for recovering.
    %}
    load(STANDARD_SET, 'sounds');
    sounds = sounds(:,1:40);
    observedSignals = mixSignals(sounds, zeros(6, 0));
    showSignal(observedSignals);
    [unmixingMatrix, estimatedSources] = ICA( observedSignals, size(sounds, 1));
    normalizedSources = rescaleVector(estimatedSources, -1, 1);
    normalizedSounds = rescaleVector(sounds, -1, 1);
    showResult(normalizedSounds, normalizedSources);
    %showResult(normalizedSounds, normalizedSources, 40);
    
    % 
    
end