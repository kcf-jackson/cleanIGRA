# # IGRA Version 1
# # 1. data-por and data-y2d
# # 2. monthly-por and  monthy-upd
#
#
# # 1. data-por and data-y2d ------------------------------------------------
# # Header parser
# input <- "
# Header_Record_Indicator    1-  1  #_character
# Station_Number             2-  6  WMO_station_number
# Year                       7- 10  _
# Month                     11- 12  _
# Day                       13- 14  _
# Observation_Hour          15- 16  00-23_UTC
# Release_Time              17- 20  0000-2359_UTC,_9999_=_missing
# Number_of_levels          21- 24  number_of_subsequent_data_records
# "
# spec_generator(parse_spec(input)[,-4], "v1_header_parser")
#
#
# # Data parser
# input <- "
# Major_Level_Type           1-  1  1_=_standard_pressure_level,_2_=_significant_thermodynamic_level,_3_=_additional_wind_level
# Minor_Level_Type           2-  2  1_=_surface,_2_=_tropopause,_0_=_other
# Pressure                   3-  8  units_of_Pa_(mb_*_100)
# Pressure_Flag              9-  9  A,_B,_or_blank_(see_note_4_above)
# Geopotential_Height       10- 14  units_of_meters
# Geopotential_Height_Flag  15- 15  A,_B,_or_blank_(see_note_4_above)
# Temperature               16- 20  units_of_degrees_C_*_10
# Temperature_Flag          21- 21  A,_B,_or_blank_(see_note_4_above)
# Dewpoint_Depression       22- 26  units_of_degrees_C_*_10
# Wind_Direction            27- 31  units_of_degrees_(0-360,_inclusive)
# Wind_Speed                32- 36  units_of_(m/s)*10
# "
# spec_generator(
#   parse_spec(input)[, -4], "v1_data_parser",
#   "comment = '#'"
# )
#
#
# # 2. monthly-por and  monthy-upd ------------------------------------------
# input <- "
# Station_Number              1-  5  WMO_station_number
# Year                        7- 10  _
# Month                      12- 13  _
# Pressure_Level             15- 18  units_of_HPa_(mb),_9999_=_Surface_level
# Mean_Value                 20- 24  see_Note_4_above_for_units
# Number_of_Values_in_Mean   26- 27  _
# "
# spec_generator(
#   parse_spec(input)[, -4], "v1_monthly_parser",
#   "comment = '#'"
# )
#
