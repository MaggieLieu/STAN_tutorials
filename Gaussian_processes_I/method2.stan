data {
  int<lower=1> N;
  real x[N];
  vector[N] y;
}

transformed data {
  vector[N] mu = rep_vector(0,N);
}

parameters {
  real<lower=0> rho;
  real<lower=0> alpha;
  real<lower=0> sigma;
}

model {
  matrix[N,N] K = cov_exp_quad(x, alpha, rho) + diag_matrix(rep_vector(square(sigma),N));
  matrix[N,N] L_K = cholesky_decompose(K);

  rho ~ normal(0, 3);
  alpha ~ normal(0, 1);
  sigma ~ normal(0, 1);

  y ~ multi_normal_cholesky(mu, L_K);
}
