function [J grad] = lrcost(X, y, theta, lambda)

m = size(X, 1);
J = 0;
hTheta = sigmoid(X*theta);
theta = zeros(m, 1);

J = (-(y' * hTheta) - (1 - y)' * log(1 - hTheta)) / m;
J(2:end) = J(2:end) + lambda * (theta(2:end)' * theta(2:end)) / (2*m);

grad = X' * (hTheta - y);
