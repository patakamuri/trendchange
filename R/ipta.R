#' @title Innovative Polygon Trend Analysis
#'
#' @description Innovative Polygon Trend Analysis method proposed by Sen et al. (2019) is implemented in this function.
#' This function is implemented to work with monthly time series. Users are advised to prepare input data frame as provided in example.
#'
#' @importFrom  graphics abline legend lines plot text
#'
#' @importFrom grDevices rgb
#'
#' @usage ipta(x = x, y = y, Monthly = Monthly)
#'
#' @param  x  - First half of Time series data vector
#' @param  y  - First half of Time series data vector
#' @param  Monthly  - Months of Time series data vector
#' @return  Slope  - Slope of the trend
#'
#' Distance  - Trend indicator
#'
#' @references Sen, Z., Sisman, E., Dabanli, I., 2019. Innovative Polygon Trend Analysis (IPTA) and applications. J. Hydrol. 575, 202-210. https://doi.org/10.1016/j.jhydrol.2019.05.028
#'
#' @examples
# df = read.table(text = "Months	First_half	Second_half
# Jan	4662	4973
# Feb	4809	5363
# Mar	6382	6695
# Apr	7772	7944
# May	7928	7441
# Jun	6928	6431
# Jul	5766	5407
# Aug	4682	4355
# Sep	4161	3852
# Oct	4161	3945
# Nov	4792	4850
# Dec	5032	5282", header = TRUE)
#'
#' ipta(x = df$First_half, y = df$Second_half, Monthly = df$Months)
#'
#' @export
#'
ipta <- function(x = x, y = y, Monthly = Monthly){
  df <- cbind.data.frame(x, y, Monthly)
  d <- rbind.data.frame(df, df[1, ])

  #Distance and Slope calculation
  distance = sqrt(diff(d$x)^2 + diff(d$y)^2)
  slope = diff(d$y) / diff(d$x)

  #Plotting
  plot(d$x, d$y, pch = 19, type = "b", main = "Innovative Polygon Trend Analysis",
       xlab = "First half", ylab = "Second half", xlim = c(min(d$x),max(d$x)),
       ylim = c(min(d$y),max(d$y)))
  text(x = d$x, y = d$y,  labels = df$Monthly,
       cex=0.8, pos=3,col="black")
  abline(a = 0, b = 1, col = "black", lwd = 2)

  return(list("Distance" = distance, "Slope" = slope))
}





