function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression
%   NORMALEQN(X,y) computes the closed-form solution to linear
%   regression using the normal equations.


% You need to set this value correctly
theta = zeros(size(X, 2), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%

% ---------------------- Sample Solution ----------------------

% https://medium.com/@andrew.chamberlain/the-linear-algebra-view-of-least-squares-regression-f67044b7f39b
% 
% We're just solving for A * theta = b   (A=input, theta=best fit line, b=output)
% Multiply both sides by A', gives us A' * A which must be square (needs to be square to be invertable)
% A' * A * theta = A' * b          
% theta = inv(A' * A) * A' * b     (inversion is the divide equivalent for matrices)
%
%
% With something simple like "A = [[1,5];[1,6]]" (which is SQUARE) and "b = [13;15]"
% you will can skip the A' and you will get "inv(A) * b" equals "[3;2]" the correct solution.

theta = (pinv(X'*X))*X'*y;

% -------------------------------------------------------------


% ============================================================

end
