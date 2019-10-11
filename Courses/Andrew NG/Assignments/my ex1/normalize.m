function [X_new mu sigma] = normalize(X)
  
  m = size(X,1);
  n = size(X, 2) - 1;
  
  mu = mean(X);
  sigma = std(X);
  X_new = [X(:,1) ((X(:,2:end) - mu(:,2:end)) ./ sigma(:, 2:end))];
  
endfunction
