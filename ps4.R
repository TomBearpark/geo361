library(tidyverse)
theme_set(theme_bw())

kappa <- function(nebla,
  nebla_hash = 0.35, Gamma = 6, kappa_0 = 1) {
  ifelse(nebla <= nebla_hash, 
    10^(-nebla * Gamma / nebla_hash), 
    0)
}

tibble(eta = seq(0,1, 0.01), 
       kappa = kappa(eta)) %>% 
  ggplot() + 
  geom_line(aes(x = eta, y = kappa)) + 
  scale_y_continuous(trans='log10')

nebla_change <- function(f, nebla_hash = 0.35, Gamma = 6) {
  (nebla_hash / Gamma) * log10(f)
}
nebla_change(2) * 288


# Problem C ---------------------------------------------------------------

sigma      <- 5.670374419 * 10^(-8)
lapse_rate <- 10
delta_W    <- 4

delta_Z <- 1 / lapse_rate * (delta_W / sigma)^(1/4)
print(delta_Z)
