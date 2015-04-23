# Getting and Cleaning Data Course Project

The purpose of this script is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### Script function

The script processes the Samsung experiment data obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and perform various data cleaning and merging that finally produces a tidy data set of aggregated readings for all features by subject ID and activity type.

### Steps to execute the script

1. Download the data source from the web site stated above and extract into a folder. There will be a folder called ```UCI HAR Dataset```.
2. Put ```run_analysis.R``` in the parent folder above ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in R.
3. Run ```source("run_analysis.R")``` and it will generate a file ```tidy_data.txt``` in your working directory.

