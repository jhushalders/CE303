#AULA 21/10
#GGPLOT2
#DADOS + ESTETICA(aes) + GEOMETRIA
require(dplyr)
require(ggplot2)
data(mtcars)
head(mtcars)

#gráfico dispersão
mtcars %>%ggplot(aes(x=hp, y=mpg)) +
  geom_point(size=3, col="#c51162", alpha = 0.7) + #alpha transparencia
  xlab("Potência")+
  ylab("log(Milhas por galão)")+
  ggtitle("Gráfico de dispersão") + 
  scale_y_log10()+
  scale_x_continuous(limits = c(50,400))+
  theme_bw()+
  theme(text=element_text(size=20, colour="#f48fb1"), 
                          plot.title = element_text(hjust=0.5))


#GRÁFICO DE BOLHAS
mtcars %>%ggplot(aes(x=hp, y=mpg, size=qsec)) +
  geom_point(col="#c51162", alpha = 0.7) + #alpha transparencia
  xlab("Potência")+
  ylab("log(Milhas por galão)")+
  ggtitle("Gráfico de dispersão") + 
  scale_y_log10()+
  scale_x_continuous(limits = c(50,400))+
  scale_size_continuous("Quarto de milha \n por tempo")+
  theme_bw()+
  theme(text=element_text(size=20, colour="#f48fb1"), 
        plot.title = element_text(hjust=0.5, colour = "#880e4f"),
        legend.position = "bottom")

#REALÇANDO VARIAVEIS QUALITATIVAS
mtcars %>% mutate (am2=ifelse(am==1, "Manual", "Automático")) %>% 
  ggplot(aes(x=hp, 
             y=mpg, 
            size=qsec)) +
  geom_point(alpha = 0.7) + #alpha transparencia
  xlab("Potência")+
  ylab("log(Milhas por galão)")+
  ggtitle("Gráfico de dispersão") + 
  scale_y_log10()+
  scale_x_continuous(limits = c(50,400))+
  scale_size_continuous("Quarto de milha \n por tempo")+
  facet_grid(facets = .~am)+ #separando os graficos
  theme_bw()+
  theme(text=element_text(size=20, colour="#f48fb1"), 
        plot.title = element_text(hjust=0.5, colour = "#880e4f"),
        legend.position = "right")

install.packages("ggExtra")
require(ggExtra)
 graf = mtcars %>%ggplot(aes(x=hp, y=mpg)) +
   geom_point(size=5, col="#c51162", alpha = 0.7) + #alpha transparencia
   geom_smooth(method = "lm", se = FALSE)+
   xlab("Potência")+
   ylab("Milhas por galão")+
   ggtitle("Gráfico de dispersão") + 
   scale_x_continuous(limits = c(50,400))+
   theme_bw()+
   theme(text=element_text(size=20, colour="#f48fb1"), 
         plot.title = element_text(hjust=0.5))
 graf
ggMarginal(graf) #distribuição de densidade
ggMarginal(graf, type = "histogram")
ggMarginal(graf, type = "boxplot", fill = "#f50057") 

#GRÁFICO DE INCLINAÇÃO
VA = c(100,120,90,80)
VB = c(80,100,110,90)
dados = data.frame(VA,VB)
dados$cores <- ifelse(VA-VB = 0, "red", "green")


  
