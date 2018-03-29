x <- runif(10)
y <- 2*x

dat <- data.frame(x = x, y = y)
pca <- prcomp(dat, scale. = TRUE)
pca

biplot(pca)

summary(pca)
pca$rotation
pca$x
