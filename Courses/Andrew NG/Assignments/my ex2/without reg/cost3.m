function J = cost3(theta, X, y)
   m = length(y);
   
   z = X * theta;
   hTheta = 1 ./ (1 + exp( -z ));
   
   
   J = (hTheta - y)' * (hTheta - y) ./ (2 * m);
   
endfunction
