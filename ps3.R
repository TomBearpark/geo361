library(dplyr)
library(purrr)
library(ggplot2)
library(glue)
library(latex2exp)
theme_set(theme_light())
dir <- '/Users/tombearpark/Documents/princeton/2nd_year/term1/GEO_561/ps/ps3/'

k <- function(lambda, delta, lambda0, k0){
  
  tibble(lambda = lambda, delta = delta, lambda0 = lambda0, k0 = k0,
         Configuration = glue("Delta = {delta}, lambda_0 = {lambda0}, k_0 = {k0}"),
         k = ifelse(between(lambda, lambda0 - delta, lambda0 + delta), k0, 0))
}
range <- seq(-4, 4, 0.01)
map_dfr(range, k, 1,0,1) %>% 
  bind_rows(
    map_dfr(range, k, 2,0,0.5)    
  ) %>% 
  ggplot() + 
  geom_line(aes(x = lambda, y = k, color = Configuration))
ggsave(paste0(dir, "k.png"), height = 3, width = 7)


ratio <- function(tau){
  ((1 - exp(-tau / 2))*2) / (1 - exp(-tau ))
}
tibble(tau = seq(0, 5, 0.01), ratio = ratio(tau)) %>% 
  ggplot() + 
  geom_line(aes(x = tau, y = ratio))
ggsave(paste0(dir, "ratio.png"), height = 4, width = 5)
