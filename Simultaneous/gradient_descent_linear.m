function [theta, J_history] = gradient_descent_linear(X, y, theta, alpha, num_iters)



m = length(y); 
J_history = zeros(num_iters, 1);

for iter = 1:num_iters


	sum0 = 0;
	sum1 = 0;

    for iter2 = 1:m
		sum0 = sum0 + (((theta)'*(X(iter2,:))') - y(iter2))*(X(iter2,1));
	end;

	for iter2 = 1:m
		sum1 = sum1 + (((theta)'*(X(iter2,:))') - y(iter2))*(X(iter2,2));
	end;

	theta0 = theta(1,1) - (alpha/m)*sum0;
	theta1 = theta(2,1) - (alpha/m)*sum1;

	theta(1,1) = theta0;
	theta(2,1) = theta1;

 
    J_history(iter) = compute_cost_linear(X, y, theta);

end

end
