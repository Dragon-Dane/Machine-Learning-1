data = load('ex2data2.txt');

y = data(:, end);
m = length(y);
X = [ones(m, 1) data(:, 1: end - 1)];


z = find(y == 0);
o = find(y == 1);

%*********Plotting Data**********
hold on;
plot(X(o, 2), X(o, 3), 'go');
plot(X(z, 2), X(z, 3), 'ro');

legend('Passed', 'Failed');   
title('Microchip Test');

%********************************

%*******Mapping**********
%Creating Polynomial features

X = mapping(X(:, 2), X(:, 3));
%************************

n = size(X, 2); %number of features including ones.
theta_init = zeros(n, 1);
lambda = 1;

[cost, grad] = costFunction(theta_init, X, y, lambda);

options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, J] = fminunc(@(t)(costFunction(t, X, y, lambda)), theta_init, options);

%*************FinalPlot***************
u = linspace(min(X(:,2)), max(X(:,2)));
v = linspace(min(X(:,3)), max(X(:,3)));

z = zeros(length(u), length(v));
% Evaluate z = theta*x over the grid
for i = 1:length(u)
    for j = 1:length(v)
        z(i,j) = mapping(u(i), v(j))*theta;
    end
end
z = z'; % important to transpose z before calling contour

% Plot z = 0
% Notice you need to specify the range [0, 0]
contour(u, v, z, [0, 0], 'LineWidth', 2);
hold off;