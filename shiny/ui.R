library(shiny)

shinyUI(fluidPage(
  titlePanel("Geografska širina in inidkatorji razvoja"), 
  sidebarLayout(
    sidebarPanel(
      selectInput("type1",label="Indikator",
                  choice=c("HDIrank","Pričakovana starost","mrate","Pričakovana dolžina šolanja",
                           "Dejanska dolžina šolanja","GNI na prebivalca")),
      selectInput("type2",label="regija",choice=c("SVET","Afrika","Ameriki","Azija","Evropa","Oceanija"))
    ),
    mainPanel(plotOutput("box")
    ) 
    )))
