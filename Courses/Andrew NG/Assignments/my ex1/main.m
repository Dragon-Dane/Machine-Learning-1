data = load('ex1data1.txt');

X = data(:, end - 1); y = data(:, end);
m = length(y);
n = size(X,2);

plot(X,y,"rx");
hold on;

X = [ones(m, 1) X];
theta = zeros(m, 1);

J = cost(X, y, theta);



alpha = 0.01;
num_iters = 1500;
[theta history] = gradient(X, y, theta, alpha, num_iters);

plot(X(:, 2), theta(1) + theta(2) * X(:, 2), '-');