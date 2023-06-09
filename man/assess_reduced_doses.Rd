% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assess_reduced_doses.R
\name{assess_reduced_doses}
\alias{assess_reduced_doses}
\title{Analyze physicians' compliance to dosing guidelines: REDUCE DOSE}
\usage{
assess_reduced_doses(
  input_files_path,
  anc_range = NA,
  plt_range = NA,
  hb_range = NA,
  reduction_factor
)
}
\arguments{
\item{input_files_path}{path to a file or a folder with MT csv files (in quotes).}

\item{anc_range}{Absolute neutrophil count (ANC) range between which doses should be reduce. NOTE: Ensure that values are represented with same unit as of the input ANC data.}

\item{plt_range}{Platelet (PLT) range between which doses should be reduce. NOTE: Ensure that values are represented with same unit as of the input PLT data.}

\item{hb_range}{Hemoglobin (HB) range between which doses should be stopped. NOTE: Ensure that values are represented with same unit as of the input Hb data.}

\item{reduction_factor}{Percentage of 6MP starting dose (first visit dose) dose that will be called as "reduced" dose. Default = 50\% of starting dose.}
}
\value{
Returns a list with (1) the 'REDUCE DOSE' analysis for each patient as listed below,
(2) analysis summary as dataframe (3) analysis summary as HTML table in viewer.
\enumerate{
\item{Pat ID}
\item{Number of decisions where the physician reduced dose (a)}
\item{Number of times blood counts did not support dose reduction (b)}
\item{Discordance (\%) = (\eqn{(b/a)*100)}}
}

#' @note
\enumerate{
\item{Atleast one of the threshold parameters (anc_threshold, plt_threshold, hb_threshold) must be provided to carry out analysis. Missing threshold parameter will not be considered.}
\item{If the function is used for cohort analysis then a and b will be represented as median and interquartile range (IQR) (25\%-75\%). The median and IQR is rounded off to upper integer value if decimal value is greater or equal to 0.5, else to lower integer value Example 1.4->1 and 3.75->4}
\item{User may save the result as a list, if required, to analyze each patient separately - use 1st element of list. Please refer to examples from \link[allMT]{assess_anemia}}
}
}
\description{
Evaluate number of times blood counts did not support physicians' REDUCE DOSE decision
}
\examples{
pat_data <- system.file("extdata/processed_data/", "UPN_915.csv", package = "allMT")
assess_reduced_doses(input_files_path = pat_data,
                     anc_range = c(0.5,0.75), plt_range = c(50,75),
                     hb_range = c(7,8), reduction_factor = 50)

\donttest{
cohort_path = paste0(system.file("extdata/processed_data/", package = "allMT"), "/")
assess_reduced_doses(input_files_path = cohort_path,
                     anc_range = c(0.5,0.75), plt_range = c(50,75),
                     hb_range = c(7,8), reduction_factor = 50)
}

}
\seealso{
\code{\link[=assess_stop_doses]{assess_stop_doses()}}, \code{\link[=assess_increased_doses]{assess_increased_doses()}}
}
