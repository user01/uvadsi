
# Libraries
suppressPackageStartupMessages(library(purrr))
suppressPackageStartupMessages(library(dplyr))

# #############################################################################
# Column selection
# #############################################################################
test_that("Get empty column", {
  matrix(1:6, nrow = 2) %>%
    get_col() %>%
    expect_equal(matrix(1:6, nrow = 2))
})

test_that("Get one column index", {
  matrix(1:6, nrow = 2) %>%
    get_col(2) %>%
    expect_equal(c(3, 4))
})

test_that("Get two columns indices", {
  matrix(1:6, nrow = 2) %>%
    get_col(c(2,3)) %>%
    expect_equal(matrix(3:6, nrow = 2))
})

test_that("Get one column name", {
  matrix(1:6,
         nrow = 2,
         byrow = TRUE,
         dimnames = list(c("a", "b"), c("x", "y", "z"))) %>%
    get_col("z") %>%
    expect_equal(c(a=3,b=6))
})

test_that("Get two column name", {
  matrix(1:6,
         nrow = 2,
         byrow = TRUE,
         dimnames = list(c("a", "b"), c("x", "y", "z"))) %>%
    get_col(c("x","z")) %>%
    expect_equal(
      matrix(c(1,3,4,6),
             nrow = 2,
             byrow = TRUE,
             dimnames = list(c("a", "b"), c("x", "z")))
      )
})
