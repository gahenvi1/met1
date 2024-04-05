#mapa
names(brasil)[which(names(brasil) == "abbrev_state")] <- "UF"
dados_mapa <- banco %>% 
  group_by(UF) %>% 
  count() 

dados_mapa <- brasil %>%
  left_join(dados_mapa)


options(scipen = 999)

mapa<- ggplot() + 
  geom_sf(data=dados_mapa,  aes(fill=n),color = NA)+
  scale_fill_viridis(breaks = seq(0, 500, by = 50), option = "D", direction = -1, name = "Número de estudantes") +
  theme_minimal()


densidades <- dnorm(banco$NOTA_LP, mean = mean(banco$NOTA_LP), sd = sd(banco$NOTA_LP))

ggplot(banco, aes(NOTA_LP)) +
  geom_bar(aes(y = after_stat(density), fill = densidades), color = "black", bins = 10, stat = "density") +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(x = "Valores", y = "Frequência") +
  theme_minimal()
