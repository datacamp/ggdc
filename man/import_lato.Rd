% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lato.R
\name{import_lato}
\alias{import_lato}
\title{Import Lato fonts for use in charts}
\usage{
import_lato()
}
\description{
Lato is a trademark of Google.
}
\details{
There is an option \code{ggdc.loadfonts} which -- if set to \code{TRUE} -- will
call \code{extrafont::loadfonts()} to register non-core fonts with R PDF &
PostScript devices. If you are running under Windows, the package calls the
same function to register non-core fonts with the Windows graphics device.
}
\note{
This will take care of ensuring PDF/PostScript usage. The location of
the font directory is displayed after the base import is complete. It is
highly recommended that you install them on your system the same way you
would any other font you wish to use in other programs.
}
