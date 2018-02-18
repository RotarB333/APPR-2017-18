# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                             "ne_110m_admin_0_countries", encoding = "UTF-8") %>% pretvori.zemljevid()
#ZEMLJEVIDI
map1 <- ggplot()+
  geom_polygon(data = zemljevid %>% left_join(skupaj, by = c("SOVEREIGNT" = "Country")),
               aes(x = long, y = lat, group = group, fill = latitude))+
  labs(title ="Povprečna geografska širina držav")

#GRAFI

celine <- c("Europe","Asia","Africa","Americas","Oceania")
ledrzave <- filter(skupaj,region %in% celine)

graf.Drz <- ggplot(data = ledrzave, aes(x=region,fill = region))+
  geom_bar(stat="count")+
  labs(y="št. držav",x="Regija",title="Število držav po regijah")+
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

evropa <- filter(skupaj,region == "Europe")
afrika <- filter(skupaj,region == "Africa")
azija <- filter(skupaj,region == "Asia")
amerika <- filter(skupaj,region == "Americas")
oceanija <- filter(skupaj,region == "Oceania")

#MRATE

graf.mrate <- ggplot(data = skupaj, aes(x = latitude, y = rate))+
  geom_point(stat = 'identity')+
  labs(y="št. umorov na 100000 preb.",x="Geografska širina",title="Geografska širina in število umorov na 100000 preb.")+
  geom_smooth(method = 'loess')+
  scale_x_continuous(breaks = seq(-50,70,10),limits = c(-50,70))+
  scale_y_continuous(limits = c(0,70)) 

graf.mrate.region <- ggplot(data = skupaj, aes(x = latitude, y = rate, color = region))+
  geom_point(stat = 'identity')+
  labs(y="št. umorov na 100000 preb.",x="Geografska širina",title="Geografska širina in število umorov na 100000 preb.")+
  scale_x_continuous(breaks = seq(-50,70,10))+
  scale_y_continuous(limits = c(0,70))

graf.mrate.afrika <- ggplot(data = afrika, aes(x = latitude, y = rate),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=afrika, aes(label=kratica))+
  labs(y="št. umorov na 100000 preb.",x="Geografska širina",title="Geografska širina/število umorov Afrika")

graf.mrate.amerika <- ggplot(data = amerika, aes(x = latitude, y = rate),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=amerika, aes(label=kratica))+
  labs(y="št. umorov na 100000 preb.",x="Geografska širina",title="Geografska širina/število umorov Ameriki")

graf.mrate.azija <- ggplot(data = azija, aes(x = latitude, y = rate),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=azija, aes(label=kratica))+
  labs(y="št. umorov na 100000 preb.",x="Geografska širina",title="Geografska širina/število umorov Azija")

graf.mrate.evropa <- ggplot(data = evropa, aes(x = latitude, y = rate),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  labs(y="št. umorov na 100000 preb.",x="Geografska širina",title="Geografska širina/število umorov Evropa")+
  scale_x_continuous(breaks = seq(30,70,10))+
  scale_y_continuous(breaks=seq(0,12,1), limits = c(0,12))+
  geom_text_repel(data=evropa, aes(label=kratica))

graf.mrate.oceanija <- ggplot(data = oceanija, aes(x = latitude, y = rate),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=oceanija, aes(label=kratica))+
  labs(y="št. umorov na 100000 preb.",x="Geografska širina",title="Geografska širina/število umorov Oceanija")

#HDI RANK

graf.hdirank <- ggplot(data = skupaj, aes(x = latitude, y = HDIrank))+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="HDI rank", title="Geografska širina in HDIrank")+
  geom_smooth(method = 'loess')+
  scale_x_continuous(breaks = seq(-50,70,10),limits=c(-50,70))

graf.hdirank.afrika <- ggplot(data = afrika, aes(x = latitude, y = HDIrank),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=afrika, aes(label=kratica))+
  labs(y="HDI rank",x="Geografska širina",title="Geografska širina/HDIrank Afrika")

graf.hdirank.amerika <- ggplot(data = amerika, aes(x = latitude, y = HDIrank),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=amerika, aes(label=kratica))+
  labs(y="HDI rank",x="Geografska širina",title="Geografska širina/HDIrank Ameriki")

graf.hdirank.azija <- ggplot(data = azija, aes(x = latitude, y = HDIrank),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=azija, aes(label=kratica))+
  labs(y="HDI rank",x="Geografska širina",title="Geografska širina/HDIrank Azija")  

graf.hdirank.evropa <- ggplot(data = evropa, aes(x = latitude, y = HDIrank),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=evropa, aes(label=kratica))+ 
  labs(y="HDI rank",x="Geografska širina",title="Geografska širina/HDIrank Evropa")

graf.hdirank.oceanija <- ggplot(data = oceanija, aes(x = latitude, y = HDIrank),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=oceanija, aes(label=kratica))+
  labs(y="HDI rank",x="Geografska širina",title="Geografska širina/HDIrank Oceanija")+
  scale_y_continuous(limits = c(0,200))

#STAROST

graf.starost <- ggplot(data = skupaj, aes(x = latitude, y = Life_expectancy_years))+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="pričakovana starost", title="Geografska širina in pričakovana starost")+
  scale_x_continuous(breaks = seq(-50,70,10),limits=c(-50,70))+
  geom_smooth(method = 'loess')

graf.starost.afrika <- ggplot(data = afrika, aes(x = latitude, y = Life_expectancy_years),label=kratica)+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="pričakovana starost", title="Geografska širina/pričakovana starost Afrika")+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=afrika, aes(label=kratica))

graf.starost.amerika <- ggplot(data = amerika, aes(x = latitude, y = Life_expectancy_years),label=kratica)+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="pričakovana starost", title="Geografska širina/pričakovana starost Ameriki")+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=amerika, aes(label=kratica))

graf.starost.azija <- ggplot(data = azija, aes(x = latitude, y = Life_expectancy_years),label=kratica)+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="pričakovana starost", title="Geografska širina/pričakovana starost Azija")+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=azija, aes(label=kratica))

graf.starost.evropa <- ggplot(data = evropa, aes(x = latitude, y = Life_expectancy_years),label=kratica)+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="pričakovana starost", title="Geografska širina/pričakovana starost Evropa")+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=evropa, aes(label=kratica))

graf.starost.oceanija <- ggplot(data = oceanija, aes(x = latitude, y = Life_expectancy_years),label=kratica)+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="pričakovana starost", title="Geografska širina/pričakovana starost Oceanija")+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=oceanija, aes(label=kratica))

#PŠola

graf.psola <- ggplot(data = skupaj, aes(x = latitude, y = Expected_years_of_schooling))+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="dolžina šolanja", title="Geografska širina in pričakovana dolžina šolanja")+
  scale_x_continuous(breaks = seq(-50,70,10),limits=c(-50,70))+
  geom_smooth(method = 'loess')

graf.psola.afrika <- ggplot(data = afrika, aes(x = latitude, y = Expected_years_of_schooling),label=kratica)+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="dolžina šolanja", title="Geografska širina in pričakovana dolžina šolanja Afrika")+
  geom_text_repel(data=afrika, aes(label=kratica))+
  geom_smooth(method = 'loess')

graf.psola.amerika <- ggplot(data = amerika, aes(x = latitude, y = Expected_years_of_schooling),label=kratica)+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="dolžina šolanja", title="Geografska širina in pričakovana dolžina šolanja Ameriki")+
  geom_text_repel(data=amerika, aes(label=kratica))+
  geom_smooth(method = 'loess')

graf.psola.azija <- ggplot(data = azija, aes(x = latitude, y = Expected_years_of_schooling),label=kratica)+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="dolžina šolanja", title="Geografska širina in pričakovana dolžina šolanja Azija")+
  geom_text_repel(data=azija, aes(label=kratica))+
  geom_smooth(method = 'loess')

graf.psola.evropa <- ggplot(data = evropa, aes(x = latitude, y = Expected_years_of_schooling),label=kratica)+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="dolžina šolanja", title="Geografska širina in pričakovana dolžina šolanja Evropa")+
  geom_text_repel(data=evropa, aes(label=kratica))+
  geom_smooth(method = 'loess')

graf.psola.oceanija <- ggplot(data = oceanija, aes(x = latitude, y = Expected_years_of_schooling),label=kratica)+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="dolžina šolanja", title="Geografska širina in pričakovana dolžina šolanja Oceanija")+
  geom_text_repel(data=oceanija, aes(label=kratica))+
  geom_smooth(method = 'loess')

#DŠola

graf.dsola <- ggplot(data = skupaj, aes(x = latitude, y = Mean_years_of_schooling))+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="dolžina šolanja", title="Geografska širina in dejanska dolžina šolanja")+
  scale_x_continuous(breaks = seq(-50,70,10),limits=c(-50,70))+
  geom_smooth(method = 'loess')

graf.dsola.afrika <- ggplot(data = afrika, aes(x = latitude, y = Mean_years_of_schooling),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=afrika, aes(label=kratica))+
  labs(y="dolžina šolanja",x="Geografska širina",title="Geografska širina in dejanska dolžina šolanja Afrika")

graf.dsola.amerika <- ggplot(data = amerika, aes(x = latitude, y = Mean_years_of_schooling),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=amerika, aes(label=kratica))+
  labs(y="dolžina šolanja",x="Geografska širina",title="Geografska širina in dejanska dolžina šolanja Ameriki")

graf.dsola.azija <- ggplot(data = azija, aes(x = latitude, y = Mean_years_of_schooling),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=azija, aes(label=kratica))+
  labs(y="dolžina šolanja",x="Geografska širina",title="Geografska širina in dejanska dolžina šolanja Azija")

graf.dsola.evropa <- ggplot(data = evropa, aes(x = latitude, y = Mean_years_of_schooling),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=evropa, aes(label=kratica))+
  labs(y="dolžina šolanja",x="Geografska širina",title="Geografska širina in dejanska dolžina šolanja Evropa")+
  scale_x_continuous(breaks = seq(30,70,10))+
  scale_y_continuous(limits = c(7,15)) 

graf.dsola.oceanija <- ggplot(data = oceanija, aes(x = latitude, y = Mean_years_of_schooling),label=kratica)+
  geom_point(stat = 'identity')+
  geom_smooth(method = 'loess')+
  geom_text_repel(data=oceanija, aes(label=kratica))+
  labs(y="dolžina šolanja",x="Geografska širina",title="Geografska širina in dejanska dolžina šolanja Oceanija")

#GNI

graf.gni <- ggplot(data = skupaj, aes(x = latitude, y = GNI_per_capita))+
  geom_point(stat = 'identity')+
  labs(x ="Geografska širina", y ="GNI na prebivalca", title="Geografska širina in GNI na prebivalca")+
  scale_x_continuous(breaks = seq(-50,70,10), limits = c(-50,70))+
  scale_y_continuous(breaks = seq(0,88000,10000),limits = c(0,90000))+
  geom_smooth(method = 'loess')

graf.gni.afrika <- ggplot(data = afrika, aes(x = latitude, y = GNI_per_capita),label = kratica)+
  geom_point(stat = 'identity')+
  geom_text_repel(data=afrika, aes(label=kratica))+
  geom_smooth(method = 'loess')+
  labs(x ="Geografska širina", y ="GNI na prebivalca", title="Geografska širina in GNI na prebivalca Afrika")

graf.gni.amerika <- ggplot(data = amerika, aes(x = latitude, y = GNI_per_capita),label = kratica)+
  geom_point(stat = 'identity')+
  geom_text_repel(data=amerika, aes(label=kratica))+
  geom_smooth(method = 'loess')+
  labs(x ="Geografska širina", y ="GNI na prebivalca", title="Geografska širina in GNI na prebivalca Ameriki")

graf.gni.azija <- ggplot(data = azija, aes(x = latitude, y = GNI_per_capita),label = kratica)+
  geom_point(stat = 'identity')+
  geom_text_repel(data=azija, aes(label=kratica))+
  geom_smooth(method = 'loess')+
  labs(x ="Geografska širina", y ="GNI na prebivalca", title="Geografska širina in GNI na prebivalca Azija")

graf.gni.evropa <- ggplot(data = evropa, aes(x = latitude, y = GNI_per_capita),label = kratica)+
  geom_point(stat = 'identity')+
  geom_text_repel(data=evropa, aes(label=kratica))+
  geom_smooth(method = 'loess')+
  labs(x ="Geografska širina", y ="GNI na prebivalca", title="Geografska širina in GNI na prebivalca Evropa")

graf.gni.oceanija <- ggplot(data = oceanija, aes(x = latitude, y = GNI_per_capita),label = kratica)+
  geom_point(stat = 'identity')+
  geom_text_repel(data=oceanija, aes(label=kratica))+
  geom_smooth(method = 'loess')+
  labs(x ="Geografska širina", y ="GNI na prebivalca", title="Geografska širina in GNI na prebivalca Oceanija")


