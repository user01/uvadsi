

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
#' @param rows Numeric or character vector or empty (missing)
#' @return Subset of rows of matrix.
#' @examples
#' get_row(matrix(1:6, nrow = 3), 2)
#' get_row(matrix(1:6, nrow = 3), c(2,3))
#' get_row(matrix(1:6, nrow = 3, byrow = TRUE, dimnames = list(c("a", "b", "c"), c("x", "y"))), "b")
#' @export
get_row <- function(.m, rows) {
  .m[rows, ]
}


#' Set colnames of object
#'
#' @param .m A 2d matrix
#' @param column_names Numeric or character vector or empty (missing)
#' @return Copy of matrix with colnames
#' @examples
#' set_colnames(matrix(1:6, nrow = 3), c("a", "b"))
#' set_colnames(matrix(1:6, nrow = 2), c("a", "b", "c"))
#' set_colnames(matrix(1:6, nrow = 3, byrow = TRUE,
#'              dimnames = list(c("a", "b", "c"), c("x", "y"))), NULL)
#' @export
set_colnames <- function(.m, column_names = NULL) {
  colnames(.m) <- column_names
  .m
}


#' Set rownames of object
#'
#' @param .m A 2d matrix
#' @param row_names Numeric or character vector or NULL
#' @return Copy of matrix with rownames
#' @examples
#' set_rownames(matrix(1:6, nrow = 2), c("a", "b"))
#' set_rownames(matrix(1:6, nrow = 3), c("a", "b", "c"))
#' set_rownames(matrix(1:6, nrow = 3, byrow = TRUE, dimnames = list(c("a", "b", "c"))), NULL)
#' @export
set_rownames <- function(.m, row_names = NULL) {
  rownames(.m) <- row_names
  .m
}
