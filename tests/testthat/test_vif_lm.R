
# Libraries
suppressPackageStartupMessages(library(car))

# Statics
test_table_1 <- data.frame(
  y = c(sample(1:100, 100)),
  x1 = c(1:95, sample(95:100, 5)),
  x2 = c(1:95 * 2, sample(190:200, 5)),
  x3 = c(sample(1:500, 100))
)

test_1.lm <- lm(y ~ ., data = test_table_1)
test_1_expected.lm <- lm(y ~ x2 + x3, data = test_table_1)
test_1_expected_2.lm <- lm(y ~ x3, data = test_table_1)

test_2_expected.lm <- lm(y ~ x2 + x3, data =  test_table_1)

test_that("Multicollinearity in org. model", {
  vif_lm(test_table_1, "y", 3) -> final_model

  expect_equal(final_model$coefficients[1], test_1_expected.lm$coefficients[1])
  expect_equal(final_model$coefficients[2], test_1_expected.lm$coefficients[2])
  expect_equal(final_model$coefficients[3], test_1_expected.lm$coefficients[3])
})

test_that("Multicollinearity in org. model No Bound called", {
  vif_lm(test_table_1, "y") -> final_model

  expect_equal(final_model$coefficients[1], test_1_expected.lm$coefficients[1])
  expect_equal(final_model$coefficients[2], test_1_expected.lm$coefficients[2])
  expect_equal(final_model$coefficients[3], test_1_expected.lm$coefficients[3])
})

test_that("Multicollinearity in org. model Bound == 1, ERROR", {
  expect_error(vif_lm(test_table_1, "y", 1),
               "model contains fewer than 2 terms")
})

test_that("Run on first pass", {
  vif_lm(test_table_1, "y", 5) -> final_model

  expect_equal(final_model$coefficients[1], test_1_expected.lm$coefficients[1])
  expect_equal(final_model$coefficients[2], test_1_expected.lm$coefficients[2])
})

test_that("Test type is lm", {
  vif_lm(test_table_1, "y", 5) -> final_model

  expect_is(final_model, "lm")
})
