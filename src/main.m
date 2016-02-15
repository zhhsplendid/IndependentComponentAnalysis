function main()
    % Change your directory where you put data
    DATA_DIR = '../data/';
    
    % Data from http://www.cs.utexas.edu/~dana/MLClass/icaTest.mat
    SMALL_SET = [DATA_DIR, 'icatest.mat'];
    
    % Data from http://www.cs.utexas.edu/~dana/MLClass/sounds.mat
    STANDARD_SET = [DATA_DIR, 'sounds.mat'];
    
    
    % Small experiment:
    load(SMALL_SET, 'U', 'A');
    observedSignals = mixSignals(U, A);
    [unmixingMatrix, estimatedSources] = ICA( observedSignals, size(U, 1));
    showResult(U, estimatedSources);
end