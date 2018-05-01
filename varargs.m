function [ number_of_arguments, value_of_first_argument ] = varargs(varargin)
%TEST Summary of this function goes here
%   Detailed explanation goes here
number_of_arguments= length(varargin);
value_of_first_argument = varargin{1};
end

