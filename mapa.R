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
