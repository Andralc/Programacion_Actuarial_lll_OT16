setwd("C:\Users\Andres\Documents\GitHub\Programación Actuarial III\Programacion_Actuarial_lll_OT16\Programacion_Actuarial_lll_OT16")

corr <- function(directorio, horizonte=0) {
  
  df = completos(directorio)
  ids = df[df["nobs"] > horizonte, ]$id
  corrr = numeric()
  for (i in ids) {
    
    newRead = read.csv(paste(directorio, "/", formatC(i, width = 3, flag = "0"), 
                             ".csv", sep = ""))
    dff = newRead[complete.cases(newRead), ]
    corrr = c(corrr, cor(dff$sulfate, dff$nitrate))
  }
  return(corrr)
}