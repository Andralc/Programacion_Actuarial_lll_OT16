#Clase del 25/08/2016

#Crear vectores con la función vector
x <- vector(mode="numeric", lenght = 5L)
x

#Crear vectores con la función c
x <- c(0.5,0.6)
x
class(x)

x <- c(TRUE, FALSE, T, F)
x
class(x)

x <- 5:10
x
class(x)

x <- c("a","b","c","d")
x
class(x)





# Mezcla de objetos en un vector
y <- c(1.7,"a") #caracter
y
class(y)

y <- c(TRUE,2) #numérico
y
class(y)

y <- c("a", TRUE) #caracter
y
class(y)

y <- c(TRUE, 10L, 8.5, 1+1i, "Andrés")
y
class(y)

# Orden de coacción/coerción explícita
# 1 character
# 2 complex
# 3 numeric
# 4 integer
# 5 logical

# Coerción explícita
z <- 0:6
class(z)
as.numeric(z)
as.logical(z)
as.character(z)

z <- c(1+2i,3+4i,8,0+3i,0)
as.logical(z)

z <- c("Programación", "Actuarial", "III")
as.numeric(z)
as.logical(z)
as.complex(z)

#LISTAS (es como un vector... pero de vectores y c/u tiene su propia clase)
x <- list(1,"a",TRUE,1+4i)
x
class(x)


#MATRÍCES
m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)
#CAmbio de dimensiones de 2x3 a 3x2
dim(m) <- c(3,2)
m
#Crear una matriz con datos
m <- matrix(1:6,3,2)
m

m <- matrix(1:6,3,2,T)
m

m <- matrix(1:6,3,3,T)
m
class(m)
str(m)

dim(m) <- c(2,5) #Esto vaba producir error

x <- c(1,2,3)
y <- c("a","b","c")
z <- c(x,y)
z

m1 <- rbind(m,x)
m1

m2 <- cbind(m,x)
m2

m1 <- rbind(m,y)
m1

m2 <- cbind(m,y)
m2