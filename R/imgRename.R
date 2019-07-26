#' Rename JPG images
#'
#' Renames images according to YYYYmmdd_HHMMSS.jpg. It is better to just use the renaming function in the package 'camtrapR' instead. It is better tested and also adds the station and camera column to the file name. This function I made is just for the fun of it.
#' @param inDir character. The directory where your images are saved. Make sure you are working on a back up of your data in case something goes wrong. If you are still deciding on using this function, then please work on a copy of your data and not the raw data so that if something happens you still have a backup.
#'
#'
#' @author Philip Faure, \email{philip.faure13@gmail.com}
#' @keywords image rename
#'
#' @export
#'
#' @examples
#' imgRename(inDir  = "/Users/philipfaure/Photos")

imgRename <- function (inDir)
{
  time <- Sys.time()

  message("Have you made a copy of your data? Please always work on a copy of your images so that if something goes wrong you still have a backup.")

  stopifnot(length(inDir) == 1)
  if (!dir.exists(inDir))
    stop("The directory you have specified as the 'inDir' argument does not seem to exist. Please check that you have correctly typed the directory where your images are. ", inDir, call. = FALSE)
  if (Sys.which("exiftool") == "")
    stop("You're system does not seem have Exiftool installed. Please download from https://www.sno.phy.queensu.ca/~phil/exiftool/ and install. For Windows operating systems you need to [1] rename the downloaded file to Exiftool.exe and [2] place it in your Windows folder (i.e. C:/Windows). For MacOS you only need to download and install, and you should be good to go.", call. = FALSE)

  if (Sys.info()[["sysname"]] == "Windows") {
    message("...your images are now being renamed.")
    shell(
      paste(
        "exiftool -r -d",
        "%Y%m%d_%H%M%S%%-c.%%e '-filename<DateTimeOriginal'",
        inDir,
        sep = " "
      )
    )
  }
  else {
    message("...your images are now being renamed.")
    system(
      paste(
        "exiftool -r -d",
        "%Y%m%d_%H%M%S%%-c.%%e '-filename<DateTimeOriginal'",
        inDir,
        sep = " "
      )
    )
  }

  print(difftime(Sys.time(), time))
  message("All done!")
}
