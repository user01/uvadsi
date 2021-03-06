% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/combo_functions.R
\name{combo_int}
\alias{combo_int}
\title{Combinations of integer vector}
\usage{
combo_int(.set)
}
\arguments{
\item{.set}{Integer vector to combine}
}
\value{
List of vector of integer combinations
}
\description{
Returns a map of all non-empty combinations of set. Returns an empty list if
given an empty or invalid value.
}
\examples{
combo_int(1:5)
}

