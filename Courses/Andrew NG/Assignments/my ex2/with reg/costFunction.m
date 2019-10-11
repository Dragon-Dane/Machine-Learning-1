function [J, grad] = costFunction(theta, X, y, lambda)

  m = length(y);
  
  z = X * theta;
  hTheta = 1 ./ (1 + exp(-z));
  
%  J = sum(- y .* log(hTheta) - (1 - y) .* log(1 - hTheta)) / m;
%  reverse commenting on previous and next line to get reg/without reg
  J = sum(- y .* log(hTheta) - (1 - y) .* log(1 - hTheta)) / m + sum(theta(2: end) .^ 2 ) .* lambda / (2 * m);
  
  grad = X' * (hTheta - y) / m;
%  uncomment next line to get reg   
  grad(2 : end) = grad(2 : end) + theta(2: end) * lambda / m + theta(2: end) * lambda / m;

endfunction