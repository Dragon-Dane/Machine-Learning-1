function J = cost2(theta, X, y)
   m = length(y);
   
   z = X * theta;
   hTheta = 1 ./ (1 + exp( -z ));
   
   
   J = sum( (-y .* hTheta - (1 - y) .* (1 - hTheta)) / m );
   
endfunction
