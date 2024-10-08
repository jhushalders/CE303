#AULA 07/10

#MAPA DE CALOR
#a normal, M sem escala
data (mtcars)
scale(mtcars$mpg)
mtcars2 = apply (mtcars, 2, scale)
M = as.matrix(mtcars2)
heatmap(M, Rowv = NA, Colv = NA)
head(mtcars)
a = as.matrix(mtcars)
heatmap(a, col = heat.colors(256), Rowv = NA, Colv = NA)

#TABLEPLOT
install.packages("devtools")
require (devtools)
install_github("edwindj/ffbase", subdir = "pkg")
install_github("mtennekes/tabplot")
require(tabplot)
tableplot(iris, sortCol = 1)
tableplot(iris, sortCol = 2)
tableplot(iris, sortCol = 3)
tableplot(iris, sortCol = 4)

#FACES OF CHERNOFF
install.packages("aplpack")
require(aplpack)
data(longley)
faces(longley[,-6],face.type=0)
faces(longley[,-6],face.type=1)
faces(longley[,-6],face.type=2)



