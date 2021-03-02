\name{GSE103322-package}

\alias{GSE103322-package}
\alias{GSE103322}

\title{GEO accession GSE103322 available as an \code{SingleCellExperiment}
  object.}

\description{
    Single cell RNA-Seq data for 5902 cells from 18 patients
    with oral cavity head and neck squamous cell carcinoma available
    as GEO accession [GSE103322]
    (http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE103322).
    GSE103322 data have been parsed into a \code{SincleCellExperiment}
    object available in \code{ExperimentHub}.
}

\details{
  See the vignette for examples of using these data.

  browseVignettes("GSE103322")

  Details of how these data were created are in the scripts/ directory
  of the source package.
}

\examples{
library(ExperimentHub)
hub <- ExperimentHub()
x <- query(hub, "GSE103322")
x
\dontrun{
## download resource
sce = x[[1]]
}}

\keyword{utilities}
