#' Extract Metadata
#'
#' Creates a csv file with selected metadata columns in. SourceFile, AmbientTemperature, MoonPhase, DateTimeOriginal, and Keywords are returned in the csv file.
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
#' metadataPPP(inDir  = "/Users/philipfaure/Photos",
#'             outDir = "/Users/philipfaure/Metadata",
#'             name   = "my_metadata")

metadataPPP <- function (inDir, outDir, name)
{
  time <- Sys.time()
  if (Sys.info()[["sysname"]] == "Windows") {
    message("Patience you must have my young padawan...")
    shell(paste("exiftool -r -HierarchicalSubject -Keywords -AmbientTemperature -MoonPhase -SourceFile -DateTimeOriginal -csv ", inDir, " > ",
                outDir, "/", name, ".csv",
                sep = ""))
  }
  else {    message("Patience you must have my young padawan...")
    system(paste("exiftool -r -HierarchicalSubject -Keywords -AmbientTemperature -MoonPhase -SourceFile -DateTimeOriginal -csv ", inDir, " > ",
                 outDir, "/", name, ".csv",
                 sep = ""))
  }
  comp.time <- Sys.time() - time
  print(round(comp.time, digits = 3))
  message("Philip needs a stimulant of the central nervous system.")
message("i.e. Coffee..")
message("C8•H10•N4•O2")
message("==============================")
message("https://github.com/PhilipFaure")
message("==============================")
}
