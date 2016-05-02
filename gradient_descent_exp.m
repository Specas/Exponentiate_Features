function [pow, J_history] = gradient_descent_exp(x, y, theta, alpha, iterations)

	m = length(y);
	J_history = zeros(iterations, 1);
	pow = 1;

	x_working = x;

	for i = 1:iterations
		
		sum_exp = 0;
		x = [x_working(:, 1), x_working(:, 2).^pow];



		for j = 1:m
			sum_exp = sum_exp + (((theta)'*(x(j,:))') - y(j))*theta(2, 1)*(x(j,2)^pow)*log(x(j,2));
			% disp(sum_exp);
		end;

		sum_exp = pow - (alpha/m)*sum_exp;

		pow = sum_exp;
		% disp(pow);

	  
	    J_history(i) = compute_cost_exp(x_working, y, theta, pow);

	end;

end;