% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/divtable-class.R
\name{plot.divtable}
\alias{plot.divtable}
\title{Plot divtable object using membershipPlot}
\usage{
\method{plot}{divtable}(x, ..., l2 = paste("N =", rowSums(x)),
  main = deparse(substitute(x)))
}
\arguments{
\item{x}{Object of class \code{\link{divtable}}}

\item{l2}{\code{l2} argument given to \code{\link{membershipPlot}}
for column headings}

\item{\dots}{Additional arguments passed to \code{\link{membershipPlot}}}
}
\description{
Plot object of class \code{\link{divtable}} using
\code{\link{membershipPlot}}.  This function sets \code{l2} to be the
row sums of \code{x}.  Other arguments will be passed to
\code{\link{membershipPlot}}.
}

