library(tidyverse)
theme_set(theme_bw)


# Question B
# (i)
a <- 30/ (168 + 30)
print(a)

# (ii)
surface_albedo <- (0.152 -(0.63*0.06 + 0.1*0.85 )) /  .27
print(surface_albedo)

# Question C
# (ii)
((1 /  (198 * .15)) * 1.854 * 10^13) %>% format(scientific = T)
((1 /  (198 * .15)) * 1.854 * 10^13 * 10^(-6)) %>% format(scientific = T)
(((1 /  (198 * .15)) * 1.854 * 10^13 * 10^(-6)) / (2 * 10^4))

# Question D
sigma <- 5.670374419 * 10^{-8}
T <- c(300, 283, 260)
ground <- sigma * T^4
print(ground)
G <- c(210, 130, 60)
toa <- sigma * T^4 - G
print(toa)

ratio <- toa / ground
print(ratio)
plot(c(0,45,90), ratio)

# Question F
