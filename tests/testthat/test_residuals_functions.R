
# Libraries
suppressPackageStartupMessages(library(purrr))
suppressPackageStartupMessages(library(dplyr))

# Statics
table.3.2 <- data.frame(
  y=c(16.68,11.5,12.03,14.88,13.75,18.11,8,17.83,79.24,21.5,40.33,21,13.5,
      19.75,24,29,15.35,19,9.5,35.1,17.9,52.32,18.75,19.83,10.75),
  x1=c(7,3,3,4,6,7,2,7,30,5,16,10,4,6,9,10,6,7,3,17,10,26,9,8,4),
  x2=c(560,220,340,80,150,330,110,210,1460,605,688,215,255,462,448,776,200,132,
       36,770,140,810,450,635,150)
  )
lm(y~.,table.3.2) -> fit.table.3.2
press_expected.table.3.2 <- c(-5.598,1.2336,-0.0557,5.2297,-0.4804,-0.3025,
                              0.9198,1.2353,14.7888,2.9568,2.4484,-0.6690,
                              1.0938,1.1581,0.7,-0.7948,0.464,3.8159,1.9846,
                              -6.4432,-3.1318,-6.0591,-4.8059,-5.2,-0.2278)
lm(y~., data.frame(y=1:10,x=1:10)) -> fit.empty


test_that("PRESS Residuals Full", {
  residuals_PRESS(fit.table.3.2) -> press_actual

  list(press_expected.table.3.2, press_actual) %>%
    transpose %>%
    map(unlist) %>%
    map(function(l){
      l[1] - l[2]
    }) %>%
    map(function(d){
      expect_lt(d, 0.0001)
    })
})


test_that("PRESS Residuals Simple", {
  residuals_PRESS(fit.empty) -> press_actual

  press_actual %>%
    map(function(d){
      expect_lt(d, 0.0001)
    })
})
