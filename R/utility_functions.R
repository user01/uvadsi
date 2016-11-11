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
#' if_else_(1:5, TRUE, sum, mean)
#' if_else_(1:5, FALSE, sum, mean)
#' @export
if_else_ <- function(.data, .truth, .lhs, .rhs) {
  if (.truth) {
    .lhs(.data)
  } else {
    .rhs(.data)
  }
}

#' Returns if the value is invalid
#'
#' Returns True if NA, NULL, NaN, or of length 0
#'
#' @param .data Any
#' @return Logical
#' @examples
#' is_invalid(3)
#' is_invalid(NULL)
#' is_invalid(NaN)
#' is_invalid(list())
#' @export
is_invalid <- function(.data) {
  # This function is adapted from Stack Overflow at:
  # http://stackoverflow.com/a/19655909/2601448
  if (is.function(.data)) {
    return(FALSE)
  }

  return (is.null(.data) ||
          length(.data) == 0 ||
          all(is.na(.data)) ||
          all(.data == "")
         )
}


#' Returns all.equal strictly with a logical
#'
#' Returns True if target and current match, False otherwise. Including
#' parameters for all.equal {base}
#'
#' @param target Any
#' @param current Any
#' @return Logical
#' @seealso \code{\link{all.equal}} is the same function, but the base function
#'   can return more than logical.
#' @examples
#' all.equal_(3, 3)
#' all.equal_(1:5, 1:5)
#' all.equal_(1.1:5.1, 1:5)
#' all.equal_(1.1:5.1, 1:5, tolerance = 0.2)
#' @export
all.equal_ <- function(...) {
  result <- all.equal(...)
  if (is.logical(result)) {
    return(result)
  }
  FALSE
}
