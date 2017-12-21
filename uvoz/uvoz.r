# 2. faza: Uvoz podatkov

sl <- locale("sl", decimal_mark = ",", grouping_mark = ".")

# Funkcija, ki uvozi občine iz Wikipedije
uvozi.obcine <- function() {
  link <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
  stran <- html_session(link) %>% read_html()
  tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
    .[[1]] %>% html_table(dec = ",")
  for (i in 1:ncol(tabela)) {
    if (is.character(tabela[[i]])) {
      Encoding(tabela[[i]]) <- "UTF-8"
    }
  }
  colnames(tabela) <- c("obcina", "povrsina", "prebivalci", "gostota", "naselja",
                        "ustanovitev", "pokrajina", "regija", "odcepitev")
  tabela$obcina <- gsub("Slovenskih", "Slov.", tabela$obcina)
  tabela$obcina[tabela$obcina == "Kanal ob Soči"] <- "Kanal"
  tabela$obcina[tabela$obcina == "Loški potok"] <- "Loški Potok"
  for (col in c("povrsina", "prebivalci", "gostota", "naselja", "ustanovitev")) {
    tabela[[col]] <- parse_number(tabela[[col]], na = "-", locale = sl)
  }
  for (col in c("obcina", "pokrajina", "regija")) {
    tabela[[col]] <- factor(tabela[[col]])
  }
  return(tabela)
}

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozi.druzine <- function(obcine) {
  data <- read_csv2("podatki/druzine.csv", col_names = c("obcina", 1:4),
                    locale = locale(encoding = "Windows-1250"))
  data$obcina <- data$obcina %>% strapplyc("^([^/]*)") %>% unlist() %>%
    strapplyc("([^ ]+)") %>% sapply(paste, collapse = " ") %>% unlist()
  data$obcina[data$obcina == "Sveti Jurij"] <- "Sveti Jurij ob Ščavnici"
  data <- data %>% melt(id.vars = "obcina", variable.name = "velikost.druzine",
                        value.name = "stevilo.druzin")
  data$velikost.druzine <- parse_number(data$velikost.druzine)
  data$obcina <- factor(data$obcina, levels = obcine)
  return(data)
}

# Zapišimo podatke v razpredelnico obcine
obcine <- uvozi.obcine()

# Zapišimo podatke v razpredelnico druzine.
druzine <- uvozi.druzine(levels(obcine$obcina))

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.

sl <- locale("sl", decimal_mark = ".", grouping_mark = ",")

uvozi.legadrzav <- function() {
  data <- read_xlsx('podatki/Lega_drzav.xlsx')
  colnames(data) <- c("kratica",'GS','drzava')
  names(data) <- c('kratica','latitude','Country')
  return(data)
}

Lega_drzav <- uvozi.legadrzav()

uvozi.indikatorjirazvoja <- function() {
  data <- read_xls('podatki/Human Development Index and its components.xls', n_max=197) %>%
    drop_na(1)
  data <- data[-1, -c(4,6,8,10,12)]
  names(data) <- c("HDI rank", "Country",'HDI value(2014)','Life expectancy(years)','Expected years of schooling',
                   'Mean years of schooling','GNI per capita','GNI per capita rank - HDI rank')
  zamenjave <- c("Hong Kong, China (SAR)" = "Hong Kong",'Bolivia (Plurinational State of)'='Bolivia',
                 'Brunei Darussalam'='Brunei','Cabo Verde'='Cape Verde','Democratic Republic of the Congo'='Congo (Democratic Republic of the)',
                 'Republic of the Congo'='Congo',"Côte d'Ivoire"='Ivory Coast')
  data <- data %>% mutate(Country = ifelse(Country %in% names(zamenjave), zamenjave[Country], Country))
  return(data)
}

indikatorji <- uvozi.indikatorjirazvoja()


uvozi.hrate <- function() {
  link <- "https://en.wikipedia.org/wiki/List_of_countries_by_intentional_homicide_rate#Notes"
  stran <- html_session(link) %>% read_html()
  tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
    .[[2]] %>% html_table(dec = ",") %>% drop_na(6) %>% select(-Notes)
  hrate <- tabela
  colnames(hrate) <- c("country", "rate", "count", "region", "subregion", "year")
  hrate <- hrate %>% mutate()
  return(hrate)
}

hrate <- uvozi.hrate()


data$Country <- ifelse(is.na(zamenjave[data$Country]), data$Country, zamenjave[data$Country])
