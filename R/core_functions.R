is_header <- function(line0){
  substr(line0, 1, 1) == '#'
}


format_header <- function(line0){
  data.frame(
    station_id = substr(line0, 2, 6),
    year = substr(line0, 7, 10),
    month = substr(line0, 11, 12),
    day = substr(line0, 13, 14),
    obs_hour = substr(line0, 15, 16),
    release_time = substr(line0, 17, 20),
    num_levels = substr(line0, 21, 24),
    stringsAsFactors = FALSE
  )
}


format_data <- function(line0){
  data.frame(
    major_level_type = substr(line0, 1, 1),
    minor_level_type = substr(line0, 2, 2),
    pressure = substr(line0, 3, 8),
    pressure_flag = substr(line0, 9, 9),
    Geopotential_height = substr(line0, 10, 14),
    Geopotential_height_flag = substr(line0, 15, 15),
    temp = substr(line0, 16, 20),
    temp_flag = substr(line0, 21, 21),
    dewpoint_depression = substr(line0, 22, 26),
    wind_direction = substr(line0, 27, 31),
    wind_speed = substr(line0, 32, 36),
    stringsAsFactors = FALSE
  )
}


format_single_line <- function(line0){
  if (is_header(line0)){
    return(format_header(line0))
  }
  format_data(line0)
}


format_single_file <- function(file_lines){
  library(magrittr)
  # formatted_lines <- lapply(file_lines, format_single_line)

  # A potentially slower implementation but it allows monitoring of progress
  # Parsing the file
  print("Parsing the file...")
  pb <- txtProgressBar(min = 0, max = length(file_lines), style = 3)
  formatted_lines <- array(list(), length(file_lines))
  for (i in seq_along(file_lines)){
    formatted_lines[[i]] <- format_single_line(file_lines[i])
    setTxtProgressBar(pb, i)
  }

  # Joining all the results
  cat("\n Finished parsing the file. Now putting them together as one data-frame... \n")
  is_header_vec <- sapply(file_lines, is_header) %>% as.numeric() %>% cumsum()
  is_header_vec_len <- length(unique(is_header_vec))
  unified_df <- array(list(), is_header_vec_len)
  pb <- txtProgressBar(min = 0, max = is_header_vec_len, style = 3)
  for (i in unique(is_header_vec)){
    current_list <- formatted_lines[which(is_header_vec == i)]
    unified_df[[i]] <- cbind( current_list[[1]], do.call(rbind, current_list[-1]) )
    setTxtProgressBar(pb, i)
  }
  unified_df <- do.call(rbind, unified_df)
  cat("\n Done! \n")

  unified_df
}

