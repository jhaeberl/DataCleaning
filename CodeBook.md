# Code Book for the data in output.txt

The file contains a data set with 180 instances and 68 attributes. The data set was built from the data provided in the Human *Activity Recognition Using Smartphones Data Set* (see [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for details.) You can view the code used to produce the data set [here](https://github.com/jhaeberl/DataCleaning/blob/master/run_analysis.R).

There is one instance for each pair of subject and activity from the original data set.

There is one attribute each for the subject and activity.

* __subject__ - values: 1 to 30
* __activity__ - values: WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING

The remaining 66 attributes are numerical values that were obtained from the features of the original data set corresponding to the mean and standard deviation of each measurement by computing the average value for each subject and activity. The names of these attributes have been made into valid R variable names but the coorespondence with the feature names in the original data set is easy to figure out. For example, the attribute __tBodyAcc.mean.X__ corresponds to the feature __tBodyAcc-mean()-X__ in the original data set and __tBodyAcc.std.Z__ corresponds to __tBodyAcc-std()-Z__, etc. See the [R file](https://github.com/jhaeberl/DataCleaning/blob/master/run_analysis.R) for details. Note that the units of the attributes are the same as those of the corresponding features in the original data set since the values are averages of the corresponding feature values. See the [original data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for a detailed discussion of how the original features were computed.

Here is a list of the 66 attributes:

* __tBodyAcc.mean.X__
* __tBodyAcc.mean.Y__
* __tBodyAcc.mean.Z__
* __tBodyAcc.std.X__
* __tBodyAcc.std.Y__
* __tBodyAcc.std.Z__
* __tGravityAcc.mean.X__
* __tGravityAcc.mean.Y__
* __tGravityAcc.mean.Z__
* __tGravityAcc.std.X__
* __tGravityAcc.std.Y__
* __tGravityAcc.std.Z__
* __tBodyAccJerk.mean.X__
* __tBodyAccJerk.mean.Y__
* __tBodyAccJerk.mean.Z__
* __tBodyAccJerk.std.X__
* __tBodyAccJerk.std.Y__
* __tBodyAccJerk.std.Z__
* __tBodyGyro.mean.X__
* __tBodyGyro.mean.Y__
* __tBodyGyro.mean.Z__
* __tBodyGyro.std.X__
* __tBodyGyro.std.Y__
* __tBodyGyro.std.Z__
* __tBodyGyroJerk.mean.X__
* __tBodyGyroJerk.mean.Y__
* __tBodyGyroJerk.mean.Z__
* __tBodyGyroJerk.std.X__
* __tBodyGyroJerk.std.Y__
* __tBodyGyroJerk.std.Z__
* __tBodyAccMag.mean__
* __tBodyAccMag.std__
* __tGravityAccMag.mean__
* __tGravityAccMag.std__
* __tBodyAccJerkMag.mean__
* __tBodyAccJerkMag.std__
* __tBodyGyroMag.mean__
* __tBodyGyroMag.std__
* __tBodyGyroJerkMag.mean__
* __tBodyGyroJerkMag.std__
* __fBodyAcc.mean.X__
* __fBodyAcc.mean.Y__
* __fBodyAcc.mean.Z__
* __fBodyAcc.std.X__
* __fBodyAcc.std.Y__
* __fBodyAcc.std.Z__
* __fBodyAccJerk.mean.X__
* __fBodyAccJerk.mean.Y__
* __fBodyAccJerk.mean.Z__
* __fBodyAccJerk.std.X__
* __fBodyAccJerk.std.Y__
* __fBodyAccJerk.std.Z__
* __fBodyGyro.mean.X__
* __fBodyGyro.mean.Y__
* __fBodyGyro.mean.Z__
* __fBodyGyro.std.X__
* __fBodyGyro.std.Y__
* __fBodyGyro.std.Z__
* __fBodyAccMag.mean__
* __fBodyAccMag.std__
* __fBodyBodyAccJerkMag.mean__
* __fBodyBodyAccJerkMag.std__
* __fBodyBodyGyroMag.mean__
* __fBodyBodyGyroMag.std__
* __fBodyBodyGyroJerkMag.mean__
* __fBodyBodyGyroJerkMag.std__
