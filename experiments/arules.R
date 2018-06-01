library(arules)

data(retailers, package="validate")
d <- discretizeDF(retailers[-2])

a <- arules::apriori(d, parameter = list(supp=0.1, conf=0.95))
a1 <- as(a, "data.frame")
a1$lhs <- as(lhs(a), "list")
o <- with(a1, order(confidence, support, decreasing = TRUE))
View(a1[o,])

d2 <- table(d)
d3 <- as.data.frame(d2)
nrow(d3)
View(d3)



a1$lhs[[1]]

INTERVAL <- "[[(].+,.+[])]"

grep(INTERVAL, "[12,13]")


# deparses a found rule into a logical AND statement. Assumes either categorical values
# or interval values.
rule_deparse <- function(x, ...){
  value <- sub(".+=", "", x)
  names(value) <- sub("=.+", "", x)
  intval <- grepl(INTERVAL, value)

  lin_lower <- sub(",.+", "", value[intval])
  lin_lower_op <- rep(">=", length(lin_lower))
  lin_lower_op[grep("\\(", lin_lower)] <- ">"
  lin_lower <- sub("\\[|\\(", "", lin_lower)
  lin_lower <- as.numeric(lin_lower)

  lin_upper <- sub(".+,", "", value[intval])
  lin_upper_op <- rep("<=", length(lin_upper))
  lin_upper_op[grep("\\(", lin_upper)] <- "<"
  lin_upper <- sub("\\]|\\)", "", lin_upper)
  lin_upper <- as.numeric(lin_upper)

  cat_ex <- value[!intval]
  expr  <- c( paste0(names(cat_ex), " == ", "\"", cat_ex, "\"")
            , paste(names(value[intval]), lin_lower_op, lin_lower)
            , paste(names(value[intval]), lin_upper_op, lin_upper)
            )
  parse(text = expr )
}

lapply(a1$lhs, rule_deparse)
