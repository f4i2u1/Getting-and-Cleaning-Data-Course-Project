# Getting and Cleaning Data Course Project

The purpose of this script is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### Script function

The script processes the Samsung experiment data obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and perform various data cleaning and merging that finally produces a tidy data set of aggregated readings for all features by subject ID and activity type.

### Steps to work on this course project

1. Download the data source from the web site stated above and  into a folder on your local drive. You'll have a ```UCI HAR Dataset``` folder.
2. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in RStudio.
3. Run ```source("run_analysis.R")```, then it will generate a new file ```tiny_data.txt``` in your working directory.

### Dependencies

```run_analysis.R``` file will help you to install the dependencies automatically. It depends on ```reshape2``` and ```data.table```.
