# # IGRA Version 2
# # 1. data-por and data-y2d
# # 2. derived
# # 3. monthly-por and  monthy-upd
#
#
# # 1. data-por and data-y2d ------------------------------------------------
# # header parser
# input <- "
# HEADREC       1-  1  Character
# ID            2- 12  Character
# YEAR         14- 17  Integer
# MONTH        19- 20  Integer
# DAY          22- 23  Integer
# HOUR         25- 26  Integer
# RELTIME      28- 31  Integer
# NUMLEV       33- 36  Integer
# P_SRC        38- 45  Character
# NP_SRC       47- 54  Character
# LAT          56- 62  Integer
# LON          64- 71  Integer
# "
# spec_generator(parse_spec(input), "v2_header_parser")
#
#
# input <- "
# LVLTYP1         1-  1   Integer
# LVLTYP2         2-  2   Integer
# ETIME           4-  8   Integer
# PRESS          10- 15   Integer
# PFLAG          16- 16   Character
# GPH            17- 21   Integer
# ZFLAG          22- 22   Character
# TEMP           23- 27   Integer
# TFLAG          28- 28   Character
# RH             29- 33   Integer
# DPDP           35- 39   Integer
# WDIR           41- 45   Integer
# WSPD           47- 51   Integer
# "
# spec_generator(parse_spec(input), "v2_data_parser", "comment = '#'")
#
#
# # 2. derived --------------------------------------------------------------
# # header parser
# input <- "
# HEADREC       1-  1  Character
# ID            2- 12  Character
# YEAR         14- 17  Integer
# MONTH        19- 20  Integer
# DAY          22- 23  Integer
# HOUR         25- 26  Integer
# RELTIME      28- 31  Integer
# NUMLEV       32- 36  Integer
# PW           38- 43  Integer
# INVPRESS     44- 49  Integer
# INVHGT       50- 55  Integer
# INVTEMPDIF   56- 61  Integer
# MIXPRESS     62- 67  Integer
# MIXHGT       68- 73  Integer
# FRZPRESS     74- 79  Integer
# FRZHGT       80- 85  Integer
# LCLPRESS     86- 91  Integer
# LCLHGT       92- 97  Integer
# LFCPRESS     98- 103  Integer
# LFCHGT      104- 109  Integer
# LNBPRESS    110- 115  Integer
# LNBHGT      116- 121  Integer
# LI          122- 127  Integer
# SI          128- 133  Integer
# KI          134- 139  Integer
# TTI         140- 145  Integer
# CAPE        146- 151  Integer
# CIN         152- 157  Integer
# "
# spec_generator(parse_spec(input), "v2_drvd_header_parser")
#
# # data parser
# input <- "
# PRESS           1-  7   Integer
# REPGPH          9- 15   Integer
# CALCGPH        17- 23   Integer
# TEMP           25- 31   Integer
# TEMPGRAD       33- 39   Integer
# PTEMP          41- 47   Integer
# PTEMPGRAD      49- 55   Integer
# VTEMP          57- 63   Integer
# VPTEMP         65- 71   Integer
# VAPPRESS       73- 79   Integer
# SATVAP         81- 87   Integer
# REPRH          89- 95   Integer
# CALCRH         97- 103   Integer
# RHGRAD        105- 111   Integer
# UWND          113- 119   Integer
# UWDGRAD       121- 127   Integer
# VWND          129- 135   Integer
# VWNDGRAD      137- 143   Integer
# N             145- 151   Integer
# "
# spec_generator(parse_spec(input), "v2_drvd_data_parser", "comment = '#'")
#
#
# # 3. monthly-por and  monthy-upd ------------------------------------------
# input <- "
# ID            1- 11  Character
# YEAR         13- 16  Integer
# MONTH        18- 19  Integer
# LEVEL        21- 24  Integer
# VALUE        26- 31  Integer
# NUM          33- 34  Integer
# "
# spec_generator(parse_spec(input), "v2_monthly_parser")
