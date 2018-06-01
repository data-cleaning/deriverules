
N <- 100
x <- rlnorm(N, meanlog = 10)
y <- runif(N)
y <- 2*x
z <- runif(N)

dat <- data.frame(x = x, y = y, z= z)
pca <- prcomp(dat, scale. = TRUE)
pca

pca$sdev

biplot(pca)

summary(pca)
pca$rotation
round(pca$rotation, 2)

summary(pca$x)


library(fastICA)
a <- fastICA(scale(dat), 2)
a$A


data("retailers", package="validate")
retailers_num <- retailers[-(1:2)]
ret <- retailers_num[complete.cases(retailers_num), ]

pca <- prcomp(ret, scale. = TRUE)
summary(pca)
ica <- fastICA(scale(ret), 6)
colnames(ica$A) <- colnames(ret)
round(ica$A,1)
names(retailers)
