
# #############################################################################
# even_or_odd Tests
# #############################################################################
test_that("even tests", {

  # 1 2 3 4 has 4 elements, must be even
  even_or_odd(1:4) %>%
    expect_equal("Even")

  # 1 2 3 has 3 elements, but one even number, so this is also even
  even_or_odd(1:3) %>%
    expect_equal("Even")

  # 1 2 3 4 5 has 5 elements, but both 2 and 4 are even, so this is even
  even_or_odd(1:5) %>%
    expect_equal("Even")

  # 2 3 4 has 3 elements, but both 2 and 4 are even, so this is even
  even_or_odd(2:4) %>%
    expect_equal("Even")

})

test_that("odd tests", {
  # 1 has only 1 element and no even elements, so this should be odd
  even_or_odd(1) %>%
    expect_equal("Odd")
})
