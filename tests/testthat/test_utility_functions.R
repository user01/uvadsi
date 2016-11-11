
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
    }
    , "object 'c' not found")
})

# #############################################################################
# if_else_ Tests
# #############################################################################
test_that("if_else_ simple", {

  1:10 %>%
    if_else_(TRUE, sum, mean) %>%
    expect_equal(sum(1:10))

  1:10 %>%
    if_else_(FALSE, sum, mean) %>%
    expect_equal(mean(1:10))
})

test_that("if_else_ compound", {

  1:10 %>%
    if_else_(., length(.) > 4, sum, mean) %>%
    expect_equal(sum(1:10))

  1:10 %>%
    if_else_(., length(.) < 4, sum, mean) %>%
    expect_equal(mean(1:10))

  1:10 %>%
    if_else_(., length(.) %% 2 == 0, first, last) %>%
    expect_equal(1)

  1:11 %>%
    if_else_(., length(.) %% 2 == 0, first, last) %>%
    expect_equal(11)
})

# #############################################################################
# is_invalid Tests
# #############################################################################
test_that("is_invalid TRUE", {

  expect_true(is_invalid(NULL))
  expect_true(is_invalid(NaN))
  expect_true(is_invalid(NA))
  expect_true(is_invalid(c()))
  expect_true(is_invalid(list()))
})

test_that("is_invalid FALSE", {

  expect_false(is_invalid(1))
  expect_false(is_invalid("NaN"))
  expect_false(is_invalid(1:40))
  expect_false(is_invalid(1.4:40))
  expect_false(is_invalid(list(1, 2, 3)))
  expect_false(is_invalid(is_invalid))
})

# #############################################################################
# all.equal_ Tests
# #############################################################################
test_that("all.equal_ TRUE", {
  expect_true(all.equal_(TRUE, TRUE))
  expect_true(all.equal_(-1:-900, -1:-900))
  expect_true(all.equal_(1:5, 1:5))
  expect_true(all.equal_(1.1:5.1, 1:5, tolerance = 0.2))
})

test_that("all.equal_ FALSE", {
  expect_false(all.equal_(TRUE, FALSE))
  expect_false(all.equal_(-1:-900, -1:-9))
  expect_false(all.equal_(1:5, 1.1:5))
  expect_false(all.equal_(1.1:5.1, 1:5, tolerance = 0.004))
})
