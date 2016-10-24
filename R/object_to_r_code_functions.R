
#' The text of R Code version of vector
#'
#' Large residuals in PRESS not seen in normal residuals can indicate model
#' overfit.
#'
#' @param v A vector
#' @return Character of R Code to make vector
#' @examples
#' vector_to_r_code(1:5)
#' vector_to_r_code(letters[1:5])
#' vector_to_r_code(c(TRUE, FALSE, FALSE, TRUE))
#' @export
#' @importFrom dplyr %>%
vector_to_r_code <- function(v) {
  if (class(v) == "character") {
    v %>%
      paste(collapse = "\",\"") %>%
      paste("c(\"", ., "\")", sep = "")
  } else if (class(v) == "factor") {
    v %>%
      paste(collapse = "\",\"") %>%
      paste("as.factor(c(\"", ., "\"))", sep = "")
  } else {
    v %>%
      paste(collapse = ",") %>%
      paste("c(", ., ")", sep = "")
  }
}


#' The text of R Code version of Data Frame
#'
#' @param df A Data Frame
#' @return Character of R Code to make dataframe
#' @examples
#' dataframe_to_r_code(data.frame(a=1:5))
#' dataframe_to_r_code(data.frame(letters=letters))
#' @export
#' @importFrom dplyr %>%
#' @importFrom purrr map
dataframe_to_r_code <- function(df) {
  df %>%
    colnames %>%
    map(function(name){
      df %>%
        get_(name) %>%
        vector_to_r_code %>%
        (function(code) {
          paste(name, "=", code, sep = "")
        })
      }) %>%
    paste(collapse = ",\n") %>%
    (function(results) {
      paste("data.frame(", results, ",\nstringsAsFactors=FALSE)", sep = "")
    })
}
