## ---- results = 'hide', cache = TRUE-------------------------------------
library(cleanIGRA)
filepath <- system.file("extdata//", "89002.y2d", package = "cleanIGRA")
mydata <- clean_IGRA(filepath, type = 'file')  #key function

## ------------------------------------------------------------------------
DT::datatable(head(mydata, 100), options = list(scrollX = TRUE,  pageLength = 5))  #show results

## ------------------------------------------------------------------------
library(magrittr)
mydata_level_list <- mydata %>% fix_data_type() %>% group_by_level()
mydata_first_level <- mydata_level_list[[1]]
mydata_monthly <- aggregate_temperature_by_month(mydata_first_level)  #convert the 1st level to monthly data

## ------------------------------------------------------------------------
mydata_monthly$temp %<>% round(1)  #rounding for display purposes
DT::datatable(mydata_monthly, options = list(scrollX = TRUE, pageLength = 5))  #show results

