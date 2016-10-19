
# Libraries
suppressPackageStartupMessages(library(purrr))
suppressPackageStartupMessages(library(dplyr))

# #############################################################################
# Column Selection
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

# #############################################################################
# Row Selection
# #############################################################################
test_that("Get empty row", {
  matrix(1:6, nrow = 3) %>%
    get_row() %>%
    expect_equal(matrix(1:6, nrow = 3))
})

test_that("Get one row index", {
  matrix(1:6, nrow = 3) %>%
    get_row(2) %>%
    expect_equal(c(2, 5))
})

test_that("Get two row indices", {
  matrix(1:6, nrow = 3) %>%
    get_row(c(2,3)) %>%
    expect_equal(matrix(c(2,3,5,6), nrow = 2))
})

test_that("Get one row name", {
  matrix(1:6,
    nrow = 3,
    byrow = TRUE,
    dimnames = list(c("a", "b", "c"), c("x", "y"))) %>%
    get_row("b") %>%
    expect_equal(c(x=3,y=4))
})

test_that("Get two row names", {
  matrix(1:6,
    nrow = 3,
    byrow = TRUE,
    dimnames = list(c("a", "b", "c"), c("x", "y"))) %>%
    get_row(c("a","c")) %>%
    expect_equal(
      matrix(c(1,2,5,6),
        nrow = 2,
        byrow = TRUE,
        dimnames = list(c("a", "c"), c("x", "y")))
      )
})
