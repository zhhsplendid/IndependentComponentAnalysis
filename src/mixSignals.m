function [ mixed, mixingMatrix] = mixSignals(sources, mixingMatrix)
% This funtion mixes source signals
% input:
%   sources: a n * t matrix represents n signals of length t of time
%   mixingMatrix: a m * n matrix which is weight matrix. if you input a m * 0 
%     matrix, I will generate a random mixingMatrix for you.
% output:
%   mixed: a m * t matrix represents output signals
% (m >= n)    
    [n, t] = size(sources);
    [m, k] = size(mixingMatrix);
    
    if k == 0
        mixingMatrix = rand(m, n);
    end
    mixed = mixingMatrix * sources ;

end

