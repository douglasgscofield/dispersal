% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/diversityTests-divtable.R
\name{plot.diversity_test}
\alias{plot.diversity_test}
\title{Plot the result of a diversity test (alpha or gamma)}
\usage{
\method{plot}{diversity_test}(x, breaks = 50, compress.x = TRUE,
  compress.ratio = 1.2, xlab = "ln(LR) value", ylab = "Frequency",
  main = x$method, legend.text = "Observed ln(LR) = ",
  digits = getOption("digits"), ...)
}
\arguments{
\item{x}{Object of class \code{diversity_test}, returned by
\code{\link{alphaDiversityTest}}, \code{\link{alphaContrastTest}},
\code{\link{alphaContrastTest3}}, \code{\link{gammaContrastTest}} and
\code{\link{gammaContrastTest3}}}

\item{breaks}{Number of breaks to use when plotting the histogram of
the empirical distribution, passed to \code{\link{hist(..., plot = FALSE)}}}

\item{compress.x}{Logical, if \code{TRUE} and the observed value is more
than \code{compress.ratio} times the maximum value of the empirical
distribution, the x-axis is compressed to include the observed value}

\item{xlab, ylab, main}{Labels added to the plot}

\item{legend.text}{Text to use when printing legend containing the
observed value in the upper right of the plot. Set to \code{NULL} to
suppress printing the legend.}

\item{digits}{Number of significant digits to use when printing numeric
values}

\item{compress.ration}{See \code{compress.x}}
}
\description{
Plot an object of class \code{diversity_test}, the result of
\code{\link{alphaDiversityTest}}, \code{\link{alphaContrastTest}},
\code{\link{alphaContrastTest3}}, \code{\link{gammaContrastTest}} and
\code{\link{gammaContrastTest3}}.
}
\note{
The method used to compress the x-axis when observed values greatly
exceed the empirical distribution has not been well thought through.
}
\seealso{
\code{\link{alphaDiversityTest}}, \code{\link{alphaContrastTest}}, \code{\link{alphaContrastTest3}}, \code{\link{gammaContrastTest}}, \code{\link{gammaContrastTest3}}
}

