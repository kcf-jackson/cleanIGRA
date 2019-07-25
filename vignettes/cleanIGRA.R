## ---- results = 'hide', cache = TRUE, message=FALSE----------------------
# IGRA v1 data (.y2d, .dat, .mly and .mly.201607)
library(cleanIGRA)
filepath <- system.file("extdata//v1", "61902.y2d", package = "cleanIGRA")  
mydata <- clean_IGRA_v1(filepath)

## ------------------------------------------------------------------------
DT::datatable(head(mydata, 100), options = list(scrollX = TRUE,  pageLength = 5))  # show results

## ---- results = 'hide', cache = TRUE-------------------------------------
# IGRA v2 data (.txt)
library(cleanIGRA)
filepath <- system.file("extdata//v2", "ASM00094703-data.txt", package = "cleanIGRA")
mydata <- clean_IGRA_v2(filepath)

## ------------------------------------------------------------------------
DT::datatable(head(mydata, 100), options = list(scrollX = TRUE,  pageLength = 5))  # show results

