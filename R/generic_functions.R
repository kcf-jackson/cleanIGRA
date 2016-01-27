print_progress <- function(i, n, every_k_loop = 1){
  if (i %% every_k_loop == 0){
    cat('Current progress:', round(100 * i / n, 2), "%.\n" )
  }
}


check_file_extension <- function(path, correct_exts, msg){
  file_ext <- path %>% get_file_name() %>% get_file_extension()
  correct_file_type <- any(correct_exts == file_ext)
  if (!correct_file_type){
    print(msg)
  }
  correct_file_type
}


get_file_name <- function(file_path){
  tail(strsplit(file_path, split = '/')[[1]], 1)
}


get_file_extension <- function(file_name){
  tail(strsplit(file_name, split = "[.]")[[1]], 1)
}


remove_NULL <- function(list0){
  list0[!sapply(list0, is.null)]
}


