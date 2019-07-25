v1_header_parser <- function(file, ...) {
  readr::read_fwf(
    file = file,
    col_positions = readr::fwf_positions(
      c(1, 2, 7, 11, 13, 15, 17, 21),
      c(1, 6, 10, 12, 14, 16, 20, 24),
      c("header_record_indicator", "station_number", "year", "month", "day", "observation_hour", "release_time", "number_of_levels")
    )
  )
}


v1_data_parser <- function(file, ...) {
  readr::read_fwf(
    file = file,
    col_positions = readr::fwf_positions(
      c(1, 2, 3, 9, 10, 15, 16, 21, 22, 27, 32),
      c(1, 2, 8, 9, 14, 15, 20, 21, 26, 31, 36),
      c("major_level_type", "minor_level_type", "pressure", "pressure_flag", "geopotential_height", "geopotential_height_flag", "temperature", "temperature_flag", "dewpoint_depression", "wind_direction", "wind_speed")
    ),
    comment = '#'
  )
}


v1_monthly_parser <- function(file, ...) {
  readr::read_fwf(
    file = file,
    col_positions = readr::fwf_positions(
      c(1, 7, 12, 15, 20, 26),
      c(5, 10, 13, 18, 24, 27),
      c("station_number", "year", "month", "pressure_level", "mean_value", "number_of_values_in_mean")
    ),
    comment = '#'
  )
}
