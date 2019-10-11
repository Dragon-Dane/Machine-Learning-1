function [J, grad] = cost(theta, X, y)
   
   m = length(y);
   
   z = X * theta;
   hTheta = 1 ./ (1 + exp( -z ));
   
   J = sum( (-y .* log(hTheta) - (1 - y) .* log(1 - hTheta)) / m );  
   
   grad = X' * (hTheta - y) / m;
   
endfunction
