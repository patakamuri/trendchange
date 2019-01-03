#' @title Innovative Trend Analysis
#'
#' @description Innovative trend analysis method proposed by Zekai Sen (2011) is implemented in this function.
#'
#' @importFrom  graphics abline legend lines plot
#'
#' @importFrom stats plot.ts ts
#'
#' @usage innovtrend(x)
#'
#' @param  x  - Time series data vector
#'
#' @references Şen Z (2011) Innovative Trend Analysis Methodology. J Hydrol Eng 17:1042–1046. <doi: 10.1061/(ASCE)HE.1943-5584.0000556>.
#'
#' @details If the data points lay on 1:1 line, there is no trend in the data. If the data points exist in the top triangle, it is indicative of positive trend. If the data lies in the bottom triangle, it indicates negative trend in the data.
#'
#' @examples x<-c(Nile)
#' innovtrend(x)
#'
#' @export

innovtrend <-  function(x) {

  # Initialize the test Parameters

  # Time-Series Vector

  x = x
  xbar = mean(x)

  # Length of time-series

  n <- length(x)

  # First half of time-series arranged in ascending order

  fh <- sort(x[1:(n/2)])


  # Second half of time-series arranged in ascending order

  sh <- sort(x[((n+2)/2):n])

  # Plotting first half versus second half of the series


  plot(fh, sh, pch = 1, main = "Innovative Trend Analysis", xlab = "First half of the series", ylab = "Second half of the series",xlim = c(min(x),max(x)),ylim = c(min(x),max(x)))


  #plotting 1:1 no trend line

  abline(a=0,b=1, lty = 1, lwd = 1)->nt

  legend("bottomright",legend=c("No Trend"),pch=c(NA,NA,NA),lty = 1, box.lty = 1)

  }


