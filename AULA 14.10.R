#aula 14/10
install.packages("networkD3")
install.packages("dplyr")

library(networkD3)
library(dplyr)

# Criar os nós
nos <- tibble(nomes = c("EUA e Canadá",   # 0
                        "Europa, OM, e África",  # 1
                        "LATAM",  # 2
                        "Ásia e Pacífico",  # 3
                        "Receita",  # 4
                        "Lucro Bruto",  # 5
                        "CMV",  # 6
                        "Lucro Operacional",  # 7
                        "Custo Operacional",  # 8
                        "Lucro Líquido",  # 9
                        "IR",  # 10
                        "Juros",  # 11
                        "Marketing",  # 12
                        "Tech e Dev",  # 13
                        "Adm e Geral"))  # 14

# Criar os links entre os nós
links <- tibble(source = c(0, 1, 2, 3,  # Regiões
                           4, 4,        # Receita
                           5, 5,        # Lucro Bruto
                           7, 7, 7,     # Lucro Operacional
                           8, 8, 8),    # Custo Operacional
                
                target = c(4, 4, 4, 4,   # Convergência Receita
                           5, 6,         # Convergência Lucro Bruto e CMV
                           7, 8,         # Lucro Operacional e Custo Operacional
                           9, 10, 11,    # Lucro Líquido, IR e Juros
                           12, 13, 14),  # Marketing, Tech e Adm
                
                valores = c(4.3, 3.0, 1.2, 1.1,  # Valores Receita
                            4.4, 5.2,           # Valores Lucro Bruto e CMV
                            2.6, 1.8,           # Lucro Operacional e Custo
                            2.1, 0.4, 0.089,    # Lucro Líquido, IR e Juros
                            0.6, 0.7, 0.4))     # Marketing, Tech e Adm

# Criar o gráfico de Sankey
sankey <- sankeyNetwork(Links = links, Nodes = nos, 
                        Source = "source", Target = "target", 
                        Value = "valores", NodeID = "nomes", 
                        units = "Bi", fontSize = 12, nodeWidth = 30)

# Exibir o gráfico
sankey
hyukfyui ,