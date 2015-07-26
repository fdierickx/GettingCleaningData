## Use plyr package as I couldn't find a R 3.2.0 compatible release
library(plyr)

## 1. Merges the training and the test sets to create one data set.

## Read all test related data
testSet <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
testLabels <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

## Read all training related data
trainingSet <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
trainingLabels <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

## Merge all test and training sets together
data <- rbind(testSet, trainingSet)
labels <- rbind(testLabels, trainingLabels)
subjects <- rbind(testSubjects, trainingSubjects)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

## Read feature data
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

## Extract the mean and standard values using the grep function, 
meanAndStandardFeatures <- grep("-(mean|std)\\(\\)", features[, 2])
data <- data[, meanAndStandardFeatures]
names(data) <- features[meanAndStandardFeatures, 2]

## 3. Uses descriptive activity names to name the activities in the data set

## Read activity labels and update the column names with appropriate descriptions
activities <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
labels[, 1] <- activities[labels[, 1], 2]
names(labels) <- "activity"

## 4. Appropriately labels the data set with descriptive variable names. 
names(subjects) <- "subject"
tidyData <- cbind(data, labels, subjects)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
averages <- ddply(tidyData, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages, "averages.txt", row.name=FALSE)