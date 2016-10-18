
#' Compute the PRESS Residuals for a class of "lm"
#' Large residuals in PRESS not seen in normal residuals can indicate model
#' overfit.
#'
#' @param fit An object of class "lm"
#' @return The PRESS residuals, \code{ei} / \code{1 - hii}.
#' @examples
#' lm(y~.,data.frame(y=1:5,x=10:14)) -> fit
#' residuals_PRESS(fit)
#' @export
#' @importFrom dplyr %>%
#' @importFrom stats lm.influence
#' @importFrom stats residuals
residuals_PRESS <- function(fit) {
  hat <- lm.influence(fit)$hat
  fit %>%
    residuals() %>%
    `/`(1 - hat) %>%
    unname
}
