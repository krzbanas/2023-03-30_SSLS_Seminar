# load ggplot2 library
library(ggplot2)

# set seed for reproducibility
set.seed(123)

# create data frame with random positions and colours for squares
n_squares <- 500
df <- data.frame(
  x = runif(n_squares, min = 0, max = 10),
  y = runif(n_squares, min = 0, max = 10),
  colour = sample(rainbow(10), n_squares, replace = TRUE)
)

# create plot with overlapping squares
ggplot(df, aes(x = x, y = y, fill = colour)) +
  geom_rect(aes(xmin = x - 0.1, xmax = x + 0.1, ymin = y - 0.1, ymax = y + 0.1), alpha = 0.8) +
  theme_void() +
  scale_fill_identity() +
  guides(fill = FALSE)



# load ggplot2 library
library(ggplot2)

# set the number of squares to generate
n_squares <- 5000

# create a data frame with random x, y, width, and height values
df <- data.frame(
  x = runif(n_squares, min = 0, max = 10),
  y = runif(n_squares, min = 0, max = 10),
  width = runif(n_squares, min = 0.2, max = 0.5),
  height = runif(n_squares, min = 0.2, max = 0.5),
  color = sample(pastel.colors(10), n_squares, replace = TRUE)
)

# create the plot
ggplot(df, aes(x = x, y = y, width = width, height = height, fill = color)) +
  geom_rect(alpha = 0.8, color = "white", size = 0.1) +
  scale_fill_identity() +
  theme_void() +
  theme(legend.position = "none")




# load ggplot2 library
library(ggplot2)

# define a custom pastel color palette
pastel_colors <- c("#EFC5C5", "#B1D4B7", "#C5D4E4", "#F0E0A4", "#C1D5C1")

# set the number of squares to generate
n_squares <- 5000

# create a data frame with random x, y, width, and height values
df <- data.frame(
  x = runif(n_squares, min = 0, max = 10),
  y = runif(n_squares, min = 0, max = 10),
  width = runif(n_squares, min = 0.2, max = 0.5),
  height = runif(n_squares, min = 0.2, max = 0.5),
  color = sample(pastel_colors, n_squares, replace = TRUE)
)

# create the plot
ggplot(df, aes(x = x, y = y, width = width, height = height, fill = color)) +
  geom_rect(alpha = 0.8, color = "white", size = 0.1) +
  scale_fill_identity() +
  theme_void() +
  theme(legend.position = "none")




# load ggplot2 library
library(ggplot2)

# define a custom pastel color palette
pastel_colors <- c("#EFC5C5", "#B1D4B7", "#C5D4E4", "#F0E0A4", "#C1D5C1")
# define a custom pastel color palette
pastel_colors2 <- c("red", "green", "blue", "orange", "magenta")

# set the number of squares to generate
n_squares <- 15000

# create a data frame with random x, y, width, and height values
df <- data.frame(
  x = runif(n_squares, min = 0, max = 10),
  y = runif(n_squares, min = 0, max = 10),
  width = runif(n_squares, min = 0.1, max = 0.2),
  height = runif(n_squares, min = 0.1, max = 0.2),
  color = sample(pastel_colors2, n_squares, replace = TRUE)
)

# create the plot
ggplot(df, aes(x = x, y = y, fill = color)) +
  geom_rect(aes(xmin = x - width/2, xmax = x + width/2, ymin = y - height/2, ymax = y + height/2),
            alpha = 0.5, color = df$color, size = 0.01) +
  scale_fill_identity() +
  theme_void() +
  theme(legend.position = "none")



