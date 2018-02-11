library(shiny)
library(datasets)

shinyServer(function(input, output) {
  output$box <- renderPlot({
    
    if(input$type1 == "HDIrank"){
      if(input$type2 == "SVET"){print(graf.hdirank)}
      else if(input$type2 == "Afrika"){print(graf.hdirank.afrika)}
      else if(input$type2 == "Ameriki"){print(graf.hdirank.amerika)}   
      else if(input$type2 == "Azija"){print(graf.hdirank.azija)}
      else if(input$type2 == "Evropa"){print(graf.hdirank.evropa)}
      else if(input$type2 == "Oceanija"){print(graf.hdirank.oceanija)}}
    else if(input$type1 == "Pričakovana starost"){
      if(input$type2 == "SVET"){print(graf.starost)}
      else if(input$type2 == "Afrika"){print(graf.starost.afrika)}
      else if(input$type2 == "Ameriki"){print(graf.starost.amerika)}   
      else if(input$type2 == "Azija"){print(graf.starost.azija)}
      else if(input$type2 == "Evropa"){print(graf.starost.evropa)}
      else if(input$type2 == "Oceanija"){print(graf.starost.oceanija)}}
    else if(input$type1 == "mrate"){
      if(input$type2 == "SVET"){print(graf.mrate)}
      else if(input$type2 == "Afrika"){print(graf.mrate.afrika)}
      else if(input$type2 == "Ameriki"){print(graf.mrate.amerika)}   
      else if(input$type2 == "Azija"){print(graf.mrate.azija)}
      else if(input$type2 == "Evropa"){print(graf.mrate.evropa)}
      else if(input$type2 == "Oceanija"){print(graf.mrate.oceanija)}}
    else if(input$type1 == "Pričakovana dolžina šolanja"){
      if(input$type2 == "SVET"){print(graf.psola)}
      else if(input$type2 == "Afrika"){print(graf.psola.afrika)}
      else if(input$type2 == "Ameriki"){print(graf.psola.amerika)}   
      else if(input$type2 == "Azija"){print(graf.psola.azija)}
      else if(input$type2 == "Evropa"){print(graf.psola.evropa)}
      else if(input$type2 == "Oceanija"){print(graf.psola.oceanija)}}
    else if(input$type1 == "Dejanska dolžina šolanja"){
      if(input$type2 == "SVET"){print(graf.psola)}
      else if(input$type2 == "Afrika"){print(graf.psola.afrika)}
      else if(input$type2 == "Ameriki"){print(graf.psola.amerika)}   
      else if(input$type2 == "Azija"){print(graf.psola.azija)}
      else if(input$type2 == "Evropa"){print(graf.psola.evropa)}
      else if(input$type2 == "Oceanija"){print(graf.psola.oceanija)}}
    else if(input$type1 == "GNI na prebivalca"){
      if(input$type2 == "SVET"){print(graf.gni)}
      else if(input$type2 == "Afrika"){print(graf.gni.afrika)}
      else if(input$type2 == "Ameriki"){print(graf.gni.amerika)}   
      else if(input$type2 == "Azija"){print(graf.gni.azija)}
      else if(input$type2 == "Evropa"){print(graf.gni.evropa)}
      else if(input$type2 == "Oceanija"){print(graf.gni.oceanija)}}
    
  })
}
)
