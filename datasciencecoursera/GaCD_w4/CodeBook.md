# Codebook for the tidy.txt

The codebook describes the variables of the tidy dataset and their possible values.

|variable|possible values|description
|---|---|---|
|subject|A number from 1 to 30.|Equivalent to the subject ID from the subject_train.txt files of the original dataset.|
|activity|One of the following: WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING.|The codes from y\_train.txt and y\_test.txt of the original dataset substituted by the activity names from the activity\_labels.txt|
|measure|One of the following: fBodyAcc, fBodyAccJerk, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroJerkMag, fBodyBodyGyroMag, fBodyGyro, tBodyAcc, tBodyAccJerk, tBodyAccJerkMag, tBodyAccMag, tBodyGyro, tBodyGyroJerk, tBodyGyroJerkMag, tBodyGyroMag, tGravityAcc, tGravityAccMag.|This is the type of measure performed. Originally taken from the file containing the appropriate column names (features.txt). See the description for each measure in the features\_info.txt of the original dataset and the README.txt for details on the transformation.|
|coordinate|One of the following: X, Y, Z, NA.|This is the coordinate of measure performed. Originally taken from the file containing the appropriate column names (features.txt). See the description for each measure in the features\_info.txt of the original dataset and the README.txt for details on the transformation.|
|avgmean|Numeric values in range [-1;1].|This is the average of means of performed measures which satisfy the combination of subject ID, activity, measure and coordinate. See the README.txt for details on the transformation.|
|avgstd|Numeric values in range [-1;1].|This is the average of standard deviations of performed measures which satisfy the combination of subject ID, activity, measure and coordinate. See the README.txt for details on the transformation.|
