## Getting & Cleaning Data: Course Project 2
## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
##    each variable for each activity and each subject.

## load necessary libraries
library(data.table)
library(reshape2)

## load headers
headers <- read.table("./UCI HAR Dataset/features.txt")

## load activity labels
actvt_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

### load and merge TEST data
test_readings <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_actvts <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(test_readings) <- headers[,2]     # set the column headers to meaningful feature names
names(test_actvts) <- "Activity"    # name the activity column
names(test_subjects) <- "Subject"   # name the subject column

## give activity column its label names
test_actvts$Activity <- factor(test_actvts$Activity, labels=actvt_labels[,2])

## merge into a single data frame
test_data <- cbind(test_readings, test_actvts, test_subjects)

## get only mean and std columns
mean_std_cols <- grepl("mean|std", headers[,2])
test_data <- test_data[,mean_std_cols]

### load and merge TRAINING data
train_readings <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_actvts <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(train_readings) <- headers[,2] # set the column headers to meaningful feature names
names(train_actvts) <- "Activity"   # name the activity column
names(train_subjects) <- "Subject"  # name the subject column

## give activity column its label names
train_actvts$Activity <- factor(train_actvts$Activity, labels=actvt_labels[,2])

## merge into a single data frame
train_data <- cbind(train_readings, train_actvts, train_subjects)

## get only mean and std columns
mean_std_cols <- grepl("mean|std", headers[,2])
train_data <- train_data[,mean_std_cols]

### create the MERGED data
merged_data <- rbind(test_data, train_data)

## aggregate by subject and activity
aggregated <- aggregate(. ~ Subject + Activity, data=merged_data, FUN = mean)

### write aggregated data into a file
write.table(aggregated, file = "./tidy_data.txt", sep = "\t", row.names = FALSE)


