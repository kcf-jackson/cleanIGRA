#' Turn NCDC raw igra data into R dataframe
#' @param path character strings; Path to a file or folder.
#' @param type character strings; either 'file' or 'folder'.
#' @return a dataframe if type == 'file'; a list of dataframes if type == 'folder'.
#' @examples
#' \dontrun{
#' data0 <- clean_IGRA('inst//extdata//v1//61902.y2d')
#' data1 <- clean_IGRA('inst//extdata//v1', type = 'folder')
#' }
#' @export
clean_IGRA <- function(path, type = 'file'){
  .Deprecated(
    "clean_IGRA_v*", package = "cleanIGRA",
    msg = "The function 'clean_IGRA' is deprecated. A much faster solution is implemented in 'clean_IGRA_v1' and 'clean_IGRA_v2'.",
    old = "clean_IGRA"
  )
  #Check existence of file / folder.
  if (!file.exists(path)) {
    print("File / folder doesn't exist.")
    return(NULL)
  }

  if (tolower(type) == 'file') {

    #Check whether the file type is supported.
    correct_file_type <- check_file_extension(path, c('dat', 'y2d'),
                         msg = "The function only supports '.dat' and '.y2d' files.")
    if (!correct_file_type) return(NULL)

    source_file <- readLines(path)
    return(format_single_file(source_file))

  } else if (tolower(type) == 'folder') {

    #Loop through the whole folder.
    flist <- list.files(path)
    ret <- array(list(), length(flist))

    for (i in seq_along(flist)) {
      read_file <- file.path(path, flist[i])

      # Check whether the file type is supported
      correct_file_type <- check_file_extension(read_file, c('dat', 'y2d'),
                           msg = "The current file doesn't have extension '.dat' or '.y2d'. I'll skip this file.")
      if (!correct_file_type) next

      source_file <- readLines(read_file)
      ret[[i]] <- format_single_file(source_file)
      cat(i, '/', length(flist), 'file(s) completed.', length(flist) - i, 'file(s) remaining.\n')
    }
    return(ret)
  }

  print('Wrong type. It must be "file" or "folder". ')
  NULL
}
