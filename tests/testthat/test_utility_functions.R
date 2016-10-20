
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
