function J = compute_cost_exp(x, y, theta, pow)

	m = length(y);
	J = 0;
	x = [x(:, 1), x(:, 2).^pow];

	for i=1:m
		
		
		J = J + (((theta)'*(x(i,:))') - y(i))^2;
	end;

	J = J/(2*m);

end;

