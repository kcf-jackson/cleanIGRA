#' Turn NCDC raw IGRA v1 data into an R dataframe
#' @param file character strings; Path to a file. The file extension
#' should be one of ".y2d", ".dat", ".mly" and ".mly.201607".
#' @param type (optional) character; one of "y2d", "dat" and "mly". The
#' function will make a simple guess based on the filename if this is
#' not provided.
#' @return a dataframe.
#' @examples
#' \dontrun{
#' path <- system.file("extdata//v1", package = "cleanIGRA")
#' data0 <- clean_IGRA_v1(file.path(path, '61902.y2d'))
#' data0 <- clean_IGRA_v1(file.path(path, '07139.dat'))
#' data0 <- clean_IGRA_v1(file.path(path, 'vwnd_12z.mly.201607'))
#' }
#' @export
clean_IGRA_v1 <- function(file, type) {
  if (missing(type)) type = ""
  check_filename <- function(x, type, pattern) {
    (type == pattern) || (grepl(pattern, basename(x)))
  }

  if (check_filename(file, type, "y2d") || check_filename(file, type, "dat")) {
    parse_IGRA(file, v1_header_parser, v1_data_parser)[, -1]
  } else if (check_filename(file, type, "mly") || check_filename(file, type, "201607")) {
    v1_monthly_parser(file)
  } else {
    stop("I can't recognise the file. Is it one of '.y2d', '.dat', '.mly' and '.mly.201607'? Submit an issue on github if you think something is wrong.")
  }
}


#' Turn NCDC raw IGRA v2 data into an R dataframe
#' @param file character strings; Path to a file. The file extension
#' should be a ".txt" file.
#' @param type (optional) character; one of "data", "drvd" and "mly".
#' The function will make a simple guess based on the filename if this is
#' not provided.
#' @return a dataframe.
#' @examples
#' \donttest{
#' path <- system.file("extdata//v2", package = "cleanIGRA")
#' data0 <- clean_IGRA_v2(file.path(path, 'ASM00094703-data.txt'))
#' data0 <- clean_IGRA_v2(file.path(path, 'AGM00060490-drvd.txt'))
#' data0 <- clean_IGRA_v2(file.path(path, 'vapr_12z-mly-201906.txt'))
#' }
#' @export
clean_IGRA_v2 <- function(file, type) {
  if (missing(type)) type = ""
  check_filename <- function(x, type, pattern) {
    (type == pattern) || (grepl(pattern, basename(x)))
  }

  if (check_filename(file, type, "data")) {
    parse_IGRA(file, v2_header_parser, v2_data_parser)[, -1]
  } else if (check_filename(file, type, "drvd")) {
    parse_IGRA(file, v2_drvd_header_parser, v2_drvd_data_parser)[, -1]
  } else if (check_filename(file, type, "mly")) {
    v2_monthly_parser(file)
  } else {
    stop("I can't recognise the file. Can you please specify the 'type' parameter for me?")
  }
}


parse_IGRA <- function(file, header_parser, data_parser) {
  # Parsing the file
  cat("Parsing the file...")

  # Parsing and inserting the metadata separately
  lines <- readLines(file)
  header_flag <- sapply(lines, is_header)
  header_lines <- lines[header_flag]
  data_lines <- lines[!header_flag]
  header_coverage <- table(cumsum(as.numeric(header_flag)))

  # Create temporary file for the header lines
  temp_file <- tempfile()
  write(header_lines, file = temp_file)
  metadata0 <- header_parser(temp_file)
  file.remove(temp_file)

  # Create temporary file for the data lines
  temp_file <- tempfile()
  write(data_lines, file = temp_file)
  data0 <- data_parser(temp_file)
  file.remove(temp_file)

  metadata <- dplyr::bind_rows(purrr::map2(
    1:nrow(metadata0), header_coverage,
    function(i, times) {
      metadata0[rep(i, times - 1), ]
    }
  ))

  cat("Done! \n")
  dplyr::bind_cols(metadata, data0)
}
