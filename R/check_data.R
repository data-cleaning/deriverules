get_domain <- function(x, ...){
  UseMethod("get_domain")
}

get_domain.numeric <- function(x, ...){
  range(x, na.rm=TRUE)
}

get_domain.factor <- function(x, ...){
  levels(x)
}

get_domain.character <- function(x, ...){
  get_domain.factor(factor(x))
}

