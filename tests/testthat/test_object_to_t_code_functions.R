
# Libraries
suppressPackageStartupMessages(library(purrr))
suppressPackageStartupMessages(library(dplyr))

# #############################################################################
# vector_to_r_code Tests
# #############################################################################

globalVariables(c("test_vector_to_r_code", "test__to_r_code"))

test_vector_to_r_code <- function(vv) {
    vv %>%
      vector_to_r_code %>%
      (function(chr) {
        parse(text = chr)
      }) %>%
      eval %>%
      expect_equal(vv)
}

test_that("vector_to_r_code", {
  1:3 %>% test_vector_to_r_code
  130:9 %>% test_vector_to_r_code
  seq(1, 200, 5) %>% test_vector_to_r_code
})

test_that("vector_to_r_code double", {
  1.5:3 %>% test_vector_to_r_code
  130.23:9 %>% test_vector_to_r_code
  seq(1, 200, 3.3) %>% test_vector_to_r_code
})

test_that("vector_to_r_code character", {
  letters %>% test_vector_to_r_code
  c("a", "d", "log") %>% test_vector_to_r_code
  "seq(1,200,3.3)" %>% test_vector_to_r_code
})

test_that("vector_to_r_code logical", {
  TRUE %>% test_vector_to_r_code
  c(TRUE, TRUE, FALSE) %>% test_vector_to_r_code
  rep(c(TRUE, TRUE, FALSE, TRUE), 50) %>% test_vector_to_r_code
})


# #############################################################################
# dataframe_to_r_code Tests
# #############################################################################

test_dataframe_to_r_code <- function(df) {
    df %>%
      dataframe_to_r_code %>%
      (function(chr) {
        parse(text = chr)
      }) %>%
      eval %>%
      expect_equal(df)
}

test_that("dataframe_to_r_code simple", {
  data.frame(a = 1:4) %>% test_dataframe_to_r_code
  data.frame(a = 2000:400) %>% test_dataframe_to_r_code
  data.frame(a = 1:26, letters = letters) %>% test_dataframe_to_r_code
})

test_that("dataframe_to_r_code complex", {
  data.frame(a = 1:26, letters = letters, lgl = rep(c(TRUE, FALSE), 13)) %>%
    mutate(cletters = as.character(letters)) %>%
    test_dataframe_to_r_code
})
