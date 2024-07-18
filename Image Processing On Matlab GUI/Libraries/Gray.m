function [Y] = Gray(x)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
[M,N,O]=size(x);
    if O<3
        Y=x;
    else 
        Y=rgb2gray(x);
    end
end

