# Miscellaneous Utility Functions

#' Get an object by name
#'
#' Flips the order of the {base} get()
#'
#' @param .o An object
#' @param name Character vector
#' @return Object
#' @examples
#' get_(list(b = 4:2), 'b')
#' @export
get_ <- function(.o, name) {
  get(name, .o)
}
