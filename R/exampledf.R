#' @title Example Data Frame for Innovative Polygon Trend Analysis
#'
#' @description User is advised to prepare the data as suggested in the example to work with monthly data analysis using Innovative Polygon Trend Analysis Method.
#'
#' @format Data frame With Months in the first column, calculations from the first half values in the second column and calculations from the second half values in the third column.
#'
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
