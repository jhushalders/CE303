#AULA 21/10
#GGPLOT2
#DADOS + ESTETICA(aes) + GEOMETRIA
require(dplyr)
require(ggplot2)
data(mtcars)
head(mtcars)

#gráfico dispersão
mtcars %>%ggplot(aes(x=hp, y=mpg)) +
  geom_point()
