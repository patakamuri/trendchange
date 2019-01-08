#' @title Sequential Mann-Kendall Plot
#'
#' @description The series is rearranged based on the ranks of the original series. Prograde and retrograde series plots are generated as per Sneyers (1990). The point where prograde and retrograde series intersect will approximately indicate the possible point of change.
#'
#' @importFrom  graphics abline legend lines plot
#'
#' @importFrom stats plot.ts ts
#'
#' @usage sqmk(x,startyear)
#'
#' @param  x  - Time series data vector
#'
#' @param  startyear  - Starting of the time series (year!)
#'
#' @return  Prograde  - Prograde series
#'
#'Retrograde  - Retrograde series
#'
#'Intersection  - True if intersecting and False if not intersecting.
#'
#' @references Sneyers S (1990) On the statistical analysis of series of observations. Technical note no 5 143, WMO No 725 415 Secretariat of the World Meteorological Organization, Geneva, 192 pp
#'
#' @details The point where prograde series and retrograde series intersect, will indicate probable change point in the series. When there is no clear trend in the data, the series will intersect at several locations.
#'
#' @examples x<-c(Nile)
#' sqmk(x,1871)
#'
#' @export
#'
sqmk<-function(x, startyear = 1) {

  #Input Vector
  x <- x
  #Input Vector arranged in ascending order (x[1]<=x[2]<=x[3]<=...<=x[n])
  xr <- rank(x)

  xdr <- rev(xr)

  #Calculating test statistic

  l <- length(xr)
  nf <- NULL
  nr <- NULL
  ip <- NULL
  ip[1] <- ip[l] <- FALSE
  i <- 1:l

  for(j in 1:l){
    nf[j] <- sum(as.numeric((i<j)&(xr<xr[j]))) #for difference series
    nr[j] <- sum(as.numeric((i<j)&(xdr<xdr[j]))) #for difference series reversal
  }

  tf <- cumsum(nf)
  tr <- cumsum(nr)

  #Calculating prograde and retrograde series
  k <- 1:l
  mean.val <- (k*(k-1))/4
  variance.val <- (k*(k-1)*(2*k+5))/72

  prog <- NULL
  retr <- NULL

  prog <- ((tf-mean.val)/(sqrt(variance.val)))
  retr <- ((tr-mean.val)/(sqrt(variance.val)))
  prog[1] <- 0
  retr[1] <-0
  prog1 <- prog
  retr1 <- -rev(retr)

  difference <- prog1 - retr1

  for (a in 1:(l-2)) {
    if(sign(difference[a])==sign(difference[a+1])) { ip[a+1] <- FALSE }
    else { ip[a+1] <- TRUE }
  }


  #Generating Gerstengarbe and Werner plot or Sequential Mann-Kendall plot
  prograde <- ts(prog1, frequency = 1,start = c(startyear, 1))
  retrograde <- ts(retr1, frequency = 1,start = c(startyear, 1))
  ymin <- min(prog1,retr1)
  ymax <- max(prog1,retr1)
  plot.ts(prograde,type = "l", lty = 1, ylim = c(ymin,ymax),xlab = "Year", ylab = "U(t) and U'(t)", main = "Sequential Mann-Kendall plot")
  lines(retrograde, type = "l", lty = 2)
  abline(h = -1.96, lty=3)
  abline(h = 1.96, lty=3)
  legend("bottomright",legend=c("Prograde","Retrograde","95% CI"),lty=c(1,2,3),box.lty = 1, horiz = T)

  return(list("Prograde-Series" = prog1, "Retrograde-Series" = retr1, "Intersection" = ip))

}
