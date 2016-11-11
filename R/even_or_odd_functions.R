

even_count_of_elements <- function(v) {
  (length(v) %% 2) == 0
}

even_or_odd <- function(v){
  if (even_count_of_elements(v)) {
    return("Even")
  }
  if (sum(v %% 2== 0) > 0) {
    return("Even")
  }
  return("Odd")
}
