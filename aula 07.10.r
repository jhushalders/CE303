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

#NUVEM DE PALAVRAS
url1 <- "https://raw.githubusercontent.com/andersonara/"
url2 <- "datasets/master/dilma.txt"
arquivo <- readLines(paste0(url1,url2))
arquivo2 <- iconv(arquivo, from="", to="utf-8")
require(wordcloud)
require(tm)
doc <- Corpus(VectorSource(arquivo2))
doc <- tm_map(doc,removePunctuation)
doc <- tm_map(doc,tolower)
doc <- tm_map(doc,removeWords,c(stopwords("portuguese"),"nco","ser"))
wordcloud(doc, col=c("grey","orange","red"))

#SUNBURST
#o mais massa
sequencia<- read.table(text = '
A-aa-aaa-end
A-aa-aaa-end
A-aa-vvv-end
A-aa-vvv-end
A-cc-vvv-end
A-cc-vvv-end
B-aa-vvv-end
B-aa-vvv-end
B-bb-rr-end
B-bb-rr-end
C-aa-rr-end
C-aa-rr-end
C-bb-rr-end
C-bb-rr-end
C-cc-rr-end
')
sequencia$V2 <- seq_along(sequencia$V1)
require(sunburstR)
sunburst(sequencia)

#SANKEY













