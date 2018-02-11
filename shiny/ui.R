library(shiny)

shinyUI(fluidPage(
  titlePanel("Geografska širina in inidkatorji razvoja"), 
  sidebarLayout(
    sidebarPanel(
      selectInput("type",label="Indikator - regija",
                  choice=c("HDIrank SVET","HDIrank Afrika","HDIrank Ameriki","HDIrank Azija","HDIrank Evropa","HDIrank Oceanija",
                           "Pričakovana starost SVET","Pričakovana starost Afrika","Pričakovana starost Ameriki","Pričakovana starost Azija",
                           "Pričakovana starost Evropa","Pričakovana starost Oceanija",
                           "mrate SVET","mrate Afrika","mrate Ameriki","mrate Azija","mrate Evropa","mrate Oceanija",
                           "Pričakovana dolžina šolanja SVET","Pričakovana dolžina šolanja Afrika","Pričakovana dolžina šolanja Ameriki",
                           "Pričakovana dolžina šolanja Azija","Pričakovana dolžina šolanja Evropa","Pričakovana dolžina šolanja Oceanija",
                           "Dejanska dolžina šolanja SVET","Dejanska dolžina šolanja Afrika","Dejanska dolžina šolanja Ameriki",
                           "Dejanska dolžina šolanja Azija","Dejanska dolžina šolanja Evropa","Dejanska dolžina šolanja Oceanija",
                           "GNI na prebivalca SVET","GNI na prebivalca Afrika","GNI na prebivalca Ameriki","GNI na prebivalca Azija",
                           "GNI na prebivalca Evropa","GNI na prebivalca Oceanija")
      )
    ),
    mainPanel(plotOutput("box")
    ) 
    )))
