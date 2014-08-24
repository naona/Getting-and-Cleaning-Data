# Getting and Cleaning Data
# Course Project

# The function called run_analysis does the following. 
# 
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 
run_analysis <- function(directory) {    
    
    setwd(directory)
    
    #get from train 
    xTrain = read.table("./train/X_train.txt")
    yTrain = read.table("./train/y_train.txt")
    subjectTrain = read.table("./train/subject_train.txt")
    
    #get from test
    xTest = read.table("./test/X_test.txt")
    yTest = read.table("./test/y_test.txt")
    subjectTest = read.table("./test/subject_test.txt")
    
    # load headings from file for x
    featuresdf = read.table("./features.txt")
    headings = featuresdf$V2
    
    # transfer headings of x
    colnames(xTrain) = headings
    colnames(xTest) = headings
    
    # change V1 variable of y
    colnames(yTest) <- "activity"
    colnames(yTrain) <- "activity"
    
    #get activity_labels
    activitydf  = read.table("./activity_labels.txt")
    
    # convert variable names to lowercase
    activityLabels = tolower(levels(activitydf$V2))
    
    #####
    # 3 Uses descriptive activity names to name the activities in the data set
    #####
    # convert $activity to factor and add descriptive labels
    yTest$activity = factor(
        yTest$activity, 
        labels = activityLabels
    )
    yTrain$activity = factor(
        yTrain$activity, 
        labels = activityLabels
    )
    
    # change V1 variable of subject
    colnames(subjectTest) <- "subjectid"
    colnames(subjectTrain) <- "subjectid"
    
    # combine (x,y,subject)
    test = cbind(xTest, subjectTest, yTest)
    train = cbind(xTrain, subjectTrain, yTrain)
    
    #####
    # 1 Merges the training and the test sets to create one data set.
    #####
    # combine train and test set
    fullData = rbind(train, test)
    
    #####
    # 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
    #####
    pattern = "mean|std|subjectid|activity"
    tidyData = fullData[,grep(pattern , names(fullData), value=TRUE)]
    
    #####
    # 4 Appropriately labels the data set with descriptive variable names. 
    #####
    cleanNames = gsub("\\(|\\)|-|,", "", names(tidyData))
    names(tidyData) <- tolower(cleanNames)
    
    #####
    # 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    #####
    result = ddply(tidyData, .(activity, subjectid), numcolwise(mean))

    # write file to output
    write.table(result, file="data.txt", sep = "\t", row.name=FALSE)

}
