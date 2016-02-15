function [ unmixingMatrix, estimatedSources ] = ICA( observedSignals, numSources )
% n * t source signals, m * n (m >= n) mixing matrix, 
% input:
%   observedSignals = mixing matrix * source signals
% output:
%   unmixingMatrix: we want to recover inverse of mixing matrix (size n * m)
%   estimatedSources: n * t source signals 
%
%   using Independent Component Analysis
%   see algorithm of Andrew Ng's lecture note:
%     http://cs229.stanford.edu/notes/cs229-notes11.pdf
%   Dana Ballard's lecture note:
%     http://www.cs.utexas.edu/~dana/MLClass/Week3_ICA.pdf

    % Initial unmixingMatrix, generate initial weights from 0~UNIFORM_DINTERNVAL
    UNIFORM_DINTERNVAL = 0.1;
    % learning rate
    LEARNING_RATE = 0.01;
    % max iteration times
    MAX_ITERATION = 1000000;
    % if weights difference is less then converge threshold, we stop. 
    CONVERGE_THRES = 0.000;
    
    % initial unmixingMatrix with small random values
    [numObserved, time] = size(observedSignals);
    unmixingMatrix = UNIFORM_DINTERNVAL * rand(numSources, numObserved);
    
    for i = 1:MAX_ITERATION
        fprintf([ 'Iteration ', num2str(i), '\n']);
        
        estimatedSources = unmixingMatrix * observedSignals;
        
        %template value z, size n (numSources) * t
        z = 1 ./ (1 + exp(- estimatedSources)); 
        
        delta = LEARNING_RATE * ( eye(numSources) + (1 - 2 * z) * estimatedSources') * unmixingMatrix;
        
        if norm(delta) < CONVERGE_THRES
            break;
        end
        
        unmixingMatrix = unmixingMatrix + delta;
    end
    
    estimatedSources = unmixingMatrix * observedSignals;
end

