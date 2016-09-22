setwd("C:\Users\Andres\Documents\GitHub\Programación Actuarial III\Programacion_Actuarial_lll_OT16")
corr <- function(directorio=getwd(), horizonte = 0) 
{
  setwd(directorio)
  numerovalores<-0
  lis<-dir(getwd())
  
  resultados<-matrix(nrow=(length(lis)),ncol=1)
  contador<-1
  contador2<-1
  for (k in 1:length(lis ) )
  {
    m<-lis[k]
    monitor<-read.csv(m)
    completo<-complete.cases(monitor)
    monitordis<-monitor[completo,]
    numerovalores<-nrow(monitordis)
    if (numerovalores>=horizonte)
    {
      resultados[contador,1]<-k
      contador<-contador+1
    }
    
  }
  
  completot<-complete.cases(resultados)
  monitordist<-resultados[completot,]
  numerovalorest<-nrow(monitordist)
  
  for (m in monitordist[,1] )
  {
    monitor<-read.csv(lis[m])
    completo<-complete.cases(monitor)
    monitordis<-monitor[completo,]
    numerovalores<-nrow(monitordis)
    
    contador<-contador+1
  
  }

  print(monitordist)
  
} 