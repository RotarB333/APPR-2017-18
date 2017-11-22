# Analiza podatkov s programom R, 2017/18

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Analiza možnih povezav med geografsko lego in razvojem držav ZN

V projektu bom analiziral in združil podatke o indikatorjih razvoja posameznih držav ZN, in iskal možne povezave z naravoslovnimi podatki(oddaljenost od ekvatorja, povprečna temperatura), poskušal bom določiti kateri indikatorji so v skladu s teorijo, da se razvojna stopnja povečuje z oddaljenostjo od ekvatorja in katere države izstopajo. 


Za naravoslovne podtake bom uporabil vikipedijo in global data bank, za indikatorje razvoja pa data.un.org (podatkovna baza ZN).
Ker pri nekaterih državah ni podatkov za vsako leto, bom pri vseh upošteval podatke za zadnje leto, ko je na voljo. Po potrebi bom dodal še kakšne bolj zanimive indikatorje razvoja.

Za indikatorje razvoja bom upošteval:

* BDP per capita
* pričakovana starost
* število let šolanja
* delež prebivalstva v revščini
* število umorov, kriminal 
* zdravstvena oskrba
* dostop do interneta
* porodniški dopust
* število otrok rojenih v bolnišnicah ...






## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
