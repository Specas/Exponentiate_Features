function [theta, pow, J_history] = gradient_descent_sim(x, y, theta, pow, alpha, beta, iterations)

	[m, n] = size(x);
	% J_history stores the cost functions over time (iterations). It is needed to plot the graph
	% between cost and iterations which is used to check if our solution is converging
	J_history = zeros(iterations, 1);

	x_tmp = x;

	for i = 1:iterations
		
		theta_tmp = zeros(n, 1);
		pow_tmp = zeros(n-1, 1);

		% The features in the feature matrix x need to be exponentiated by the present power values
		% General exponentiation

		x = ones(m, 1);
		for j=2:n
			x = [x x_tmp(:, j).^pow(j-1)];
		end;



		% Gradient for the 'n' theta values
		for k=1:n

		    for j = 1:m
				theta_tmp(k, 1) = theta_tmp(k, 1) + (((theta)'*(x(j,:))') - y(j))*x(j,k);
			end;
		end;

		

		% Gradient for the 'n-1' power values
		for k=1:(n-1)

			for j = 1:m
				pow_tmp(k, 1) = pow_tmp(k, 1) + (((theta)'*(x(j,:))') - y(j))*theta((k+1), 1)*(x(j,(k+1))^pow(k, 1))*log(x(j,(k+1)));
			end;
		end;

		

		% Using the learning rates to update the theta and power values.
		pow_tmp = pow - (beta/m)*pow_tmp;
		theta_tmp = theta - (alpha/m)*theta_tmp;

		% Simultaneous updation
		pow = pow_tmp;
		theta = theta_tmp;


	  	% Calling the cost function to store the costs in J_history
	    J_history(i) = compute_cost_sim(x_tmp, y, theta, pow);

	end;

end;