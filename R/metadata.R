#' Extract Metadata
#'
#' Creates a csv file with all your metadata in.
#'
#' @param inDir character. The directory where your images are saved.
#' @param outDir character. The directory where you want your metadata saved.
#' @param name character. The name you want for your new metadata file.
#'
#' @author Philip Faure, \email{philip.faure13@gmail.com}
#' @keywords metadata
#'
#' @export
#'
#' @examples
#' metadata(inDir  = "/Users/philipfaure/Photos/",
#'          outDir = "/Users/philipfaure/Metadata/",
#'          name   = "my_metadata")

metadata <- function (inDir, outDir, name)
{
  time <- Sys.time()
  start <- proc.time()
  if (Sys.info()[["sysname"]] == "Windows") {
    message("Patience you must have my young padawan...")
    shell(paste("exiftool -r -csv ", inDir, " > ",
                outDir, "/", name, ".csv",
                sep = ""))
  }
  else {    message("Patience you must have my young padawan...")
    system(paste("exiftool -r -csv ", inDir, " > ",
                 outDir, "/", name, ".csv",
                 sep = ""))
  }
  comp.time <- Sys.time() - time
  paste("process.time =",comp.time,"seconds.", "Phil needs more coffee...", sep = " ")
}
