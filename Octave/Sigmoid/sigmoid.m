% Create a function to calculate theta
function [g] = sigmoid(z)

  g = 1.0 ./ (1.0 + e.^-z)
end