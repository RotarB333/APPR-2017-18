# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                             "ne_110m_admin_0_countries", encoding = "UTF-8") %>% pretvori.zemljevid()


#GRAFI

graf1a <- ggplot(data = skupaj, aes(x = latitude, y = rate)) + geom_point(stat = 'identity') + labs(y="št. umorov na 100000 preb.", 
                 x="Geografska širina",title="Geografska širina in število umorov na 100000 preb.")
graf1a <- graf1a + geom_smooth(method = 'loess')
graf1a <- graf1a + scale_x_continuous(breaks = seq(-50,70,10))
graf1a <- graf1a + scale_y_continuous(limits = c(0,10)) 


graf1b <- ggplot(data = skupaj, aes(x = latitude, y = rate, color = region)) + geom_point(stat = 'identity') + labs(y="št. umorov na 100000 preb.", 
                x="Geografska širina",title="Geografska širina in število umorov na 100000 preb.")
graf1b <- graf1b + scale_x_continuous(breaks = seq(-50,70,10))
graf1b <- graf1b + scale_y_continuous(limits = c(0,10)) 


graf2a <- ggplot(data = skupaj, aes(x = Life_expectancy_years , y = HDI_value_2014)) + geom_point(stat = 'identity') + labs(x="Pričakovana starost",
                y="HDI value",title="HDI vrednost in pričakovana starost")
graf2a <- graf2a + geom_smooth(method = 'loess')


graf2b <- ggplot(data = skupaj, aes(x = Life_expectancy_years, y = HDIrank)) + geom_point(stat = 'identity') + labs(x ="Pričakovana starost",
                y ="HDI rank", title="HDI rank in pričakovana starost")
graf2b <- graf2b + geom_smooth(method = 'loess')


graf2c <- ggplot(data = skupaj, aes(x = HDIrank, y = HDI_value_2014)) + geom_point(stat = 'identity') + labs(y ="HDI vrednost",
                x ="HDI rank", title="HDI rank in pričakovana starost")
graf2c <- graf2c + geom_smooth(method = 'loess')




graf3a <- ggplot(data = skupaj, aes(x = latitude, y = HDIrank)) + geom_point(stat = 'identity')
graf3a <- graf3a + labs(x ="Geografska širina", y ="HDI rank", title="geografska širina in HDIrank")
graf3a <- graf3a + geom_smooth(method = 'loess')
graf3a <- graf3a + scale_x_continuous(breaks = seq(-50,70,10))


graf3b <- ggplot(data = skupaj, aes(x = latitude, y = Life_expectancy_years)) + geom_point(stat = 'identity')
graf3b <- graf3b + labs(x ="Geografska širina", y ="pričakovana starost", title="geografska širina in pričakovana starost")
graf3b <- graf3b + scale_x_continuous(breaks = seq(-50,70,10))
graf3b <- graf3b + geom_smooth(method = 'loess')


graf3c <- ggplot(data = skupaj, aes(x = latitude, y = Expected_years_of_schooling)) + geom_point(stat = 'identity')
graf3c <- graf3c + labs(x ="Geografska širina", y ="pričakovana dolžina šolanja", title="geografska širina in pričakovana dolžina šolanja")
graf3c <- graf3c + scale_x_continuous(breaks = seq(-50,70,10))
graf3c <- graf3c + geom_smooth(method = 'loess')


graf3d <- ggplot(data = skupaj, aes(x = latitude, y = Expected_years_of_schooling, color = region)) + geom_point(stat = 'identity')
graf3d <- graf3d + labs(x ="Geografska širina", y ="pričakovana dolžina šolanja", title="geografska širina in pričakovana dolžina šolanja")
graf3d <- graf3d + scale_x_continuous(breaks = seq(-50,70,10))


graf3e <- ggplot(data = skupaj, aes(x = latitude, y = GNI_per_capita)) + geom_point(stat = 'identity')
graf3e <- graf3e + labs(x ="Geografska širina", y ="GNI na prebivalca", title="geografska širina in GNI na prebivalca")
graf3e <- graf3e + scale_x_continuous(breaks = seq(-50,70,10))
graf3e <- graf3e + scale_y_continuous(breaks = seq(0,88000,10000))
graf3e <- graf3e + geom_smooth(method = 'loess')




map1 <- ggplot() + geom_polygon(data = zemljevid %>% left_join(skupaj, by = c("SOVEREIGNT" = "Country")),
                        aes(x = long, y = lat, group = group, fill = latitude))


map2 <- ggplot() + geom_polygon(data = zemljevid %>% left_join(skupaj, by = c("SOVEREIGNT" = "Country")),
                        aes(x = long, y = lat, group = group, fill = Life_expectancy_years))



