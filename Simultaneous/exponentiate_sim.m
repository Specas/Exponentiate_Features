function [x] = exponentiate_sim(x, pow)

	[m, n] = size(x);
	J = 0;
	x_tmp = x;
	% Exponentiating the inputs according to the current power levels
	x = ones(m, 1);
	for j=2:n
		x = [x x_tmp(:, j).^pow(j-1)];
	end;
end;