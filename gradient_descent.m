function [theta, J_history] = gradient_descent(x, y, theta, alpha, iterations)

	m = length(y);
	J_history = zeros(iterations, 1);

	for i = 1:iterations
		sum0 = 0;
		sum1 = 0;

	    for j = 1:m
			sum0 = sum0 + (((theta)'*(x(j,:))') - y(j))*x(j,1);
		end;

		for j = 1:m
			sum1 = sum1 + (((theta)'*(x(j,:))') - y(j))*x(j,2);
		end;

		theta0 = theta(1,1) - (alpha/m)*sum0;
		theta1 = theta(2,1) - (alpha/m)*sum1;

		theta(1,1) = theta0;
		theta(2,1) = theta1;

	  
	    J_history(i) = compute_cost(x, y, theta);

	end;

end;