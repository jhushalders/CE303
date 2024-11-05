require(sf)
require (dplyr)
require(ggplot2)
install.packages()

mapa = st_read("dados_mapa/41MUE250GC_SIR.shp")
mapa

plot (st_geometry(mapa))

cidades = c("CURITIBA", "SÃO JOSÉ DOS PINHAIS", "PINHAIS", "BOCAIÚVA DO SUL", "QUATRO BARRAS", "ITAPERUÇU", "COLOMBO", "ALMIRANTE TAMANDARÉ")

mapa$NM_MUNICIP = iconv(mapa$NM_MUNICIP,
      from="latin1", to="utf-8")

cidades = data.frame(cidades)
names(cidades) = "NM_MUNICIP"
cidades2 = left_join(cidades, mapa, by="NM_MUNICIP")

mapa_red = st_as_sf(cidades2)
plot(st_geometry(mapa_red))

dados_pr = read.csv("dados_mapa/dados_pr.csv", dec=",",
                    sep=";", header=T)

names(dados_pr) [1]="CD_GEOCODM"
dados_pr$CD_GEOCODM=as.character((dados_pr$CD_GEOCODM))
mapa_redD = left_join(mapa_red, dados_pr, by="CD_GEOCODM")
mapa_redD

mapa1 = 
mapa_redD %>% ggplot(aes(fill = IDH.municipal))+
  geom_sf()+
  scale_fill_gradient(low="lightpink", high = "pink4") + 
  theme_bw()+
  theme(legend.position = "bottom")
mapa1
  
require(plotly)
ggplotly(mapa1)


#LEAFLET
require(leaflet)
qPaleta = colorQuantile("Purples", mapa_redD$IDH.municipal, 10)
mapa_redD %>%
  leaflet() %>%
  addTiles() %>%
  addPolygons(color = "black",
              label= paste(mapa_red$NM_MUNICIP,
                           "IDHm:", mapa_redD$IDH.municipal),
              fillOpacity = 0.6,
              fillColor = qPaleta(mapa_redD$IDH.municipal))%>%
  addLegend(pal = qPaleta,
            values = mapa_redD$IDH.municipal,
            position = "bottomright")










