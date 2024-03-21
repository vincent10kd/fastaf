#' @title Subsetting based on an exact match with identifiers by hash-based lookup
#'
#' @description Subsets a file by writing identifiers to a separate file, then matching the original file against this (using awk in linux).
#'
#' @param file Filename to retrieve dimensions of.
#' @param column Column to check the exact matches in.
#' @param ids Identifiers to match (character vector).
#' @param separator The column delimiter of the file.
#'
#' @return Returns a subset of the file as a matrix.
#' @export

subset_match_fast <- function(file, column = 1, ids = NULL, separator = '\t'){
  stt <- Sys.time()
  # system(paste0("echo \"", ids[1],"\" > id_list.txt"))
  # for(i in 2:length(ids)){
  #   system(paste0("echo \"", ids[i],"\" >> id_list.txt"))
  # }
  code <- paste0("awk 'NR==FNR {ids[$0]; next} {id=$", column,"; sub(/^ *| *$/, \"\", id)} id in ids' id_list.txt ", file)
  print(code)
  res <- system(code, intern=TRUE)
  system('rm id_list.txt')
  ett <- Sys.time()
  print(difftime(ett, stt, units='secs'))
  res <- do.call('rbind', strsplit(res, separator))
  res
}




