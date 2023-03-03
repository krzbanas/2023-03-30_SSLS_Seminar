library(deSolve)

# Define parameters
tau = 0.01 # time constant
k = 2 # coupling strength
w = 2 # natural frequency

# Define initial conditions
x = 0.5 # neuron 1
y = 0.5 # neuron 2

# Define time vector
t = seq(0, 10, by = 0.01)

# Define differential equations
dx_dt = function(x, y, t) {
  return(-x/tau + k*(y - x) + sin(w*t))
}
dy_dt = function(x, y, t) {
  return(-y/tau + k*(x - y) + sin(w*t))
}

# Solve differential equations
sol = ode(y = c(x = x, y = y), times = t, func = c(dx_dt, dy_dt))

# Plot output
plot(sol[, "time"], sol[, "x"], type = "l", xlab = "Time", ylab = "Activity")
lines(sol[, "time"], sol[, "y"], col = "red")



# Define parameters
tau = 0.01 # time constant
k = 2 # coupling strength
w = 2 # natural frequency

# Define initial conditions
x = 0.5 # neuron 1
y = 0.5 # neuron 2

# Define time vector
t = seq(0, 10, by = 0.01)

# Define differential equations
dx_dt = function(t, x, y) {
  return(-x/tau + k*(y - x) + sin(w*t))
}
dy_dt = function(t, y, x) {
  return(-y/tau + k*(x - y) + sin(w*t))
}

# Solve differential equations
out = ode(y = c(x = x, y = y), times = t, func = c(dx_dt, dy_dt), method = "ode45")

# Plot output
library(ggplot2)
library(tidyr)
library(dplyr)

out_df <- as.data.frame(out) %>% 
  pivot_longer(cols = -time, names_to = "neuron", values_to = "activity")

ggplot(out_df, aes(x = time, y = activity, group = neuron, color = neuron)) +
  geom_line() +
  xlab("Time") +
  ylab("Activity") +
  ggtitle("CPG Activity")



# Define parameters
tau = 0.01 # time constant
k = 1 # coupling strength
w = 1.1 # natural frequency

# Define initial conditions
x = 0.45 # neuron 1
y = 0.5 # neuron 2

# Define time vector
t = seq(0, 10, by = 0.01)

# Define vectorized differential equations
cpg <- function(t, y, p) {
  with(as.list(c(p, y)), {
    dx_dt <- -x/tau + k*(y - x) + sin(w*t)
    dy_dt <- -y/tau + k*(x - y) + sin(w*t)
    return(list(c(dx_dt, dy_dt)))
  })
}

# Solve differential equations
out = ode(y = c(x = x, y = y), times = t, func = cpg, parms = NULL, method = "ode45")

# Plot output
library(ggplot2)
library(tidyr)
library(dplyr)

out_df <- as.data.frame(out) %>% 
  pivot_longer(cols = -time, names_to = "neuron", values_to = "activity")

ggplot(out_df, aes(x = time, y = activity, group = neuron, color = neuron)) +
  geom_line() +
  xlab("Time") +
  ylab("Activity") +
  ggtitle("CPG Activity")