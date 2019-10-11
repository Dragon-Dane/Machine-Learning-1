data = load('data.txt');

X = data(:,1:end - 1);
y = data(:,end);


[m, n] = size(X);
X = [ones(m,1) X];
initial_theta = zeros(n+1,1);
[cost, grad] = costFunction(initial_theta, X, y);



options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);




hold on;

one = find(y == 0);
two = find(y == 1);


plot(X(one, 2), X(one, 3), "ro");
plot(X(two,2), X(two, 3), "bo");

                                      
xlabel('X1');
ylabel('X2');
legend('Class: One', 'Class: Two');


a = 0 : 100;
b = (- theta(1) - a .* theta(2)) ./ theta(3) ;

plot(a, b, "k-");
hold off;