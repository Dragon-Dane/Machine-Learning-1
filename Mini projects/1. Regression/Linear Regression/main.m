clear; close all; clc;


#Loading element data
data = load('secondary_database.txt');

y = data(:, 2);
m = length(y); #number of elements
X = [ones(m,1),data(:, 1)];

plot(X(:,2),y,'rx');
hold on;

#defining some variables
theta = [10;10];
iter = 100000;
alpha = 0.001;

for i = 1:iter,
  
  
  hTheta = X * theta;
  J = (sum(hTheta - y) .^ 2) / (2*m);
  for j = 1:2,
    theta(j) = theta(j) - (alpha / m) * sum((hTheta - y) .* X(:,j));
  end
  
  if mod(i,10000) == 0,
    fprintf('%d  %d %d\n',i,theta(1),theta(2));
  end

end

plot(X(:,2), X*theta, '-');
xlabel('Age of Criminals');
ylabel('Number of Criminals');

hold off;
