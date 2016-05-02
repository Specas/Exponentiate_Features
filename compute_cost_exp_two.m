function J = compute_cost_exp_two(x, y, theta, pow)

	m = length(y);
	J = 0;
	x = [x(:, 1), x(:, 2).^pow(1, 1), x(:, 3).^pow(2, 1)];

	for i=1:m
		J = J + (((theta)'*(x(i,:))') - y(i))^2;
	end;

	J = J/(2*m);

end;

