data {
  int<lower=1> N; //number of data points
  real x[N]; //data
  real<lower=0> alpha;
  real<lower=0> rho;
}

transformed data {
  matrix[N,N] K = cov_exp_quad(x, alpha, rho) + diag_matrix(rep_vector(1e-9,N)); // Covariance function
  vector[N] mu = rep_vector(0,N); //mean
}

generated quantities {
  vector[N] f = multi_normal_rng(mu,K);
}
