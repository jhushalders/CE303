#Gráfico de cordas / chord diagram
require(circlize)
require(vcd)
v1 = c(rep("F", 4), rep ("M", 5), "F", "M") 
v2 = c('I', 'I', 'B','I', 'B', 'R', 'B', 'R', 'B', 'I', 'R')

length(v1)
length(v2)

m = data.frame(table(v1,v2))
m
chordDiagram(m, col=rainbow (6))

#GRÁFICO HEXBIN

library("hexbin")
data("iris")
hh <- hexbin(iris$Sepal.Length, iris$Sepal.Width)
hh
plot(hh)

#Gráfico de boljas
x = c(10, 20, 15, 20, 40)
y = c(1, 4, 5, 1, 5)
z = c(41, 22, 20, 11, 50)
R = c("escrita", "A", "A", "B", "B")
C <- c("orange", 2, 2, 3, 3)

symbols(x=x, y=y,
        circles = z,
        inches = 0.5,
        bg=C)
text(x, y, R, cex = 2)

legend (30, 2, c("cat1", "cat2"), pch = 19, cex = 1.5, col = c(2,3), box.col = NA)


#Gráfico de barras

ano <- c(rep(2022,12),rep(2023,12))
mes <- rep(1:12,2)
ven <- rpois (24,10)

cores = c("#5e35b1", "#fdd835")
barra = rbind(ven[1:12], ven [13:24])
barra

barplot (barra, beside = T, names.arg = mes)






