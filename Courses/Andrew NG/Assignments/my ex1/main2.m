data = load('ex1data2.txt');

X = data(:, 1: end - 1); y = data(:, end);
m = length(y);
n = size(X,2);


X = [ones(m, 1) X];
theta = zeros(n+1, 1);

J = cost(X, y, theta);

alpha = 0.01;
num_iter = 1500;

[X_new mu sigma] = normalize(X);

[theta, history] = gradient(X_new, y, theta, alpha, num_iter);
plot(1:num_iter, history);