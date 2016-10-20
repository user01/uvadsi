# Miscellaneous Utility Functions

#' Get an object by name
#'
#' Flips the order of the {base} get()
#'
#' @param .o An object
#' @param name Character vector (or castable)
#' @return Object
#' @examples
#' get_(list(b = 4:2), 'b')
#' @export
get_ <- function(.o, name) {
  get(name, .o)
}


#' Apply logic based on logical
#'
#' If truth is truthy, applies lhs to data. Else, apply rhs to data
#'
#' @param .data Any value
#' @param .truth Logical Value
#' @param .lhs A function
#' @param .rhs A function
#' @return Any
#' @examples
#' if_else(1:5, TRUE, sum, mean)
#' if_else(1:5, FALSE, sum, mean)
#' @export
if_else <- function(.data, .truth, .lhs, .rhs) {
  if (.truth) {
    .lhs(.data)
  } else {
    .rhs(.data)
  }
}
