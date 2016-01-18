###############################################
# Getting and Cleaning Data Course Project
###############################################
#
# We need to do the following:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard
#    deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data
#    set with the average of each variable for each activity and each subject.

# First retrieve the data from the course web site
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "data.zip", mode = "wb")

if (!file.exists("UCI HAR Dataset")) {
  unzip("data.zip")
}

dirname <- "UCI HAR Dataset/"

################################
# Step 1
# Merges the training and the test sets to create one data set
#
# The "train" subdirectory contains three files of interest for this project,
# namely X_train.txt, y_train.txt, and subject_train.txt.
# X_train.txt contains all the features values; there are 561 features (the
#     columns of X_train.txt) and 7352 rows (the feature vectors)
# subject_train.txt holds the "identity" of the subject associated with each
#     feature vector and so is a single column with 7352 rows
# y_train.txt holds the index of the activity label associated with each
#     feature vector; thus it also consists of a single column with 7352 rows
# So we load these three datasets using the read.table() function and combine
# them using the cbind() function

trainX <- read.table(paste0(dirname, "train/X_train.txt"))
trainy <- read.table(paste0(dirname, "train/y_train.txt"))
trainsub <- read.table(paste0(dirname, "train/subject_train.txt"))
train <- cbind(trainsub, trainy, trainX)
dim(train)

# The test subdirectory contains similar files, namely X_test.txt,
# y_test.txt, and subject_test.txt, but these files have only 2947 rows
# of data
testX <- read.table(paste0(dirname, "test/X_test.txt"))
testy <- read.table(paste0(dirname, "test/y_test.txt"))
testsub <- read.table(paste0(dirname, "test/subject_test.txt"))
test <- cbind(testsub, testy, testX)
dim(test)

# and we combine train and test into a single data.frame using the
# rbind() function
df <- rbind(train, test)
dim(df)

# Clean up: remove unnecessary objects from workspace
rm(trainX, trainy, trainsub, train, testX, testy, testsub, test)

################################
# Step 2
# Extracts only the measurements on the mean and standard deviation
# for each measurement
#
# The names of the features are stored in the file features.txt
features <- read.table(paste0(dirname, "features.txt"), stringsAsFactors = FALSE)
dim(features)
head(features)
# we get the subset of features whose name contains either the substring
# "-mean()" or "-std()". Note that this will exclude a few features whose
# name contain "meanFreq". It is not clear from the instructions whether
# these features ought to be included. In any case, whether they are
# included or not hardly affect the purpose of this exercise.
cols <- grep("-mean\\(\\)|-std\\(\\)", features[,2])
# So we are left with 66 features
length(cols)
# remove the unwanted features from our dataset, that is we keep the
# first and second column of the dataset, namely the subject and the
# activity, together with the 66 relevant features
df <- df[,c(1, 2, 2+cols)]

################################
# Step 3
# Use descriptive activity names to name the activities in the data set
# The activity names are stored in the file activity_labels.txt
activity_labels <- read.table(paste0(dirname, "activity_labels.txt"))
# We turn the activity column into a factor and use these labels as
# the levels of the factor
df$activity <-  factor(df$activity, levels = activity_labels[,1], labels = activity_labels[,2])

################################
# Step 4
# Appropriately label the dataset with descriptive variable names
# We set the variable names using the feature names
# Note: parenthesis and hyphens are not allowed in variable names. So the
# function read.table() will replace such characters with a . by default.
# To ensure that our variable names are not changed when somebody reads
# in the data we preprocess the names by removing the parentheses and
# replacing the hyphens with a . (dot).
features[cols, 2] = gsub("\\(\\)", "", features[cols, 2])
features[cols, 2] = gsub("-", ".", features[cols, 2])
colnames(df) <- c("subject", "activity", features[cols, 2])

################################
# Step 5
# From the data set in step 4, create a second, independent tidy
# dataset with the average of each variable for each activity and
# each subject.

# We use the dplyr package
library(dplyr)

df_averages <- group_by(df, subject, activity) %>%
  summarise_each(funs(mean)) %>%
  ungroup()
# Thus df_averages is a tidy data frame with 180 rows, namely 30 subjects
# times 6 activities, and 68 columns, subject, and the means of the 66
# selected features
dim(df_averages)

# finally, write the results to the text file output.txt
write.table(df_averages, file = "output.txt", row.names = FALSE)
