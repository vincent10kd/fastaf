#' @title Return the dimensions of a file without reading it in
#'
#' @description Returns the row, column dimensions of a file (using awk in linux).
#'
#' @param file Filename to retrieve dimensions of.
#' @param separator The column delimiter of the file.
#'
#' @return Returns the dimensions of a file as numeric vector (row, column).
#' @export

dim_fast <- function(file, separator = '\t'){
  code <- paste0("awk 'END {print NR; print NF;}' ", file)
  res <- system(code, intern=TRUE)
  as.numeric(res)
}

