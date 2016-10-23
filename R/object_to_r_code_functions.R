
#' The text of R Code version of vector
#'
#' Large residuals in PRESS not seen in normal residuals can indicate model
#' overfit.
#'
#' @param v A vector
#' @return Character of R Code to make vector
#' @examples
#' vector_to_r_code(1:5)
#' vector_to_r_code(letters)
#' vector_to_r_code(c(T,F,F,T))
#' @export
#' @importFrom dplyr %>%
vector_to_r_code <- function(v) {
  if (class(v) == 'character') {
    v %>%
      paste(collapse = "\",\"") %>%
      paste("c(\"", . ,"\")", sep="")
  } else if (class(v) == 'factor') {
    v %>%
      paste(collapse = "\",\"") %>%
      paste("as.factor(c(\"", ., "\"))", sep = "")
  } else {
    v %>%
      paste(collapse = ",") %>%
      paste("c(", ., ")", sep = "")
  }
}
