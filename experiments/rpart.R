# outlier based:
# use an outlier score to train a cart model to detect outlier.
# NOTE: we intentionally tweak the size of resulting nodes/
# outliers tend to be all different (from each other)

data(retailers, package="validate")

library(dbscan)
library(simputation)

d <- gower::gower_dist(retailers_num, retailers_num)
outlier_score <- lof(retailers_num)
dbscan::kNN()
