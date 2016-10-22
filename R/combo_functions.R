
#' Provide combinations of vector elements
#'
#' Returns a map of all non-empty combinations of set. Returns an empty list if
#' given an empty or invalid value.
#'
#' @param .set Vector of values to combine
#' @param .map_fn Function to map over .set elements
#' @return List of vectors (chr, lgl, int, dbl) that match set type
#' @importFrom dplyr %>% nth
#' @importFrom purrr transpose map discard
combo_internal <- function(.set, .map_fn) {
  # For invalid choices (empty, or NaN, etc), return an empty list
  if (is_invalid(.set)) {
    return(list())
  }

  .set %>%
    (function(e) {
      list(e, 1:length(e))
    }) %>%
    transpose -> elements

  seq(1, 2 ** length(.set)) %>%
    map(function(mask){
      elements %>%
        discard(function(pair){
          # if the pair index is masked (0), drop it. keep if slot is 1
          pair %>%
            nth(2) %>%
            `-`(1) %>%
            (function(e) {
              bitwShiftL(1, e)
            }) %>%
            bitwAnd(mask) %>%
            `>`(0)
        }) %>%
        .map_fn(function(e) {
          nth(e, 1)
        } )
    }) %>%
    discard(function(e) {
      length(e) < 1 # ignore empties (probably not useful)
    } )
}



#' Combinations of list elements
#'
#' Returns a map of all non-empty combinations of set. Returns an empty list if
#' given an empty or invalid value.
#'
#' @param .set List of values to combine
#' @return List of list of values
#' @examples
#' combo_list(list(list(1:5),list(6:10),list(11:15)))
#' @importFrom purrr map
#' @export
combo_list <- function(.set) {
  combo_internal(.set, map)
}


#' Combinations of integer vector
#'
#' Returns a map of all non-empty combinations of set. Returns an empty list if
#' given an empty or invalid value.
#'
#' @param .set Integer vector to combine
#' @return List of vector of integer combinations
#' @examples
#' combo_int(1:5)
#' @importFrom purrr map_int
#' @export
combo_int <- function(.set) {
  combo_internal(.set, map_int)
}


#' Combinations of double vector
#'
#' Returns a map of all non-empty combinations of set. Returns an empty list if
#' given an empty or invalid value.
#'
#' @param .set Double vector to combine
#' @return List of vector of double combinations
#' @examples
#' combo_dbl(1.5:5.5)
#' @importFrom purrr map_dbl
#' @export
combo_dbl <- function(.set) {
  combo_internal(.set, map_dbl)
}


#' Combinations of character vector
#'
#' Returns a map of all non-empty combinations of set. Returns an empty list if
#' given an empty or invalid value.
#'
#' @param .set Character vector to combine
#' @return List of vector of character combinations
#' @examples
#' combo_chr(letters[1:5])
#' @importFrom purrr map_chr
#' @export
combo_chr <- function(.set) {
  combo_internal(.set, map_chr)
}


#' Combinations of list elements
#'
#' Returns a map of all non-empty combinations of set. Returns an empty list if
#' given an empty or invalid value.
#'
#' @param ... Vectors data
#' @return List of list of values
#' @examples
#' combo(list(list(1:5),list(6:10),list(11:15)))
#' @export
combo <- function(...) {
  combo_list(...)
}
