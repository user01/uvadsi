
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
    get_col(c(2, 3)) %>%
    expect_equal(matrix(3:6, nrow = 2))
})

test_that("Get one column name", {
  matrix(1:6,
         nrow = 2,
         byrow = TRUE,
         dimnames = list(c("a", "b"), c("x", "y", "z"))) %>%
    get_col("z") %>%
    expect_equal(c(a = 3, b = 6))
})

test_that("Get two column name", {
  matrix(1:6,
         nrow = 2,
         byrow = TRUE,
         dimnames = list(c("a", "b"), c("x", "y", "z"))) %>%
    get_col(c("x", "z")) %>%
    expect_equal(
      matrix(c(1, 3, 4, 6),
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
    get_row(c(2, 3)) %>%
    expect_equal(matrix(c(2, 3, 5, 6), nrow = 2))
})

test_that("Get one row name", {
  matrix(1:6,
    nrow = 3,
    byrow = TRUE,
    dimnames = list(c("a", "b", "c"), c("x", "y"))) %>%
    get_row("b") %>%
    expect_equal(c(x = 3, y = 4))
})

test_that("Get two row names", {
  matrix(1:6,
    nrow = 3,
    byrow = TRUE,
    dimnames = list(c("a", "b", "c"), c("x", "y"))) %>%
    get_row(c("a", "c")) %>%
    expect_equal(
      matrix(c(1, 2, 5, 6),
        nrow = 2,
        byrow = TRUE,
        dimnames = list(c("a", "c"), c("x", "y")))
      )
})

# #############################################################################
# Set Column Names
# #############################################################################
test_that("Set Column Names 2", {
  matrix(1:6, nrow = 3) %>%
    set_colnames(c("a", "b")) %>%
    expect_equal(
      matrix(1:6,
        nrow = 3,
        dimnames = list(NULL, c("a", "b")))
      )
})

test_that("Set Column Names 3", {
  matrix(1:6, nrow = 2) %>%
    set_colnames(c("a", "b", "c")) %>%
    expect_equal(
      matrix(1:6,
        nrow = 2,
        dimnames = list(NULL, c("a", "b", "c")))
      )
})

test_that("Override Column Names", {
  matrix(1:6, nrow = 2, dimnames = list(NULL, c("x", "y", "z"))) %>%
    set_colnames(c("a", "b", "c")) %>%
    expect_equal(
      matrix(1:6,
        nrow = 2,
        dimnames = list(NULL, c("a", "b", "c")))
      )
})

test_that("Set Column Names Clear", {
  matrix(1:6,
    nrow = 2,
    dimnames = list(NULL, c("a", "b", "c"))) %>%
    set_colnames(NULL) %>%
    expect_equal(matrix(1:6, nrow = 2, dimnames = list(NULL, NULL)))
})

test_that("Set Column Names Clear Empty", {
  matrix(1:6,
    nrow = 2,
    dimnames = list(NULL, c("a", "b", "c"))) %>%
    set_colnames() %>%
    expect_equal(matrix(1:6, nrow = 2, dimnames = list(NULL, NULL)))
})

# #############################################################################
# Set Row Names
# #############################################################################
test_that("Set Row Names 2", {
  matrix(1:6, nrow = 2) %>%
    set_rownames(c("a", "b")) %>%
    expect_equal(
      matrix(1:6,
        nrow = 2,
        dimnames = list(c("a", "b"), NULL))
      )
})

test_that("Set Row Names 3", {
  matrix(1:6, nrow = 3) %>%
    set_rownames(c("a", "b", "c")) %>%
    expect_equal(
      matrix(1:6,
        nrow = 3,
        dimnames = list(c("a", "b", "c"), NULL))
      )
})

test_that("Override Row Names", {
  matrix(1:6, nrow = 3, dimnames = list(c("x", "y", "z"), NULL)) %>%
    set_rownames(c("a", "b", "c")) %>%
    expect_equal(
      matrix(1:6,
        nrow = 3,
        dimnames = list(c("a", "b", "c"), NULL))
      )
})

test_that("Set Row Names Clear", {
  matrix(1:6,
    nrow = 3,
    dimnames = list(c("a", "b", "c"), NULL)) %>%
    set_rownames(NULL) %>%
    expect_equal(matrix(1:6, nrow = 3, dimnames = list(NULL, NULL)))
})

test_that("Set Row Names Empty", {
  matrix(1:6,
    nrow = 3,
    dimnames = list(c("a", "b", "c"), NULL)) %>%
    set_rownames() %>%
    expect_equal(matrix(1:6, nrow = 3, dimnames = list(NULL, NULL)))
})
