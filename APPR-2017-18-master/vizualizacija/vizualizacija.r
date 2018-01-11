# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip",
                             "OB/OB", encoding = "Windows-1250")
levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels = levels(obcine$obcina))
zemljevid <- pretvori.zemljevid(zemljevid)

# Izračunamo povprečno velikost družine
povprecja <- druzine %>% group_by(obcina) %>%
  summarise(povprecje = sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))

#GRAFI

graf1 <- ggplot(data = skupaj, aes(x = latitude, y = rate,color = region)) + geom_point(stat = 'identity')
graf1 <- graf1 + scale_x_continuous(breaks = seq(-80,80,10))
graf1 <- graf1 + scale_y_continuous(limits = c(-1,10)) 


graf2 <- ggplot(data = skupaj, aes(x = latitude, y = HDIrank)) + geom_point(stat = 'identity')
graf2

graf3 <- ggplot(data = skupaj, aes(x = latitude, y = Life_expectancy_years, color = region)) + geom_point(stat = 'identity')
graf3

graf4 <- ggplot(data = skupaj, aes(x = HDIrank, y = Life_expectancy_years, color = region)) + geom_point(stat = 'identity')
graf4

graf5 <- ggplot(data = skupaj, aes(x = latitude, y = GNI_per_capita, color = region)) + geom_point(stat = 'identity')
graf5 <- graf5 + scale_x_continuous(breaks = seq(-80,80,10))
graf5
