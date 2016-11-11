
#' Checks if the number of elements in a vector is even or not
#'
#' @param v Vector of any type
#' @return logical TRUE if the vector has an Even length, FALSE otherwise
even_count_of_elements <- function(v) {
  (length(v) %% 2) == 0
}

#' Marks a numeric vector as either Even or Odd
#'
#' If the vector has an even number of elements, then it is always Even
#' If the vector has an odd number of elements, but any of them are even
#'  then the result is Even
#' Otherwise, the result is "Odd"
#'
#' @param v Vector of numeric type
#' @return character Either "Even" or "Odd"
#' @examples
#' even_or_odd(1:4)
#' even_or_odd(1:3)
#' even_or_odd(1:5)
#' even_or_odd(2:4)
#' even_or_odd(2)
#' @export
even_or_odd <- function(v){
  if (even_count_of_elements(v)) {
    return("Even")
  }
  if (sum(v %% 2== 0) > 0) {
    return("Even")
  }
  return("Odd")
}
