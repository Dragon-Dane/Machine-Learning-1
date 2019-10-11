function [theta, history] = gradient(X, y, theta, alpha, num_iter)
  
  m = length(y);
  n = size(X,2);
  history = zeros(num_iter, 1);
  
  for iter = 1: num_iter
    
    history(iter) = cost(X, y, theta);
    hTheta = X * theta;
    for i = 1:n
      theta(i) = theta(i) - (alpha / m) * sum((hTheta - y) .* X(:, i)); 
    endfor
    
    
  endfor
endfunction
