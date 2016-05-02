clear;
close all;
clc;

fprintf('Loading data. \n')
data = load('one_feature.dat');
x = data(:, 1);
y = data(:, 2);
m = length(y);

% plot_data(x, y);

% pause;


% fprintf('Gradient descent. \n');
% x = [ones(m, 1), data(:,1)];
% theta = zeros(2, 1);

% iterations = 1000;
% alpha = 0.1;

% compute_cost(x, y, theta);

% [theta, J_history] = gradient_descent(x, y, theta, alpha, iterations);
% fprintf('Theta found: \n');;
% disp(theta)

% hold on; 
% plot(x(:,2), x*theta, '-')
% legend('Training data', 'Linear regression')
% hold off 

% figure;
% plot(0:49, J_history(1:50), '-');
% xlabel('Number of iterations');
% ylabel('Cost');

% pause;

% fprintf('Calculating exponents.\n');

% x_log = log(data(:, 1));
% x_log = [ones(m, 1), data(:, 1)];
% y_log = log(data(:, 2));
% pow = zeros(2, 1);

% iterations_log = 5000;
% alpha_log = 0.1;
% % compute_cost(x_log, y_log, pow);
% [pow, J_history2] = gradient_descent(x_log, y_log, pow, alpha_log, iterations_log);
% fprintf('Powers of the features: \n');
% disp(pow);

% figure;
% plot(0:49, J_history2(1:50), '-');
% xlabel('Number of iterations');
% ylabel('Cost');

fprintf('Gradient Descent for exponents. \n');
x = [ones(m, 1), data(:,1)];

iterations_exp = 3000;
alpha_exp = 0.004;
% We give the proper value of theta first (exponents are the only variables)
% Testing if the cost function with only the exponents minimizes
theta_exp  = [56; 9];

[pow, J_history] = gradient_descent_exp(x, y, theta_exp, alpha_exp, iterations_exp);
fprintf('Exponents found: \n');;
disp(pow)

figure;
plot(0:49, J_history(1:50), '-');
xlabel('Number of iterations');
ylabel('Cost');

% disp(compute_cost_exp(x, y, theta_exp, 2));



