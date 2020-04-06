#Loading required packages
library(dplyr)

#Loading the downloaded data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

##STEP 1: Merges the training and the test sets to create one data set

x<-rbind(x_train, x_test)
y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)
data<-cbind(x,y,subject)

##STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement

req_data<-data %>%
  select(subject, code, contains("mean"), contains("std"))

##STEP 3: Uses descriptive activity names to name the activities in the data set

req_data$code<-activities[req_data$code,2]

##STEP 4: Appropriately labels the data set with descriptive variable names


names(req_data)[2] = "activity"
names(req_data)<-gsub("Acc", "Accelerometer", names(req_data))
names(req_data)<-gsub("Gyro", "Gyroscope", names(req_data))
names(req_data)<-gsub("BodyBody", "Body", names(req_data))
names(req_data)<-gsub("Mag", "Magnitude", names(req_data))
names(req_data)<-gsub("^t", "Time", names(req_data))
names(req_data)<-gsub("^f", "Frequency", names(req_data))
names(req_data)<-gsub("tBody", "TimeBody", names(req_data))
names(req_data)<-gsub("-mean()", "Mean", names(req_data), ignore.case = TRUE)
names(req_data)<-gsub("-std()", "STD", names(req_data), ignore.case = TRUE)
names(req_data)<-gsub("-freq()", "Frequency", names(req_data), ignore.case = TRUE)
names(req_data)<-gsub("angle", "Angle", names(req_data))
names(req_data)<-gsub("gravity", "Gravity", names(req_data))

##STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

final_data<-aggregate(.~subject+activity,req_data,mean)
write.table(final_data,file="./FinalData.txt")
str(final_data)

