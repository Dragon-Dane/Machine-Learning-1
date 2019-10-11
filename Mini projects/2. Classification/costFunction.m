function [J, grad] = costFunction(theta, X, y)
  temp = X * theta;
  hTheta = sigmoid(temp);
  m = length(y);

  J = sum( - (y .* log(hTheta)) - (1 - y) .* log(1 - hTheta) ) / m;
  grad = X' *(hTheta - y) / m;
end