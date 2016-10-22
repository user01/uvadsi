
# Libraries
suppressPackageStartupMessages(library(purrr))
suppressPackageStartupMessages(library(dplyr))

# #############################################################################
# combo Tests
# #############################################################################
test_that("combo int", {
  1:3 %>%
    combo_int -> combos

  combos %>%
    length %>%
    expect_equal(7)

  combos %>%
    walk(function(v){
      expect_equal(
          v %>% typeof,
          'integer'
        )
      })

  list(2:3, c(1, 3), 3, 1:2, 2, 1, 1:3) %>%
    expect_equal(combos)
})

test_that("combo dbl", {
  1.5:3.5 %>%
    combo_dbl -> combos

  combos %>%
    length %>%
    expect_equal(7)

  combos %>%
    walk(function(v){
      expect_equal(
          v %>% typeof,
          'double'
        )
      })

  list(2.5:3.5, c(1.5, 3.5), 3.5, 1.5:2.5, 2.5, 1.5, 1.5:3.5) %>%
    expect_equal(combos)
})

test_that("combo chr", {
  1:3 %>%
    as.character %>%
    combo_chr -> combos

  combos %>%
    length %>%
    expect_equal(7)

  combos %>%
    walk(function(v){
      expect_equal(
          v %>% typeof,
          'character'
        )
      })

  list(2:3, c(1, 3), 3, 1:2, 2, 1, 1:3) %>%
    map(function(x) as.character(x) ) %>%
    expect_equal(combos)
})

test_that("combo list", {
  list(1:3, letters[3:6]) %>%
    combo_list -> combos

  combos %>%
    length %>%
    expect_equal(3)

  combos %>%
    walk(function(v){
      expect_equal(
          v %>% typeof,
          'list'
        )
      })

  list(list(letters[3:6]), list(1:3), list(1:3, letters[3:6])) %>%
    expect_equal(combos)
})

test_that("combo standard", {
  list(1:3, letters[3:6]) %>%
    combo -> combos

  combos %>%
    length %>%
    expect_equal(3)

  combos %>%
    walk(function(v){
      expect_equal(
          v %>% typeof,
          'list'
        )
      })

  list(list(letters[3:6]), list(1:3), list(1:3, letters[3:6])) %>%
    expect_equal(combos)
})


test_that("combo empty", {
  c() %>%
    combo %>%
    expect_equal(list())

  NULL %>%
    combo %>%
    expect_equal(list())
})
