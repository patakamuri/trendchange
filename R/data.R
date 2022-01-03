#' @title Annual flow of the Nile River
#'
#' @description Nile River data available with R base is used for testing purpose
#'
#' @format Nile river flow measured at Aswan station during 100 year period from 1871 to 1970 is used for testing
#'
#' @references R Core Team (2021). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria.
#' @references Durbin, J. and Koopman, S. J. (2001). Time Series Analysis by State Space Methods. Oxford University Press.
#' @references Balke, N. S. (1993). Detecting level shifts in time series. Journal of Business and Economic Statistics, 11, 81–92. doi: 10.2307/1391308.
#' @references Cobb, G. W. (1978). The problem of the Nile: conditional solution to a change-point problem. Biometrika 65, 243–51. doi: 10.2307/2335202.

x <- c(Nile)

df = read.table(text = "Months	First_half	Second_half
Jan	4662	4973
Feb	4809	5363
Mar	6382	6695
Apr	7772	7944
May	7928	7441
Jun	6928	6431
Jul	5766	5407
Aug	4682	4355
Sep	4161	3852
Oct	4161	3945
Nov	4792	4850
Dec	5032	5282", header = TRUE)
