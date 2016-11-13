
se <- function(fit, df = NULL) {
  if (is.null(df)) {
    # without a supplied to predict the fit, just use the attached values
    fit %>%
      get_("residuals") %>%
      unname %>%
      `^`(2) -> simple_se
    return(simple_se)
  }

  fit %>%
    get_("terms") %@%
    "factors" %>%
    rownames %>%
    first -> regressor

  fit %>%
    predict(df) %>%
    `-`(df[[regressor]]) %>%
    `^`(2) %>%
    unname
}
