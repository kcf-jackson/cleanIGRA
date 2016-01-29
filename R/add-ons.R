#' @export
fix_data_type <- function(df0){
  df0[df0 == -9999] <- NA
  df0[df0 == -8888] <- NA
  df0$dates <- as.Date(paste(df0$year, df0$month, df0$day, sep = "-"))
  df0$release_time %<>% as.numeric()
  df0$num_levels %<>% as.numeric()
  df0$pressure %<>% as.numeric()
  df0$Geopotential_height %<>% as.numeric()
  df0$temp <- as.numeric(df0$temp) / 10
  df0$dewpoint_depression <- as.numeric(df0$dewpoint_depression) / 10
  df0$wind_direction %<>% as.numeric()
  df0$wind_speed <- as.numeric(df0$wind_speed) / 10
  order_of_display <- c("station_id" , "dates" , "year", "month", "day",
                        "obs_hour" , "release_time" , "num_levels" ,
                        "major_level_type" , "minor_level_type" ,
                        "pressure" , "pressure_flag" ,
                        "Geopotential_height" , "Geopotential_height_flag" ,
                        "temp" , "temp_flag" , "dewpoint_depression" ,
                        "wind_direction" , "wind_speed")
  df0[order_of_display]
}


#' @export
group_by_level <- function(df0){
  pressure_levels <- unique(df0$pressure)
  df0_list <- array(list(), length(pressure_levels))
  for (i in seq_along(pressure_levels)){
    df0_list[[i]] <- dplyr::filter(df0, pressure == pressure_levels[i])
  }
  df0_list
}


#' @export
aggregate_temperature_by_month <- function(df0, FUN = mean){
  monthlydata <- df0 %>% dplyr::group_by(station_id, year, month, pressure, pressure_flag) %>%
                   dplyr::summarise(temp = FUN(temp), counts = n())
  monthlydata
}


