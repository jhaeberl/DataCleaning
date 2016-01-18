# Getting and Cleaning Data - Course Project

This repository holds the R code and documentation files for the Coursera project for the *Getting and Cleaning Data* course, part of the data science specialization.

The data set is available [here](https://github.com/jhaeberl/DataCleaning/blob/master/output.txt). See the [Code Book](https://github.com/jhaeberl/DataCleaning/blob/master/CodeBook.md) for more details.

The R file [run_analysis.R](https://github.com/jhaeberl/DataCleaning/blob/master/run_analysis.R) builds the new data set from the original data (see the [Code Book](https://github.com/jhaeberl/DataCleaning/blob/master/CodeBook.md)).

The code file contains extensive comments describing the process and does the following:

* Retrieve the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) from the web and save it to the "UCI HAR Dataset" subdirectory of the working directory if it doesn't already exist
* Merge the training and the test sets to create one data set 
* Extracts only the measurements on the mean and standard deviation for each measurement
* Use descriptive activity names, stored in the file activity_labels.txt, to name the activities in the data set and convert the corresponding variable into a factor
* Appropriately label the dataset with descriptive variable names; we preprocess the names so that they are valid variable names in R
* Create a new tidy data set containing the average of each variable for each activity and each subject

The results are stored in the file [output.txt](https://github.com/jhaeberl/DataCleaning/blob/master/output.txt).


