## COURSERA ASSINGMENT

##Reading all files
train <- read.table('X_train.txt', sep='')
test <- read.table('X_test.txt', sep='')
activity_train <- read.table('y_train.txt', sep='')
activity_test <-  read.table('y_test.txt', sep='')
subject_train <- read.table('subject_train.txt', sep='')
subject_test <- read.table('subject_test.txt', sep='')
variables <- read.table('features.txt', sep='') 
activity_labels <- read.table('activity_labels.txt', sep='')

## Namming columns of the different files
colnames(activity_train) <- c('Activity'); colnames(activity_test) <- c('Activity')
colnames(subject_train) <- c('Subject_ID'); colnames(subject_test) <- c('Subject_ID')
colnames(activity_labels) = c("id","activity_name")

## Naming features
variables_names <- make.names(names=variables[,2], unique=TRUE, allow_= TRUE)
colnames(train) <- variables_names; colnames(test) <- variables_names

## Start merging 
total_set_train <- cbind( activity_train,train)
total_set_test <- cbind(activity_test, test)
total_set_train <- cbind(subject_train, total_set_train)
total_set_test <- cbind(subject_test, total_set_test)


## Final train-set merge
total_set <- rbind(total_set_train, total_set_test)

## Use dplyr to select columns with means and std
library(dplyr)
mean <- select(total_set, contains('mean'))
std <- select(total_set, contains('std'))


##Naming activities in lower case
total_set$Activity[total_set$Activity==1] = tolower(activity_labels[activity_labels$id==1,"activity_name"])
total_set$Activity[total_set$Activity==2] = tolower(activity_labels[activity_labels$id==2,"activity_name"])
total_set$Activity[total_set$Activity==3] = tolower(activity_labels[activity_labels$id==3,"activity_name"])
total_set$Activity[total_set$Activity==4] = tolower(activity_labels[activity_labels$id==4,"activity_name"])
total_set$Activity[total_set$Activity==5] = tolower(activity_labels[activity_labels$id==5,"activity_name"])
total_set$Activity[total_set$Activity==6] = tolower(activity_labels[activity_labels$id==6,"activity_name"])


##  Grouping in term os Subject Id and activity for mean.
bySubAct <- group_by(total_set, Subject_ID, Activity)

tidySummary <- summarise_each(bySubAct, funs(mean))

##Exporting tidy
write.table(tidySummary, file="./tidySummary.txt", row.name = FALSE)
