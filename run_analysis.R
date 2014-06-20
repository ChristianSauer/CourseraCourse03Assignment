#setwd("D:\\Desktop\\Coursera\\03\\Assignment")

#downloads the course file into the data subdirectory.
#creates the folder if it does not exist
# downloads the file only when the file does not exist, to avoid unnecessary downloading.

filepath <- "./data/UCIdataset.zip"

download_files <- function(filepath)
{
  if (!file.exists("data")) 
  {
    dir.create("data")
  }
    
  if (!file.exists(filepath))
  {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = filepath, mode="wb")
    list.files("./data")
  }
}


# loads the train and test data from disk and merges them
# return a list with three dataframes: subject, x, y
mergeTrainAndTest <- function()
{
  testPath <- "./data/UCI HAR Dataset/test"
  trainPath <- "./data/UCI HAR Dataset/train"
  
  testfileNames <- c("subject_test.txt", "X_test.txt", "Y_test.txt") 
  trainfileNames <- c("subject_train.txt", "X_train.txt", "Y_train.txt")
  
  testDataFrames <- c()
  trainDataFrames <- c()
  
  for (i in 1:length(testfileNames)) {
    path <- paste(testPath, testfileNames[i], sep="/")
    tempDF <- read.table(path, header=FALSE)
    testDataFrames[[i]] <- tempDF
  }

  for (i in 1:length(trainfileNames)) {
    path <- paste(trainPath, trainfileNames[i], sep="/")
    tempDF <- read.table(path, header=FALSE)
    trainDataFrames[[i]] <- tempDF
  }
  
  subject_all <- rbind(testDataFrames[[1]], trainDataFrames[[1]])
  x_all <- rbind(testDataFrames[[2]], trainDataFrames[[2]])
  y_all <- rbind(testDataFrames[[3]], trainDataFrames[[3]])  
  
  all_list <- c()
  all_list[[1]] <- subject_all;
  all_list[[2]] <- x_all;
  all_list[[3]] <- y_all;
  return(all_list)
}

#Merging the three datasets. To avoid naming conflicts the Variables for the subject ID and the activity are 
#renamed to Subject and Activity. All other Variables are still V1....Vn
mergeColumns <- function(merged_rows)
{
  dfSubject <- merged_rows[[1]]
  dfSet <- merged_rows[[2]]
  dfActivity <- merged_rows[[3]]
  
  #sensibly naming the sobject columns from df-subject
  names(dfSubject)[names(dfSubject)=="V1"] <- "Subject"
  names(dfActivity)[names(dfActivity)=="V1"] <- "Activity"
  
  mergedColumns <- cbind(dfSubject,dfActivity, dfSet)
  
  return(mergedColumns)
}

##reads the features from the features.txt and removes all leading numbers in the process
readFeatures <- function()
{
  filePath <- "./data/UCI HAR Dataset/features.txt"
  res <- readLines(filePath)
  cleanList <-c()
  for (i in 1:length(res))
  {
    clean <- strsplit(res[[i]], " ")[[1]]
    cleanList <- c(cleanList, clean[[2]])
  }
  
  return(cleanList)
}

##adding the column names to the dataframe. Includes "Activity" and "Features" as first columns
addColnamesToDf <- function(mergedColumns, features)
{
  allColumnNames <- c("Subject", "Activity", features)
  
  colnames(mergedColumns) <- allColumnNames
  
  return(mergedColumns)
}

#Changing the activity-colun to a factor with the appropiate labels.
addActivityLabels <- function(mergedColumns)
{
  mergedColumns$Activity <-as.factor(mergedColumns$Activity)
  levels(mergedColumns$Activity) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING" ,"LAYING")
  
  return(mergedColumns)
}

#Dropping all columns which have no mean() / std() in their name. Subject and Activity ar ealso retained.
keepStdMeanColumns <- function(mergedColumns)
{
  columnNames <- colnames(mergedColumns)
  keepColumns <- c("Subject", "Activity")
  for (i in 1:length(columnNames))
  {
    currentColumn <- columnNames[[i]]
    if (grepl("mean()", currentColumn, fixed=TRUE) || grepl("std()", currentColumn, fixed=TRUE))
    {
      keepColumns <-c(keepColumns,currentColumn)
    }
  }
  
  print(length(keepColumns))
  mergedColumns<- mergedColumns[keepColumns]
  return(mergedColumns)
}

#aggregating the data by subject and activity, using the mean. Each row contains now the average of each subject + activity.
aggregateDF <- function(mergedColumns)
{
  aggdata <- aggregate(.~Subject+Activity, data=mergedColumns, mean, na.rm=TRUE)
  return(aggdata)
}

#replacing the variable names with better formatted ones
tidyUpColumnNames <- function(df)
{
  cNames <- colnames(df)
  tidyNames <-c()
  for (i in 1:length(cNames))
  {
    tidy <- gsub("-", "_", cNames[[i]], fixed=TRUE)
    tidy <- gsub("()", "",tidy, fixed=TRUE)
    tidyNames <- c(tidyNames, tidy)
  }
  
  colnames(df) <- tidyNames
  
  return(df)
}


#writing the tidy dataset to disk
writeTidy<-function(aggregatedData,filename)
{
  write.table(aggregatedData,filename,row.names = FALSE)
}

#downloading files
download_files(filepath)

#unzipping the file into the data directory
unzip(filepath, exdir="./data")

#loading the data.frames, resulting in a List of subject, x, y
mergedRows <- mergeTrainAndTest()

#merging the three dataframes into one
mergedColumns <- mergeColumns(mergedRows)

#no need to keep the mergedRows around, 44.2mb is big
#rm(mergedRows)

#loading the feature names from features.txt
features <- readFeatures()

#adding the column names to the df
mergedColumns <- addColnamesToDf(mergedColumns, features)

#removing the features, no need for them
#rm(features)

#Changing the activity-colun to a factor with the appropiate labels.
mergedColumns <- addActivityLabels(mergedColumns)

#throwing away all columns with no std() / mean() in the title
mergedColumns <- keepStdMeanColumns(mergedColumns)

#aggregating the data by Subject and Activity. Using the mean.
aggregatedData <- aggregateDF(mergedColumns)

#removing the useless mergedColumns df
#rm(mergedColumns)

#tidying the column names
aggregatedData <- tidyUpColumnNames(aggregatedData)

#writing the result to disk
writeTidy(aggregatedData, "./Tidy_UCI_HAR_Dataset.txt")

#all done
print("Done!")


