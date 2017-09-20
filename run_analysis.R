library(dplyr)

# 0. Download dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")


# 1. Merge the training and the test sets into one data set:

  # 1.1 Read files

    # 1.1.1 Read trainings tables:
      x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
      y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
      subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
      
    # 1.1.2 Read testing tables:
      x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
      y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
      subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
      
    # 1.1.3 Read feature vector:
      features <- read.table('./data/UCI HAR Dataset/features.txt')
      
    # 1.1.4 Read activity labels:
      activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
      
  # 1.2 Assign column names:
      colnames(x_train) <- features[,2] 
      colnames(y_train) <-"activityId"
      colnames(subject_train) <- "subjectId"
      
      colnames(x_test) <- features[,2] 
      colnames(y_test) <- "activityId"
      colnames(subject_test) <- "subjectId"
      
      colnames(activityLabels) <- c('activityId','activityType')
      
  # 1.3 Merge all data in one set:
      mrg_train <- cbind(y_train, subject_train, x_train)
      mrg_test <- cbind(y_test, subject_test, x_test)
      setAllInOne <- rbind(mrg_train, mrg_test)
