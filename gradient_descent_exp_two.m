function [pow, J_history] = gradient_descent_exp_two(x, y, theta, alpha, iterations)

	m = length(y);
	J_history = zeros(iterations, 1);
	pow = ones(2, 1);

	x_working = x;

	for i = 1:iterations
		
		sum_exp = zeros(2, 1);

		x = [x_working(:, 1), x_working(:, 2).^pow(1, 1), x_working(:, 3).^pow(2, 1)];



		for j = 1:m
			sum_exp(1, 1) = sum_exp(1, 1) + (((theta)'*(x(j,:))') - y(j))*theta(2, 1)*(x(j,2)^pow(1,1))*log(x(j,2));
			% disp(sum_exp);
		end;

		for j = 1:m
			sum_exp(2, 1) = sum_exp(2, 1) + (((theta)'*(x(j,:))') - y(j))*theta(3, 1)*(x(j,3)^pow(2, 1))*log(x(j,3));
			% disp(sum_exp);
		end;

		sum_exp(1, 1) = pow(1, 1) - (alpha/m)*sum_exp(1, 1);
		sum_exp(2, 1) = pow(2, 1) - (alpha/m)*sum_exp(2, 1);


		pow(1, 1) = sum_exp(1, 1);
		pow(2, 1) = sum_exp(2, 1);
		% disp(pow);

	  
	    J_history(i) = compute_cost_exp_two(x_working, y, theta, pow);

	end;

end;