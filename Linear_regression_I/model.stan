data {
    int<lower=0> N; //number of data
    vector[N] x; //covariates
    vector[N] y; //variates
}

parameters {
    real alpha;//intercept
    real beta; //slope
    real<lower=0> sigma; //scatter
}

model {
    //priors
    alpha ~ normal(0, 10);
    beta ~ normal(0,10);
    sigma ~ normal(0,1);
    
    y ~ normal(alpha + beta * x, sigma); //likelihood
}

generated quantities {
    vector[N] y_sim; //simulated data from posterior
    
    for(i in 1:N)
	    y_sim[i] = normal_rng(alpha + beta * x[i], sigma);
}
