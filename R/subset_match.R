#' @title Subset a file by exact matching a set of identifiers
#'
#' @description Returns a subset of a file based on exactly matching a set of identifiers (using awk in linux).
#'
#' @param file Filename to subset.
#' @param column Column to identify exact matches in.
#' @param ids Identifiers (a character vector).
#' @param separator The column delimiter of the file.
#'
#' @return Returns a subset of the file as a matrix.
#' @export

subset_match <- function(file, column = 1, ids = NULL, separator = '\t'){
  stt <- Sys.time()
  code <- paste0("awk 'BEGIN {ids=\"", paste(ids, collapse='|'),"\"}$", column, "~ \"^(\" ids \")$\" {print}' ", file)
  print(substr(code, 1, 50))
  res <- system(code, intern=TRUE)
  ett <- Sys.time()
  print(difftime(ett, stt, units='secs'))
  res <- do.call('rbind', strsplit(res, separator))
  rbind(colnames_fast(file, separator), res)
}

