function J = compute_cost_sim(x, y, theta, pow)

	[m, n] = size(x);
	J = 0;
	x_tmp = x;
	% Exponentiating the inputs according to the current power levels
	x = ones(m, 1);
	for j=2:n
		x = [x x_tmp(:, j).^pow(j-1)];
	end;


	% Cost is found using square error
	for i=1:m
		J = J + (((theta)'*(x(i,:))') - y(i))^2;
	end;

	J = J/(2*m);

end;

