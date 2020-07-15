data {
	int<lower=1> n;
	vector[n] y;
	vector[n] X;
}

parameters {
	real alpha;
	real beta;
	real<lower=0> sigma;
}

model {
//priors
	alpha ~ normal(0,10);
	beta ~ normal(0,10);
	sigma ~ cauchy(0,1);

//likelihood
	y~normal(alpha + beta*X, sigma);
}
