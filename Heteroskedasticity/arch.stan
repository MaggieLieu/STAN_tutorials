data {
int<lower=0> T;
real r[T];
}

parameters {
real mu; //average return
real<lower = 0> alpha0; // noise intercept
real<lower = 0, upper=1> alpha1; //noise slope
}

model {
//priors
mu ~ normal(0,10);
alpha0 ~ normal(0,10);
alpha1 ~ normal(0,10);

for(t in 2:T){
r[t] ~ normal(mu, sqrt(alpha0 + alpha1 * pow(r[t-1] - mu, 2))); //likelihood
}
}
