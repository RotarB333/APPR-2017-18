# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                             "ne_110m_admin_0_countries", encoding = "UTF-8") %>% pretvori.zemljevid()


#GRAFI

graf1 <- ggplot(data = skupaj, aes(x = latitude, y = rate)) + geom_point(stat = 'identity')
graf1 <- graf1 + scale_x_continuous(breaks = seq(-80,80,10))
graf1 <- graf1 + scale_y_continuous(limits = c(-1,10)) 


graf2 <- ggplot(data = skupaj, aes(x = latitude, y = HDIrank)) + geom_point(stat = 'identity')
graf2

graf3 <- ggplot(data = skupaj, aes(x = latitude, y = Life_expectancy_years, color = region)) + geom_point(stat = 'identity')
graf3

ggplot() + geom_polygon(data = zemljevid %>% left_join(skupaj, by = c("SOVEREIGNT" = "Country")),
                        aes(x = long, y = lat, group = group, fill = Life_expectancy_years))
