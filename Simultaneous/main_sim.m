clear;
close all;
clc;

% Load the data. It has been generalized to work for any number of features
fprintf('Loading data. \n')
data = load('gfeature2.dat');
data = data;
[m,n] = size(data);
x = data(:, 1:(n-1));
y = data(:, n);
m = length(y);
disp(x(1));
disp(y(1));


% Prepare x by adding bias terms
fprintf('Gradient Descent for exponents. \n');
x = [ones(m, 1), x];

% Setting the alpha and number of iterations values
iterations_sim = 3000;
alpha_sim = 0.1;
beta_sim = 0.1;

% Initialize theta tand pow
theta_sim = zeros(n, 1);
pow_sim = ones((n-1), 1);

% Calling the gradient descent function
% Ideal values of theta are 3, 37 and 15
% Ideal values of exponents are 2 and 5
% The function is y = 3 + 37*x1^2 + 15*x2^5

[theta, pow, J_history] = gradient_descent_sim(x, y, theta_sim, pow_sim, alpha_sim, beta_sim, iterations_sim);
fprintf('Theta found: \n');
disp(theta);
fprintf('Exponents found: \n');
disp(pow);

[theta_linear, J_history_linear] = gradient_descent_linear(x, y, theta_sim, alpha_sim, iterations_sim);


% Plotting the cost function versus iterations graph to make sure that it is converging
figure;
plot(0:49, J_history(1:50), '-');
xlabel('Number of iterations');
ylabel('Cost');

% figure;
% plot(0:999, J_history(1:1000), '-');
% xlabel('Number of iterations');
% ylabel('Cost');

x_exp = exponentiate_sim(x, pow);
error_mat = (x_exp*theta) - y;
error_mat = error_mat.^2;
error_avg = sum(error_mat)/m;
fprintf('Average error exponentiated: \n');
disp(error_avg);
linear_error_mat = x*theta_linear - y;
linear_error_mat = linear_error_mat.^2;
linear_error_avg = sum(linear_error_mat)/m;
fprintf('Average error non exponentiated: \n')
disp(linear_error_avg);


plot_data(data(:, 1), y);

xplot = [0.0:0.01:1.0];
yplot = theta(1, 1) + theta(2, 1)*(xplot.^(pow(1, 1)));
yplotlinear = theta(1, 1) + theta(2, 1)*xplot;

% Plot the linear fit
hold on; % keep previous plot visible
% plot(data(:, 1), (x_exp)*theta, '-')
plot(xplot, yplot, '-')
hold on;
plot(xplot, yplotlinear, 'g-');
legend('Training data', 'Exponentiated', 'Non exponentiated')
hold off % don't overlay any more plots on this figure
