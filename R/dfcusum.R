#' @title Distribution Free CUSUM Test
#'
#' @description Distribution free CUSUM test is used to identify the change point in a series of data.
#'
#' @importFrom  graphics abline legend lines plot
#'
#' @importFrom stats median plot.ts ts
#'
#' @usage dfcusum(x,startyear)
#'
#' @param  x  - Time series data vector
#'
#' @param  startyear  - Starting of the time series (year!)
#'
#' @return  CUMSUM values - Cumulative sum series
#'
#' Maximum CUMSUM Value  - Absolute Maximum value in cumulative sum series
#'
#' 90 percent CI - Critical value at 90 percent Confidence Interval (1.228*sqrt(n))
#'
#' 95 percent CI - Critical value at 95 percent Confidence Interval (1.36*sqrt(n))
#'
#' 99 percent CI - Critical value at 99 percent Confidence Interval (1.63*sqrt(n))
#'
#' @references Grayson, R.B., Argent, R.M., Nathan, R.J., McMahon, T.A. and Mein, R., 1996 Hydrological Recipes: Estimation Techniques in Australian Hydrology. Cooperative Research Centre for Catchment Hydrology, Australia, 125 pp.
#'
#' @details The point at which Maximum value of cumulative sum occurs, will indicate the change point in the time series. If the maximum value is equal to or greater than the critical value, it indicates significance of the change point.
#'
#' @examples x<-c(Nile)
#' dfcusum(x,1871)
#'
#' @export
#'
dfcusum<-function(x, startyear = 1) {

  #Input Vector
  x <- x
  n <- length(x)
  s <- NULL
  v <- NULL

  #Calculting sign series
  for(i in 1:n){
    s[i] <- sign(x[i]-median(x))
  }

  #Calculating cumulative sum series and Maximum value
  v <- cumsum(s)
  vmax <- max(abs(v))

  #Calculating Critical values
  cv90 <- 1.22 * sqrt (n)
  cv95 <- 1.36 * sqrt (n)
  cv99 <- 1.63 * sqrt (n)

  #Generating distribution free CUSUM plot
  vts <- ts(v, frequency = 1,start = c(startyear, 1))
  plot.ts(vts,type = "l", lty = 1, pch = 2, xlab = "Year", ylab = "CUSUM Values", main = "Distribution free CUSUM plot")
  legend("bottomright",legend=c("CUSUM Plot"),lty = 1, box.lty = 1)

  return(list("CUMSUM Values" = v, "Maximum CUMSUM value" = vmax, "Critical value at 90% CI" = cv90, "Critical value at 95% CI" = cv95, "Critical value at 99% CI" = cv99))
}
