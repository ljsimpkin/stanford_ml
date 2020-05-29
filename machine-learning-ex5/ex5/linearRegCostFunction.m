function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
[m n] = size(X); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
% temp = theta(2:end,:);

% temp = [ones(m,1) X];


% fprintf("\n\n\nprintg here\n\n\n")
% X
% theta
ho = X*theta;
p = ho - y;
J = (1/(2*m)) * sum(p .^ 2) + (lambda/(2*m)) * (sum(theta(2:end,:).^2));


g = (1/m) * sum(p .* X);
theta(1) = 0;
grad += g' + lambda*theta/m;






% =========================================================================

grad = grad(:);

end
