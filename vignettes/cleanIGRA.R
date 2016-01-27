## ---- results = 'hide'---------------------------------------------------
library(cleanIGRA)
filepath <- system.file("extdata//", "89002.y2d", package = "cleanIGRA")
mydata <- clean_IGRA(filepath, type = 'file')  #key function

## ------------------------------------------------------------------------
DT::datatable(head(mydata, 100), options = list(scrollX = TRUE))  #show results

## ------------------------------------------------------------------------
library(magrittr)
mydata_level_list <- mydata %>% fix_data_type() %>% group_by_level()
mydata2 <- aggregate_temperature_by_month(mydata_level_list[[1]])  #convert the first level to monthly data
DT::datatable(mydata2, options = list(scrollX = TRUE))  #show results

