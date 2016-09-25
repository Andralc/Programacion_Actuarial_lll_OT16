setwd("C:\Users\Andres\Documents\GitHub\Programación Actuarial III\Programacion_Actuarial_lll_OT16\Programacion_Actuarial_lll_OT16")

mediacontaminante  <- function(directorio, contaminante, id = 1:332) {
  data = lapply(id, function(i) read.csv(paste(directorio, "/", formatC(i,width = 3, flag = "0"), ".csv", sep = ""))[[contaminante]])
  
  return(mean(unlist(data), na.rm = TRUE))
}
