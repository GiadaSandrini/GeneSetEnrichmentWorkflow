# install_packages.R
# Script to install and load all required R packages for
# the enrichment workflow repository.

# List of required CRAN packages
cran_packages <- c(
  "plyr",
  "dplyr",
  "ggplot2",
  "forcats",
  "msigdbr",
  "svglite",
  "openxlsx"
)

# List of required Bioconductor packages
bioc_packages <- c(
  "limma",
  "biomaRt",
  "fgsea",
  "clusterProfiler"
)

# Function to install missing CRAN packages

install_if_missing_cran <- function(packages) {
  new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if(length(new_packages)) {
    install.packages(new_packages, dependencies = TRUE)
  }
  invisible(lapply(packages, library, character.only = TRUE))
}

# Function to install missing Bioconductor packages

install_if_missing_bioc <- function(packages) {
  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

  new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if(length(new_packages)) {
    BiocManager::install(new_packages, ask = FALSE, update = FALSE)
  }
  invisible(lapply(packages, library, character.only = TRUE))
}

# Install and load packages

install_if_missing_cran(cran_packages)
install_if_missing_bioc(bioc_packages)

# Message to indicate completion

message("All required packages are installed and loaded successfully!")
