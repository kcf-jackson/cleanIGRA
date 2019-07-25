v2_header_parser <- function(file, ...) {
  readr::read_fwf(
    file = file,
    col_positions = readr::fwf_positions(
      c(1, 2, 14, 19, 22, 25, 28, 33, 38, 47, 56, 64),
      c(1, 12, 17, 20, 23, 26, 31, 36, 45, 54, 62, 71),
      c("HEADREC", "ID", "YEAR", "MONTH", "DAY", "HOUR", "RELTIME", "NUMLEV", "P_SRC", "NP_SRC", "LAT", "LON")
    ),
    col_types = readr::cols(
      HEADREC = readr::col_character(),
      ID = readr::col_character(),
      YEAR = readr::col_integer(),
      MONTH = readr::col_integer(),
      DAY = readr::col_integer(),
      HOUR = readr::col_integer(),
      RELTIME = readr::col_integer(),
      NUMLEV = readr::col_integer(),
      P_SRC = readr::col_character(),
      NP_SRC = readr::col_character(),
      LAT = readr::col_integer(),
      LON = readr::col_integer()
    )
  )
}


v2_data_parser <- function(file, ...) {
  readr::read_fwf(
    file = file,
    col_positions = readr::fwf_positions(
      c(1, 2, 4, 10, 16, 17, 22, 23, 28, 29, 35, 41, 47),
      c(1, 2, 8, 15, 16, 21, 22, 27, 28, 33, 39, 45, 51),
      c("LVLTYP1", "LVLTYP2", "ETIME", "PRESS", "PFLAG", "GPH", "ZFLAG", "TEMP", "TFLAG", "RH", "DPDP", "WDIR", "WSPD")
    ),
    col_types = readr::cols(
      LVLTYP1 = readr::col_integer(),
      LVLTYP2 = readr::col_integer(),
      ETIME = readr::col_integer(),
      PRESS = readr::col_integer(),
      PFLAG = readr::col_character(),
      GPH = readr::col_integer(),
      ZFLAG = readr::col_character(),
      TEMP = readr::col_integer(),
      TFLAG = readr::col_character(),
      RH = readr::col_integer(),
      DPDP = readr::col_integer(),
      WDIR = readr::col_integer(),
      WSPD = readr::col_integer()
    ),
    comment = '#'
  )
}


v2_drvd_header_parser <- function(file, ...) {
  readr::read_fwf(
    file = file,
    col_positions = readr::fwf_positions(
      c(1, 2, 14, 19, 22, 25, 28, 32, 38, 44, 50, 56, 62, 68, 74, 80, 86, 92, 98, 104, 110, 116, 122, 128, 134, 140, 146, 152),
      c(1, 12, 17, 20, 23, 26, 31, 36, 43, 49, 55, 61, 67, 73, 79, 85, 91, 97, 103, 109, 115, 121, 127, 133, 139, 145, 151, 157),
      c("HEADREC", "ID", "YEAR", "MONTH", "DAY", "HOUR", "RELTIME", "NUMLEV", "PW", "INVPRESS", "INVHGT", "INVTEMPDIF", "MIXPRESS", "MIXHGT", "FRZPRESS", "FRZHGT", "LCLPRESS", "LCLHGT", "LFCPRESS", "LFCHGT", "LNBPRESS", "LNBHGT", "LI", "SI", "KI", "TTI", "CAPE", "CIN")
    ),
    col_types = readr::cols(
      HEADREC = readr::col_character(),
      ID = readr::col_character(),
      YEAR = readr::col_integer(),
      MONTH = readr::col_integer(),
      DAY = readr::col_integer(),
      HOUR = readr::col_integer(),
      RELTIME = readr::col_integer(),
      NUMLEV = readr::col_integer(),
      PW = readr::col_integer(),
      INVPRESS = readr::col_integer(),
      INVHGT = readr::col_integer(),
      INVTEMPDIF = readr::col_integer(),
      MIXPRESS = readr::col_integer(),
      MIXHGT = readr::col_integer(),
      FRZPRESS = readr::col_integer(),
      FRZHGT = readr::col_integer(),
      LCLPRESS = readr::col_integer(),
      LCLHGT = readr::col_integer(),
      LFCPRESS = readr::col_integer(),
      LFCHGT = readr::col_integer(),
      LNBPRESS = readr::col_integer(),
      LNBHGT = readr::col_integer(),
      LI = readr::col_integer(),
      SI = readr::col_integer(),
      KI = readr::col_integer(),
      TTI = readr::col_integer(),
      CAPE = readr::col_integer(),
      CIN = readr::col_integer()
    )
  )
}


v2_drvd_data_parser <- function(file, ...) {
  readr::read_fwf(
    file = file,
    col_positions = readr::fwf_positions(
      c(1, 9, 17, 25, 33, 41, 49, 57, 65, 73, 81, 89, 97, 105, 113, 121, 129, 137, 145),
      c(7, 15, 23, 31, 39, 47, 55, 63, 71, 79, 87, 95, 103, 111, 119, 127, 135, 143, 151),
      c("PRESS", "REPGPH", "CALCGPH", "TEMP", "TEMPGRAD", "PTEMP", "PTEMPGRAD", "VTEMP", "VPTEMP", "VAPPRESS", "SATVAP", "REPRH", "CALCRH", "RHGRAD", "UWND", "UWDGRAD", "VWND", "VWNDGRAD", "N")
    ),
    col_types = readr::cols(
      PRESS = readr::col_integer(),
      REPGPH = readr::col_integer(),
      CALCGPH = readr::col_integer(),
      TEMP = readr::col_integer(),
      TEMPGRAD = readr::col_integer(),
      PTEMP = readr::col_integer(),
      PTEMPGRAD = readr::col_integer(),
      VTEMP = readr::col_integer(),
      VPTEMP = readr::col_integer(),
      VAPPRESS = readr::col_integer(),
      SATVAP = readr::col_integer(),
      REPRH = readr::col_integer(),
      CALCRH = readr::col_integer(),
      RHGRAD = readr::col_integer(),
      UWND = readr::col_integer(),
      UWDGRAD = readr::col_integer(),
      VWND = readr::col_integer(),
      VWNDGRAD = readr::col_integer(),
      N = readr::col_integer()
    ),
    comment = '#'
  )
}


v2_monthly_parser <- function(file, ...) {
  readr::read_fwf(
    file = file,
    col_positions = readr::fwf_positions(
      c(1, 13, 18, 21, 26, 33),
      c(11, 16, 19, 24, 31, 34),
      c("ID", "YEAR", "MONTH", "LEVEL", "VALUE", "NUM")
    ),
    col_types = readr::cols(
      ID = readr::col_character(),
      YEAR = readr::col_integer(),
      MONTH = readr::col_integer(),
      LEVEL = readr::col_integer(),
      VALUE = readr::col_integer(),
      NUM = readr::col_integer()
    )
  )
}
