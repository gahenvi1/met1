# variáveis categóricas
library(ggplot2)


ggplot() + 
  geom_histogram(aes(banco$NOTA_LP))


qtd_classes <- round(1 + 3.3 * log(length(banco)))




dist_freq <- table(cut(banco$NOTA_LP, breaks = qtd_classes))
labels <- as.vector(names(dist_freq))

labels <- map_chr(labels, ~gsub("\\((\\d+),(\\d+)\\]", "\\1|---\\2", .x))
