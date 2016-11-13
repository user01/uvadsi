
#' Standard Errors
#'
#' Returns the standard errors of the fit againt the data.
#' (y - yhat)^2
#' Without a supplied dataframe, returns the errors from the training fit
#'
#' @param fit Object of class "lm". A fitted model.
#' @param df DataFrame of predictors and predicted (optional)
#' @return double Squared differences of predicted and actual values
#' @examples
#' data.frame(y=1:5,x=c(1,2,2,4,5)) -> df1
#' data.frame(y=3:7,x=c(3,4,6,5,2)) -> df2
#' lm(y ~ ., df1) -> fit
#'
#' se(fit,df1)
#' se(fit,df2)
#' se(fit)
#'
#' @export
#' @importFrom dplyr %>%
#' @importFrom dplyr first
#' @importFrom purrr %@%
#' @importFrom stats predict
se <- function(fit, df = NULL) {
  if (is.null(df)) {
    # without a supplied to predict the fit, just use the attached values
    fit %>%
      get_("residuals") %>%
      unname %>%
      `^`(2) -> simple_se
    return(simple_se)
  }

  # the first element of the terms is the regressor
  fit %>%
    get_("terms") %@%
    "factors" %>%
    rownames %>%
    first -> regressor

  # return the squared difference between predicted and actual value
  fit %>%
    predict(df) %>%
    `-`(df[[regressor]]) %>%
    `^`(2) %>%
    unname
}
