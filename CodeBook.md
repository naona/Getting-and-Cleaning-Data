# CodeBook  

This codebook describes the variables, the data, and any transformations or work.  

## Original Data
Here are the data for the project:   
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>  

## Variables

xTrain: a data frame from (data)/train/X_train.txt. Column name changes to name the features  
yTrain: a data frame from (data)/train/y_train.txt. 1st column name changes to "activity". 1st column value changes to name the activities      
subjectTrain: a data frame from (data)/train/subject_train.txt. Column name changes to "subjectid"   

xTest: a data frame from (data)/test/X_test.txt. Column name changes to name the features  
yTest: a data frame from (data)/test/y_test.txt. 1st column name changes to "activity". 1st column value changes to name the activities    
subjectTest: a data frame from (data)/test/subject_test.txt. Column name changes to "subjectid"  

featuresdf: a data frame from (data)/features.txt  
headings: name the features from featuresdf  

activitydf: a data frame from (data)/activity_labels.txt   
activityLabels: name the activities from activitydf    

test: a data frame conbined xTest, subjectTest, yTest  
train: a data frame conbined xTrain, subjectTrain, yTrain  

fullData: a data frame conbined test, train 

pattern: column name for extract   
tidyData: a data frame only the measurements on the mean and standard deviation for each measurement. 

cleanNames: Appropriately labels for tidyData    

result:  independent tidy data set with the average of each variable for each activity and each subject.

