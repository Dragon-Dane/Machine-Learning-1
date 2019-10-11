clear; close all; clc


data = load('secondary_database.txt');
X = data(:,1);
y = data(:,2);
m = length(y);

X = [X sqrt(X) X.^2 X.^3 X.^4 X.^5];
n = size(X,2);


%%  ============Feature Normalize===========
X_norm = X;

mu = zeros(n, 1);
sigma = zeros(n, 1);

mu = mean(X);
sigma = std(X);

for i = 1:n,
  X_norm(:,i) = X_norm(:,i) - mu(i);
  X_norm(:,i) = X_norm(:,i) / sigma(i);
endfor

%%  ============Feature Normalize===========

X_norm = [ones(m,1) X_norm];


%% ===============Compute Cost==============
function J = computeCost(X, y, theta)
  
m = length(y);
n = size(X,2) - 1;

hTheta = X * theta;
J = ((hTheta - y)' * (hTheta - y)) / (2 * m);
end

%% ===============Compute Cost==============

%%==============Gradient Descent============
alpha = 0.0001;
num_iters = 70000;
theta = zeros(n+1, 1);
J = zeros(num_iters,1);

for iter = 1:num_iters,
  hTheta = X_norm * theta;
  J(iter) = computeCost(X_norm, y, theta);

  for i = 1:n+1,
    theta(i) = theta(i) - (alpha / m) * sum( X_norm(:,i) .* (hTheta - y) );
  end
  
end

figure(1);
plot(1:numel(J), J, '-b', 'LineWidth', 2);
xlabel('Iterations');
ylabel('Cost');

%%==============Gradient Descent============

X = [ones(m,1) X];

figure(2);
plot(X(:,2),y,'rx');
hold on;
plot(X(:,2), X_norm * theta, '-');
xlabel('Age of Criminals');
ylabel('Number of Criminals');
hold off;





