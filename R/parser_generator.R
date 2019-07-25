if_else <- function(test, yes, no) {
  if (test) yes else no
}


parse_spec <- function(input) {
  remove_empty_str <- function(x) x[x != ""]
  remove_last_char <- function(x) substr(x, 1, nchar(x) - 1)
  replace <- function(x, n, f) {
    x[n] <- f(x[n])
    x
  }
  str_split <- function(x, s) {
    remove_empty_str(unlist(strsplit(x, s)))
  }

  input %>%
    str_split("\n") %>%
    purrr::map(str_split, s = " ") %>%
    purrr::map(replace, n = 2, f = remove_last_char) %>%
    do.call(rbind, .) %>%
    data.frame() %>%
    setNames(c("col_names", "start", "end", "col_types"))
}


spec_generator <- function(spec, fname = "my_parser", ...) {
  extras <- unlist(list(...))
  empty_str <- ""
  extras <- if_else(is.null(extras), empty_str, paste0(",\n", extras))

  if (is.null(spec$col_types)) {
    glue::glue("
    {fname} <- function(file, ...) {{
      readr::read_fwf(
        file = file,
        col_positions = readr::fwf_positions(
          {convert_vs(spec$start)},
          {convert_vs(spec$end)},
          {convert_vs(spec$col_names, T, T)}
        ){extras}
      )
    }}
  ")
  } else {
    col_types <- paste(
      glue::glue("{spec$col_names} = readr::col_{tolower(spec$col_types)}()"),
      collapse = ",\n"
    )
    glue::glue("
    {fname} <- function(file, ...) {{
      readr::read_fwf(
        file = file,
        col_positions = readr::fwf_positions(
          {convert_vs(spec$start)},
          {convert_vs(spec$end)},
          {convert_vs(spec$col_names, F, T)}
        ),
        col_types = readr::cols(
          {col_types}
        ){extras}
      )
    }}
  ")
  }
}


convert_vs <- function(x, lower = F, quote = F) {
  if (lower) x <- tolower(x)
  if (quote) x <- dQuote(x, F)
  paste0("c(", paste(x, collapse = ", "), ")")
}
