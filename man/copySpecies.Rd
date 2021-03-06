% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/copySpecies.R
\name{copySpecies}
\alias{copySpecies}
\title{Copy photos of specific species}
\usage{
copySpecies(inDir, newDir, exifTag, species)
}
\arguments{
\item{inDir}{character. The directory where all the images are saved in.}

\item{newDir}{character. The directory where you would like to copy your images to.}

\item{exifTag}{character. The name of the species tag column. Use "Subject" for images tagged in Windows Live Gallery or and in digiKam. Other tags might be necessary for images tagged in different software. You can use the metadata function to look for different tag names.}

\item{species}{character. The species tag as tagged in DigiKam or Windows Live Gallery.}
}
\value{
Copies all images according to the specified arguments (species, year) to a new directory as chosen by the user.
}
\description{
Copy all images from a specified directory which has a certain metadata species tag to a specified directory set by user. This function is very much similar to the 'getSpeciesImages' function from the camtrapR package except you can use Windows Live Gallery tags as well as digiKam tags.
}
\examples{
copySpByYear(inDir   = "/Users/philipfaure/Desktop/testSample",
             newDir  = "/Users/philipfaure/Desktop/testOutput",
             exifTag = "Subject",
             species = "Leopard")

}
\author{
Philip Faure, \email{philip.faure13@gmail.com}
}
\keyword{Copy}
\keyword{species}
