#' Rename JPG images
#'
#' Renames images according to YYYYmmdd_HHMMSS.jpg. It is better to just use the renaming function in the package 'camtrapR' instead. It is better tested and also adds the station and camera column to the file name. This function I made is just for the fun of it. Sorry but currently this function does not support Windows OS. Windows suck balls. Get a Mac.
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

  stopifnot(length(inDir) == 1)
  if (!dir.exists(inDir))
    stop(
      "The directory you have specified as the 'inDir' argument does not seem to exist. Please check that you have correctly typed the directory where your images are. ",
      inDir,
      call. = FALSE
    )
  if (Sys.which("exiftool") == "")
    stop(
      "You're system does not seem have Exiftool installed. Please download from https://www.sno.phy.queensu.ca/~phil/exiftool/ and install. For Windows operating systems you need to [1] rename the downloaded file to Exiftool.exe and [2] place it in your Windows folder (i.e. C:/Windows). For MacOS you only need to download and install, and you should be good to go.",
      call. = FALSE
    )

  if (Sys.info()[["sysname"]] == "Windows") {
    message(
      "Sorry, currently metadataTools does not support Windows for this specific function. Windows suck balls. Buy a Mac."
    )
    # message("...your images are now being renamed.")
    # shell(
    #   paste(
    #     "exiftool -r -d",
    #     "%Y%m%d_%H%M%S%%-c.%%e '-filename<DateTimeOriginal'",
    #     inDir,
    #     sep = " "
    #   )
    # )
  } else {
    prompt1 <-
      readline(prompt = "Have you backed up your data? (Please answer Y or N): ")
    if (prompt1 == "Y" |
        prompt1 == "Yes" | prompt1 == "yes" |
        prompt1 == "YES" | prompt1 == "y") {

      message("                                     ")
      message("...your images are now being renamed.")
      message("                                     ")

      system(
        paste(
          "exiftool -r -d",
          "%Y%m%d_%H%M%S%%-c.%%e '-filename<DateTimeOriginal'",
          inDir,
          sep = " "
        )
      )

    } else {
      message(
        "Please back up your data before running this function. This is just a safety procedure. However, if you would like to bypass safety and live on the wild side, lie, answer 'Y' below.. "
      )
      message("           ")

      prompt2 <-
        readline(prompt = "Would you like to continue without backkinig up? (Please answer Y or N): ")

      if (prompt2 == "Y" |
          prompt2 == "Yes" | prompt2 == "yes" |
          prompt2 == "YES" | prompt2 == "y") {

        message("...your images are now being renamed.")
        system(
          paste(
            "exiftool -r -d",
            "%Y%m%d_%H%M%S%%-c.%%e '-filename<DateTimeOriginal'",
            inDir,
            sep = " "
          )
        )

      } else {
        message("       ")
        message("Good choice, back up that data and let me know when you're ready for me!")
        message("       ")
        message("For any issues or bugs please email: philip.faure13@gmail.com")
      }
    }

  }

  print(difftime(Sys.time(), time))
  message("All done!")
}
