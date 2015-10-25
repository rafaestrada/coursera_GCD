 Coursera Assingment Getting and Cleanning Data
 For Reading tidy data set in R use tidy <- read.table('tidySummary.txt', header = TRUE) 
 

This code was elaborated as part of Jonhn Hopkins Getting and Cleanning Data Course  on Coursera. 
In this repo you wil find:

run_analysis.R , the code.
README.md, what you are actually reading
CodeBook, description of varaibles




The code run_analysis.R gets a tidy data frame from the from the Human Activity Recognition Using Smartphones Dataset
which was downloaded at UCI. Data is about  experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The dataset included the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


run_analysis.R code, takes echa file into R.  First naming each column with a descriptive name, then merging all columns to get a train and a test data sets well identified.  Final merge  of train and test sets is made. Finally mean and std values are extracted using dplyr library and select function.

Then, tidy data set is constructed with de mean of each observation applied in terms of subject id and activity. There fore function group_by is used to generate a new data frame in terms of subject id and activity, lastly summarise function it's applied to gead mean of each columna.

Tidy dat set is exported using 

write.table(tidySummary, file="./tidySummary.txt", row.name = FALSE)

Tidy data set should be read in R  using 

data <- read.table('tidySummary.txt', header = TRUE)



