data {
	int n; // Number of data points
	int y1[n]; // number of facebook clicks
	int y2[n]; // number of twitter clicks
}

parameters {
	real<lower=0, upper=1> theta1;
	real<lower=0, upper=1> theta2;
}

model {
	theta1 ~ beta(1,1); // uniform prior
	theta2 ~ beta(1,1); // uniform prior
	y1 ~ bernoulli(theta1); // likelihood
	y2 ~ bernoulli(theta2); // likelihood
}

generated quantities {
	real Delta_theta;
	Delta_theta = theta1 - theta2;
}
