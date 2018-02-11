library(shiny)
library(datasets)

shinyServer(function(input, output) {
  output$box <- renderPlot({
    
    if(input$type == "HDIrank SVET"){
      print(graf.hdirank)}
    else if(input$type == "HDIrank Afrika"){
      print(graf.hdirank.afrika)}
    else if(input$type == "HDIrank Ameriki"){
      print(graf.hdirank.amerika)}
    else if(input$type == "HDIrank Azija"){
      print(graf.hdirank.azija)}
    else if(input$type == "HDIrank Evropa"){
      print(graf.hdirank.evropa)}
    else if(input$type == "HDIrank Oceanija"){
      print(graf.hdirank.oceanija)}
    
    else if(input$type == "Pričakovana starost SVET"){
      print(graf.starost)}
    else if(input$type == "Pričakovana starost Afrika"){
      print(graf.starost.afrika)}
    else if(input$type == "Pričakovana starost Ameriki"){
      print(graf.starost.amerika)}
    else if(input$type == "Pričakovana starost Azija"){
      print(graf.starost.azija)}
    else if(input$type == "Pričakovana starost Evropa"){
      print(graf.starost.evropa)}
    else if(input$type == "Pričakovana starost Oceanija"){
      print(graf.starost.oceanija)}
    
    else if(input$type == "mrate SVET"){
      print(graf.mrate)}
    else if (input$type == "mrate Afrika"){
      print(graf.mrate.afrika)}
    else if (input$type == "mrate Ameriki"){
      print(graf.mrate.amerika)}
    else if (input$type == "mrate Azija"){
      print(graf.mrate.azija)}
    else if (input$type == "mrate Evropa"){
      print(graf.mrate.evropa)}
    else if (input$type == "mrate Oceanija"){
      print(graf.mrate.oceanija)}
    
    else if (input$type == "Pričakovana dolžina šolanja SVET"){
      print(graf.psola)}
    else if (input$type == "Pričakovana dolžina šolanja Afrika"){
      print(graf.psola.afrika)}
    else if (input$type == "Pričakovana dolžina šolanja Ameriki"){
      print(graf.psola.amerika)}
    else if (input$type == "Pričakovana dolžina šolanja Azija"){
      print(graf.psola.azija)}
    else if (input$type == "Pričakovana dolžina šolanja Evropa"){
      print(graf.psola.evropa)}
    else if (input$type == "Pričakovana dolžina šolanja Oceanija"){
      print(graf.psola.oceanija)}
    
    else if (input$type == "Dejanska dolžina šolanja SVET"){
      print(graf.dsola)}
    else if (input$type == "Dejanska dolžina šolanja Afrika"){
      print(graf.dsola.afrika)}
    else if (input$type == "Dejanska dolžina šolanja Ameriki"){
      print(graf.dsola.amerika)}
    else if (input$type == "Dejanska dolžina šolanja Azija"){
      print(graf.dsola.azija)}
    else if (input$type == "Dejanska dolžina šolanja Evropa"){
      print(graf.dsola.evropa)}
    else if (input$type == "Dejanska dolžina šolanja Oceanija"){
      print(graf.dsola.oceanija)}
    
    else if (input$type == "GNI na prebivalca SVET"){
      print(graf.gni)}
    else if (input$type == "GNI na prebivalca Afrika"){
      print(graf.gni.afrika)}
    else if (input$type == "GNI na prebivalca Ameriki"){
      print(graf.gni.amerika)}
    else if (input$type == "GNI na prebivalca Azija"){
      print(graf.gni.azija)}
    else if (input$type == "GNI na prebivalca Evropa"){
      print(graf.gni.evropa)}
    else if (input$type == "GNI na prebivalca Oceanija"){
      print(graf.gni.oceanija)}
    
  })
}
)
