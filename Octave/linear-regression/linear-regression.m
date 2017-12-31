% Create a function to plot the data
function plotData(x,y)
  plot(x,y,'rx','MarkerSize',8); % Plot the data
end

% Create a function to calculate theta
function [theta] = normalEquation(X, y)
  % What the heck is this equation?!?
  %
  % https://medium.com/@andrew.chamberlain/the-linear-algebra-view-of-least-squares-regression-f67044b7f39b
  % 
  % Short version: we're just solving for A * theta = b   (A=input, theta=best fit line, b=output)
  % Multiply both sides by A', gives us A' * A which must be square (needs to be square to be invertable)
  % A' * A * theta = A' * b          
  % theta = inv(A' * A) * A' * b     (inversion is the divide equivalent for matrices)
  %
  %
  % Long version: the solution for the perfect line does not exist in the input data points,
  % the error between the perfect line and the best fit line 'dot' A = 0
  % A dot e = 0   (A is input data points + intercepts, e = error, perfect line matching data - best fit line)
  %
  % Since e = b - p   (b = observed values [output], p = projection of best fit line)
  % A' * (b - p) = 0
  %
  % Since b = A * theta   (projection of best fit line = input data * theta)
  % A' * (b - A * theta) = 0
  %
  % A' * b = A' * A * theta
  % theta = inv(A' * A) * A' * b     (inversion is the divide equivalent for matrices)
  
  
  %disp ("X:"), disp (X)  % x with intercept column
  %disp ("y:"), disp (y)  
  %[ [sum of intercept values (each squared), sum of x values (times intercept)],
  %  [sum of x values (times intercept), sum of x values (each squared)] ]
  %disp ("X'*X:"), disp (X'*X)  
  %pinv/inv(X)...X*inv(X) = I (identity matrix)
  %because we can't divide a matrix, we have to multiply by an inverse to achieve the same effect
  %disp ("pinv(X'*X):"), disp (pinv(X'*X))  
  %inputs (and intercepts) divided by the sum of the squares of the inputs (and intercepts)
  %...aka deviations(NOT RIGHT) in intercept and slope
  %disp ("(pinv(X'*X))*X':"), disp ((pinv(X'*X))*X')

  %those deviations times the inputs, summed, gives us the line
  theta = (pinv(X'*X))*X'*y
end


% Load the data from our text file (assumes Octave running in directory of file)
data = load('cricket_chirps_versus_temperature.txt');

% Define x and y
x = data(:,2);
y = data(:,1);

% We wish to use x (crickets chirping) to predict y (temperature)

% Plot the data
%plotData(x,y);
%xlabel('Rate of Cricket Chirping'); % Set the x-axis label
%ylabel('Temperature in Degrees Fahrenheit'); % Set the y-axis label
%fprintf('Program paused. Press enter to continue.\n');
%pause;

% Count how many data points we have
m = length(x);
% Add a column of all ones (intercept term) to x
X = [ones(m, 1) x];

% Calculate theta
% Normal equation assumes a linear equation fits the data points
theta = normalEquation(X,y)
% theta is what we multiply by "X" (crickets chirping) to predict y (temperature)
% the first row is a constant (y intercept) the second row is what we multiple the crickets chiriping by



% Plot the fitted equation we got from the regression
hold on; % this keeps our previous plot of the training data visible
plot(x, X*theta, '-')
legend('Training data', 'Linear regression')
hold off % Don't put any more plots on this figure