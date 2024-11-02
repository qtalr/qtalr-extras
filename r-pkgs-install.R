# R script
# Install R dependenices
# Author: Jerid Francom
# Date: 2024-11-01

# Read in the list of R packages to install
# into a character vector

# Message to user
message("Installing R packages...")

pkgs <- readLines("./dependencies.txt")

# Check to see if the file is empty or not
if (length(pkgs) == 0) {
  stop("No R packages to install. Please check the dependencies.txt file.")
}

# Check if {pak} is installed, if not install it
# then install the R packages in the character vector

if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

pak::pkg_install(pkgs)

# End of script
message("R packages installed successfully!")
