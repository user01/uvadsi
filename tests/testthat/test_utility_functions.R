
# #############################################################################
# get_ Tests
# #############################################################################
test_that("get_ simple", {

  list(a = 1:5, b = 9:10) %>%
    get_("a") %>%
    expect_equal(1:5)

  list(a = 1:5, b = 9:10) %>%
    get_("b") %>%
    expect_equal(9:10)
})

test_that("get_ error", {
    expect_error({
      list(a = 1:5, b = 9:10) %>%
        get_("c")
    }, "object 'c' not found")
})

# #############################################################################
# if_else Tests
# #############################################################################
test_that("if_else simple", {

  1:10 %>%
    if_else(T, sum, mean) %>%
    expect_equal(sum(1:10))

  1:10 %>%
    if_else(F, sum, mean) %>%
    expect_equal(mean(1:10))
})

test_that("if_else compound", {

  1:10 %>%
    if_else(., length(.) > 4, sum, mean) %>%
    expect_equal(sum(1:10))

  1:10 %>%
    if_else(., length(.) < 4, sum, mean) %>%
    expect_equal(mean(1:10))

  1:10 %>%
    if_else(., length(.) %% 2 == 0, first, last) %>%
    expect_equal(1)

  1:11 %>%
    if_else(., length(.) %% 2 == 0, first, last) %>%
    expect_equal(11)
})
