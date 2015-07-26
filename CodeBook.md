# Getting and Cleaning Data Course Project: CodeBook.md

## Variables used in the R script
* testSet, testLabels, testSubjects contain data read from the corresponding data files from the test directory provided in the data set.
* trainingSet, trainingLabels, trainingSubjects contain data read from the corresponding data files from the test directory provided in the data set.
* data, labels, subjects all are merged data sets from the corresponding test and training data sets mentioned above.
* features contains the names for all features.
* meanAndStandardFeatures contains the extracted measurements on the mean and standard deviation for each measurement.
* activities contains the class labels with their activity name used to describe the data in the eventual tidy data set.
* tidyData contains the tidy data set.

## Data 
The data were read from the files provided with the data sets that are available from the course project section. The data files used in the elaboration are:
* X_test.txt: Test set.
* Y_test.txt: Test labels.
* subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* X_train.txt: Training set.
* y_train.txt: Training labels.
* subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* features.txt: List of all features.
* activity_labels.txt: Links the class labels with their activity name.

## Data cleaning
The script 'run_analysis.R' executes the five steps requested in the course project for 'Getting and Cleaning Data'.

* The script to the assignment starts by reading all the data necessary from the accompanying data sets (for both test and training data sets). All of the similar data is eventually merged in one data set.
* Secondly, only the columns with the mean and standard deviation measures are extracted from the merged dataset. The columns are given appropriate names taken from the 'features.txt' file.
* Activity data are taken from the file 'activity_labels.txt' and are substituted in the set.
* Column names in the merged data set that have no clear meaning are substituted with more appropriate variable names.
* To finish the course project, a new dataset is created with averages for each subject and activity type and written to an output file called 'averages.txt'. This file can also be found in the repo.