# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                             "ne_110m_admin_0_countries", encoding = "UTF-8") %>% pretvori.zemljevid()
#ZEMLJEVIDI
map1 <- ggplot()+
  geom_polygon(data = zemljevid %>% left_join(skupaj, by = c("SOVEREIGNT" = "Country")),
               aes(x = long, y = lat, group = group, fill = latitude))

#GRAFI
graf.Drz <- ggplot(data = skupaj, aes(x=region,fill = region))+
  geom_bar(stat="count")+
  labs(y="št. držav",x="Regija",title="")+
  guides(fill=FALSE) 

graf.hdi1 <- ggplot(data = skupaj, aes(x = Life_expectancy_years , y = HDI_value_2014))+
  geom_point(stat = 'identity')+
  labs(x="Pričakovana starost",y="HDI value",title="HDI vrednost in pričakovana starost")+
  geom_smooth(method = 'loess')+
  scale_y_continuous(limits = c(0.3, 1))+
  scale_x_continuous(limits = c(45,85))

graf.hdi2 <- ggplot(data = skupaj, aes(x = Life_expectancy_years, y = HDIrank))+
  geom_point(stat = 'identity')+
  labs(x ="Pričakovana starost",y ="HDI rank", title="HDI rank in pričakovana starost")+
  geom_smooth(method = 'loess')+
  scale_y_continuous(limits = c(1,200))+
  scale_x_continuous(limits = c(45,85))


graf.mrate <- ggplot(data = skupaj, aes(x = latitude, y = rate))+
  geom_point(stat = 'identity')+
  labs(y="št. umorov na 100000 preb.",x="Geografska širina",title="Geografska širina in število umorov na 100000 preb.")+
  geom_smooth(method = 'loess')+
  scale_x_continuous(breaks = seq(-50,70,10),limits = c(-50,70))+
  scale_y_continuous(limits = c(0,70)) 

evropa <- filter(skupaj,region == "Europe")
afrika <- filter(skupaj,region == "Africa")
azija <- filter(skupaj,region == "Asia")
amerika <- filter(skupaj,region == "Americas")
oceanija <- filter(skupaj,region == "Oceania")

graf.mrate.region <- ggplot(data = skupaj, aes(x = latitude, y = rate, color = region))+
  geom_point(stat = 'identity')+
  labs(y="št. umorov na 100000 preb.",x="Geografska širina",title="Geografska širina in število umorov na 100000 preb.")+
  scale_x_continuous(breaks = seq(-50,70,10))+
  scale_y_continuous(limits = c(0,70)) 

graf.mrate.evropa <- ggplot(data = evropa, aes(x = latitude, y = rate, color = region),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text(aes(label=kratica),hjust=-0.2, vjust=0)+
  labs(y="št. umorov na 100000 preb.",x="Geografska širina",title="Geografska širina/število umorov Evropa")+
  scale_x_continuous(breaks = seq(30,70,10))+
  scale_y_continuous(breaks=seq(0,12,1), limits = c(0,12)) 

graf.hdirank <- ggplot(data = skupaj, aes(x = latitude, y = HDIrank))+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="HDI rank", title="geografska širina in HDIrank")+
  geom_smooth(method = 'loess')+
  scale_x_continuous(breaks = seq(-50,70,10),limits=c(-50,70))


graf.starost <- ggplot(data = skupaj, aes(x = latitude, y = Life_expectancy_years))+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="pričakovana starost", title="geografska širina in pričakovana starost")+
  scale_x_continuous(breaks = seq(-50,70,10),limits=c(-50,70))+
  geom_smooth(method = 'loess')


graf.psola <- ggplot(data = skupaj, aes(x = latitude, y = Expected_years_of_schooling))+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="dolžina šolanja", title="geografska širina in pričakovana dolžina šolanja")+
  scale_x_continuous(breaks = seq(-50,70,10),limits=c(-50,70))+
  geom_smooth(method = 'loess')

graf.dsola <- ggplot(data = skupaj, aes(x = latitude, y = Mean_years_of_schooling))+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="dolžina šolanja", title="geografska širina in dejanska dolžina šolanja")+
  scale_x_continuous(breaks = seq(-50,70,10),limits=c(-50,70))+
  geom_smooth(method = 'loess')

graf.dsola.evropa <- ggplot(data = evropa, aes(x = latitude, y = Mean_years_of_schooling, color = region),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text(aes(label=kratica),hjust=-0.2, vjust=0)+
  labs(y="dolžina šolanja",x="Geografska širina",title="Geografska širina/dejanska dolžina šolanja v Evropi")+
  scale_x_continuous(breaks = seq(30,70,10))+
  scale_y_continuous(limits = c(7,15)) 


graf.gni <- ggplot(data = skupaj, aes(x = latitude, y = GNI_per_capita))+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="GNI na prebivalca", title="geografska širina in GNI na prebivalca")+
  scale_x_continuous(breaks = seq(-50,70,10), limits = c(-50,70))+
  scale_y_continuous(breaks = seq(0,88000,10000),limits = c(0,90000))+
  geom_smooth(method = 'loess')





