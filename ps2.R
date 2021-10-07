library(tidyverse)
theme_set(theme_bw())
out <- "/Users/tombearpark/Documents/princeton/2nd_year/term1/GEO_561/ps/ps2/out/"

########################################################
# A 
########################################################

# (i)
2 * (390 - 235) / 235

# (ii)
2*(155/ 235 + 1) - 1

# (iii)
tau <- 2 * (640 / 235) - 2
tau

# (iv)
exp(-tau) * 640 / 235

########################################################
# C
########################################################
# (i)

df <- tibble(p = seq(0, 1, 0.01), 
              `Beta = 1`  =  p ^ 1, 
              `Beta = 2`  =  p ^ 2,
              `Beta = .5` =  p ^ .5)

df %>% 
  pivot_longer(cols = -p, names_to = "Beta", values_to = "tau") %>% 
  ggplot() + 
  geom_line(aes(x = tau, y = p, color = Beta)) + 
  xlab("Tau / Tau_0") + ylab("P / P_0") + 
  scale_y_reverse() 
ggsave(paste0(out, "C_i.png"), height = 3, width = 5)

# ii)
# yaxis is pressure, x axis is B
df %>% 
  pivot_longer(cols = -p, names_to = "Beta", values_to = "B") %>% 
  ggplot() + 
  geom_line(aes(x = B, y = p, color = Beta)) + 
  xlab("B / B_0") + ylab("P / P_0") + 
  scale_y_reverse() 
ggsave(paste0(out, "C_ii.png"), height = 3, width = 5)
