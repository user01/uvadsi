

#' Select columns by indices
#'
#' @param .m A 2d matrix
#' @param cols Numeric or character vector or empty (missing)
#' @return Subset of columns of matrix.
#' @examples
#' get_col(matrix(1:6, nrow = 2), 2)
#' get_col(matrix(1:6, nrow = 2), c(2,3))
#' get_col(matrix(1:6, nrow = 2, byrow = TRUE, dimnames = list(c("a", "b"), c("x", "y", "z"))), "z")
#' @export
get_col <- function(.m, cols) {
  .m[, cols]
}


#' Select rows by indices
#'
#' @param .m A 2d matrix
#' @param cols Numeric or character vector or empty (missing)
#' @return Subset of rows of matrix.
#' @examples
#' get_row(matrix(1:6, nrow = 3), 2)
#' get_row(matrix(1:6, nrow = 3), c(2,3))
#' get_row(matrix(1:6, nrow = 3, byrow = TRUE, dimnames = list(c("a", "b", "c"), c("x", "y"))), "b")
#' @export
get_row <- function(.m, rows) {
  .m[rows, ]
}
