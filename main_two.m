clear;
close all;
clc;

fprintf('Loading data. \n')
data = load('two_feature.dat');
disp(size(data));
x = data(:, 1:2);
y = data(:, 3);
m = length(y);



fprintf('Gradient Descent for exponents. \n');
x = [ones(m, 1), data(:, 1), data(:, 2)];


iterations_exp = 3000;
alpha_exp = 0.02;
% We give the proper value of theta first (exponents are the only variables)
% Testing if the cost function with only the exponents minimizes
theta_exp  = [3; 37; 15];

[pow, J_history] = gradient_descent_exp_two(x, y, theta_exp, alpha_exp, iterations_exp);
fprintf('Exponents found: \n');;
disp(pow)

figure;
plot(0:49, J_history(1:50), '-');
xlabel('Number of iterations');
ylabel('Cost');

figure;
plot(0:999, J_history(1:1000), '-');
xlabel('Number of iterations');
ylabel('Cost');