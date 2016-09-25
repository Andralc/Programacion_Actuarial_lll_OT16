setwd("C:\Users\Andres\Documents\GitHub\Programación Actuarial III\Programacion_Actuarial_lll_OT16\Programacion_Actuarial_lll_OT16")

completos <- function(directorio, id = 1:332) {
  f <- function(i) {
    data = read.csv(paste(directorio, "/", formatC(i, width = 3, flag = "0"), 
                          ".csv", sep = ""))
    sum(complete.cases(data))
  }
  nobs = sapply(id, f)
  return(data.frame(id, nobs))
}