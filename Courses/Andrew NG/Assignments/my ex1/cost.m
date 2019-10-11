function J = cost(X, y, theta)
  
  m = length(y);
  
  hTheta = X * theta;
  J =  sum(((hTheta - y) .^ 2) / (2*m));
endfunction
