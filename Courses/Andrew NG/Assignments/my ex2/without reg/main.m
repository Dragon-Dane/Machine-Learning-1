%%%%%%%%  Regression problem  %%%%%%%%


data = load('ex2data1.txt');

y = data(:, end);
m = length(y); %number of samples
X = [ones(m, 1) data(:, 1: end-1)];
n = size(X, 2) - 1; %number of features

%plotting data
pos = find(y == 1);
neg = find(y == 0); 
figure 1
hold on;
plot(X(pos, 2), X(pos, 3), 'og');
plot(X(neg, 2), X(neg, 3), 'or');

xlabel('Exam 1');
ylabel('Exam 2');
legend('Admitted','Not Admitted');



%% Checking the cost function
theta = zeros(n + 1, 1);

[J grad] = cost(theta, X, y);

%
%      Experimenting on what it looks like with and without log in cost function
%***************************************************************************************

a = linspace(-10, 10);  % linspace(start, end) returns a 100 values
b1 = zeros(1, 100);
b2 = zeros(1, 100);
b3 = zeros(1, 100);
theta_ex = [a; zeros(n, 100)];   %experimental thea

for i = 1: 100
  
  b1(i) = cost(theta_ex(:,i), X, y);
  b2(i) = cost2(theta_ex(:,i), X, y);
  b3(i) = cost3(theta_ex(:,i), X, y);
  
endfor

figure 2
plot(a, b1);
title('Cost with log in cost function');
xlabel('theta');
ylabel('cost');

figure 3
plot(a, b2);
title('Cost without log in cost function');
xlabel('theta');
ylabel('cost');

figure 4
plot(a, b3);
title('Cost with sigmoid but like linear reg :p');
xlabel('theta');
ylabel('cost');


%***************************************************************************************
%}



% running fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(cost(t, X, y)), theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('Expected cost (approx): 0.203\n');
fprintf('theta: \n');
fprintf(' %f \n', theta);
fprintf('Expected theta (approx):\n');
fprintf(' -25.161\n 0.206\n 0.201\n');


%Final plot
figure 1
plot_x = linspace(min(X(:, 2)) - 2, max(X(:, 2)) + 2);
plot_y = -(1./ theta(3)) .* (theta(1) + theta(2) .* plot_x);

plot(plot_x, plot_y);
hold off;