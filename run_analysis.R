# Project for Peer Assessment by Haris Papageorgiou --Getting and Cleaning Data

#load necessary libraries
library(reshape2)

#set the working directory
setwd("C:/Work/bibliography/courses/2014/Data Specialization/Getting and Cleaning Data")

#read training  data  in this order --  y_train, subject_train, X_train and merge them in data.train
data1.train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, stringsAsFactors=FALSE)
data2.train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, stringsAsFactors=FALSE)
data3.train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, stringsAsFactors=FALSE)
data.train <- cbind(data1.train, data2.train, data3.train)

#read testing  data  in this order --  y_train, subject_train, X_train and merge them in data.test
data1.test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, stringsAsFactors=FALSE)
data2.test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, stringsAsFactors=FALSE)
data3.test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, stringsAsFactors=FALSE)
data.test <- cbind(data1.test, data2.test, data3.test)

#join two data frames in this order -- training and testing and produce the data.all dataset
data.all <- rbind(data.train, data.test)

#subset only on mean() and std() features plus activity and subject and...
#keep the result on data2.all dataframe 
data.features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
mylist<-grep("mean\\(|std\\(", data.features[,2])
add2 <- function (x) { x+2}
mylist<-sapply(mylist,add2)
mylist<-c(1,2,mylist)
data2.all <- subset(data.all, select=mylist)

#Uses descriptive activity names to name the activities in the data set
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)
addLabel <- function (x) { activity.labels[x,2]}
data2.all[,1]<-sapply(data2.all[,1],addLabel)

#Appropriately labels the data set with descriptive activity names
mylist2<-grep("mean\\(|std\\(", data.features[,2], value=TRUE)
mylist2<-c("activity", "subject", mylist2)
colnames(data2.all)<-mylist2

#Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
keys <- setdiff(names(data2.all), c("subject","activity"))
data2.all.melt <- melt(data2.all, id= c("activity", "subject"), measure.vars = keys)
data2.all.final <- dcast(data2.all.melt, activity + subject ~ variable, mean)

# store the result in the tidy.txt dataset
write.table(data2.all.final, file="./UCI HAR Dataset/tidy.txt",  row.names=FALSE, sep="\t", quote=FALSE)