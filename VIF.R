
#' Produce a linear model in which no variables in the final model
#' in which no multicollinearity is present as determined by the 
#' variance inflation factor (VIF) 
#' 
#' @param frame An object of class 'data.frame'
#' @param pred An string object of the response variable
#' @param bound An optional numeric object (default = 5)
#' @return A linear model containing no multicollinearity
#' @examples
#' d <- data.frame(y=1:5,x1=6:10,x2=11:15,x3=16:20)
#' vif_lm(d,'y',5)
#' 
#' vif_lm(d,'y')
#' @export
#' @importFrom car vif
#' @importFrom stats lm
vif_lm <- function(frame, pred, bound){

  if(missing(bound)) {
    bound = 5
  } else {
    bound
  }

  frame <- as.data.frame(frame)
  response <- pred

  varslist <- names(frame)
  varslist <- varslist[varslist != response]

  model <- lm(paste(response," ~ ", paste(varslist, collapse= "+")), data = frame)

  vifs <- car::vif(model) # store VIFs of original function

  maxVIF <- max(vifs) # find predictor that has maximum of VIF

  while (maxVIF > bound){ # Will continue to run loop until all vif values are less than set bound
    del = 0
    maxVar <- vifs == maxVIF # create boolean vector of predictors with max if being T
    for (i in seq(varslist)){ # cycle through variable list
      if(maxVar[i] == T){ # find varible with max vif
        del = i} # index max vif variable
    }
    varslist <- varslist[-del] # remove highest vif variable
    model <- lm(paste(response," ~ ", paste(varslist, collapse= "+")), data = frame)
    vifs <- car::vif(model) # check new vifs
    maxVIF <- max(vifs) # find maximum vif, if max > bound will continue
  }

  return(model)

}

d <- data.frame(y=1:5,x1=6:10,x2=11:15,x3=16:20)
