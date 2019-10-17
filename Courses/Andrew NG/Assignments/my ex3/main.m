load('ex3data1.mat');

X = [ones(m, 1) X];
m = size(X, 1);
lambda = 0.1;
theta_all = zeros(10, m);


[J grad] = lrcost(X, y, theta, lambda);