setwd("C:\Users\Andres\Documents\GitHub\Programación Actuarial III\Programacion_Actuarial_lll_OT16\Programacion_Actuarial_lll_OT16")

rankingcompleto <- function(resultado="infarto",num="mejor"){
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
  options(warn = -1)
  if(resultado == "infarto"){
    da <- split(outcome[c(2,7,11)],outcome[c(2,7,11)]$State)
  }else if(resultado=="falla"){  
    da <- split(outcome[c(2,7,17)],outcome[c(2,7,17)]$State)
  }else if(resultado=="neumonia"){
    da <- split(outcome[c(2,7,23)],outcome[c(2,7,23)]$State)
  }
  Hosp <- c()
  for(j in 1:54){
    H <- da[j][[1]][,1]
    Rate <- as.numeric(da[j][[1]][,3])
    x <- na.omit(data.frame(H,Rate))
    index <- with(x,order(Rate,H))
    x <- x[index,][1]
    y <- nrow(x)
    if(num=="mejor"){
      Hosp <- c(Hosp,as.character(x[1,1]))
    }else if(num=="peor"){
      Hosp <- c(Hosp,as.character(x[y,1]))
    }else if(0<num & num<=y ){
      Hosp <- c(Hosp,as.character(x[num,1]))
    }else if (y<num){
      Hosp <- c(Hosp,as.character(x[y+1,1]))
    } 
  }
  Estado <- sort(unique(outcome$State))
  data.frame(Hosp,Estado)
}

head(rankingcompleto("infarto",20),10)
tail(rankingcompleto("neumonia","peor"),3)
tail(rankingcompleto("falla","mejor"),10)