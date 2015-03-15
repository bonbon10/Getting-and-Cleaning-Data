---
title: "Codebook.md"  
output: html_document
---  
 
**Data:**
  
The R script reads in eight datasets from a zipped data folder that can be obtained here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

- X_train.txt: Measurements for the subjects generating the training data
- X_test.txt: Measurements for the subjects generating the training data
- subject_train.txt: Each row identifies the subject who performed the activity in the training data
- subject_test.txt: Each row identifies the subject who performed the activity in the test data
- Y_train.txt: Activity labels for each measurement in the training data
- Y_test.txt: Activity labels for each measurement in the test data
- features.txt: Variable names for the training and test data
- activity_labels.txt: Names for activity labels

**Data processing Steps:**

1: Read in all the datasets.

2: Rename the subject and activity variables as "Subject" and "Activity".

3: Combine the measurements, subject file, and activity labels for the training and test data separately (column combine because each dataset contains info for the same subjects).

4: Combine training and test data (row combine because each dataset includes different subjects).

5: Rename the variables in the dataset using the names in the "features.txt" file. 

6: Keep only mean and standard deviation measurements in the dataset.

7: Name the activities using the "activity_labels.txt" file. 

8: Create tidy dataset: get the mean for each variable for each activity and each subject.

9: Add "avg_" to the beginning of the variable names in the tidy dataset.

10: Output the final tidy dataset as a txt file. 


**Variables**

- Subject: ID variable ranging from 1-30 to identify the subject for the corresponding measurements

- Activity: One of six activities the subjects performed (walking, walking upstairs, walking downstairs, sitting, standing, laying)

- 66 variables named "avg_XXXX.YYY", where XXXX corresponds to the feature measured and YYY indicates the value, either mean ("mean") or standard deviation ("std"). In some cases, measurements were taken in the X, Y, and Z directions, which is indicated by "...X", "...Y", or "...Z" at the end of the variable name.

    + The following features have X, Y, and Z values (8 variables * 3 directions * 2 values = 48 total): tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, fBodyAcc, fBodyAccJerk, fBodyGyro.

    + Additional feature variables (9 variables * 2 values = 18 total): tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

- Each of the 66 feature variables represents the average for that feature by subject and activity. 

- Note: the features have been normalized and are thus unitless. 
        