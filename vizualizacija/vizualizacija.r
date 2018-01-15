# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                             "ne_110m_admin_0_countries", encoding = "UTF-8") %>% pretvori.zemljevid()


#GRAFI

graf1 <- ggplot(data = skupaj, aes(x = latitude, y = rate)) + geom_point(stat = 'identity') + labs(y="št. umorov na 100000 preb.", 
                 x="Geografska širina",title="Geografska širina in število umorov na 100000 preb.")
graf1 <- graf1 + geom_smooth(method = 'loess')
graf1 <- graf1 + scale_x_continuous(breaks = seq(-80,80,10))
graf1 <- graf1 + scale_y_continuous(limits = c(-1,10)) 
graf1

graf2 <- ggplot(data = skupaj, aes(x = latitude, y = HDIrank)) + geom_point(stat = 'identity')
graf2 <- graf2 + geom_smooth(method = 'loess')
graf2

graf3 <- ggplot(data = skupaj, aes(x = latitude, y = Life_expectancy_years)) + geom_point(stat = 'identity')
graf3 <- graf3 + geom_smooth(method = 'loess')
graf3

graf3b <- ggplot(data = skupaj, aes(x = latitude, y = Life_expectancy_years, color = region)) + geom_point(stat = 'identity')
graf3b

graf4 <- ggplot(data = skupaj, aes(x = HDIrank, y = Life_expectancy_years, color = region)) + geom_point(stat = 'identity')
graf4 <- graf4 + geom_smooth(method = 'loess')
graf4

graf5 <- ggplot(data = skupaj, aes(x = latitude, y = GNI_per_capita, color = region)) + geom_point(stat = 'identity')
graf5 <- graf5 + scale_x_continuous(breaks = seq(-80,80,10))
graf5 <- graf5 + scale_y_continuous(breaks = seq(0,88000,10000))
graf5

map1 <- ggplot() + geom_polygon(data = zemljevid %>% left_join(skupaj, by = c("SOVEREIGNT" = "Country")),
                        aes(x = long, y = lat, group = group, fill = latitude))
map1

map2 <- ggplot() + geom_polygon(data = zemljevid %>% left_join(skupaj, by = c("SOVEREIGNT" = "Country")),
                        aes(x = long, y = lat, group = group, fill = Life_expectancy_years))
map2

map3 <- ggplot() + geom_polygon(data = zemljevid %>% left_join(skupaj, by = c("SOVEREIGNT" = "Country")),
                        aes(x = long, y = lat, group = group, fill = GNI_per_capita))
map3 

map4 <- ggplot() + geom_polygon(data = zemljevid %>% left_join(skupaj, by = c("SOVEREIGNT" = "Country")),
                               aes(x = long, y = lat, group = group, fill = rate))
map4
