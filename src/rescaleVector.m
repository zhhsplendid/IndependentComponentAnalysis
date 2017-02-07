function [ outVector ] = rescaleVector( inVector, minValue, maxValue )
% This function is used for normalizing signals because scale doesn't
% change result according to Andrew Ng's lecture note
    [row, col] = size(inVector);
    outVector = zeros(row, col);
    for r = 1:row
        vectorMaxValue = max(inVector(r,:));
        vectorMinValue = min(inVector(r,:));

        k = (maxValue - minValue) / (vectorMaxValue - vectorMinValue);
        outVector(r,:) = (inVector(r,:) - vectorMinValue) * k + minValue;
    end
end

