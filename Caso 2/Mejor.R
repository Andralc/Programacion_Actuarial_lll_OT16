setwd("C:\Users\Andres\Documents\GitHub\Programación Actuarial III\Programacion_Actuarial_lll_OT16\Programacion_Actuarial_lll_OT16")

mejor<-function(estado, resultado) {
  data <- read.csv("outcome-of-care-measures.csv")
  estados <- levels(data[, 7])[data[, 7]] 
  CodigoEstado <- FALSE
  
  for (i in 1:length(estados)) {
    if (estado == estados[i]) {
      CodigoEstado <- TRUE
    }
  }
  
  if (!CodigoEstado) {
    stop ("estado invalido")
  }
  
  if (!((resultado == "infarto") | (resultado == "falla")
        | (resultado == "neumonia"))) {
    stop ("resultado invalido")
  }
  
  col <- if (resultado == "infarto") {
    11 
  } else if (resultado == "falla") {
    17 
  } else {
    23 
  }
  
  data[, col] <- suppressWarnings(as.numeric(levels(data[, col])[data[, col]]))
  data[, 2] <- as.character(data[, 2]) 
  
  DataEstado <- data[grep(estado, data$State), ]
  
  Ordenar_Data <- DataEstado[order(DataEstado[, col], DataEstado[, 2], na.last = NA), ]
  Ordenar_Data[1, 2]
}

mejor("TX", "infarto") 
mejor("TX", "falla") 
mejor("MD", "infarto")
mejor("MD", "neumonia")
mejor("BB", "infarto")
mejor("NY", "infartotl")