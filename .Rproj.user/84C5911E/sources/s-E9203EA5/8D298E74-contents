#' @title Read in a file using linux
#'
#' @description Loads a file as matrix using cat in linux.
#'
#' @param file Filename of file to load.
#' @param separator The column delimiter of the file.
#'
#' @return Returns a matrix.
#' @export

read_fast <- function(file, separator = '\t'){
  stt <- Sys.time()
  code <- paste0("cat ", file)
  print(code)
  res <- system(code, intern=TRUE)
  ett <- Sys.time()
  print(difftime(ett, stt, units='secs'))
  do.call('rbind', strsplit(res, separator))
}

