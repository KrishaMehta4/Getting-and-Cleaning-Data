

This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## STEP 1: Download Data

* Link to **download** the data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* Link to data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## STEP 2: Load Data on R

* **features**<- features.txt (561 rows, 2 columns)

* **activities**<-activities.txt (6 rows, 2 columns)

* **subject_test**<-test/subject_test.txt (2947 rows, 1 column)

* **x_test**<-test/X_test.txt (2947 rows, 561 columns)

* **y_test**<-test/y_test.txt (2947 rows, 1 column)

* **subject_train**<-train/subject_train.txt (7352 rows, 1 column)

* **x_train**<-train/X_train.txt (7352 rows, 561 columns)

* **y_train**<-train/y_train.txt (7352 rows, 1 column)

## STEP 3: Merge Data

* **x** (10299 rows, 561 columns) formed by merging **x_test** and **x_train** using rbind()

* **y** (10299 rows, 1 column) formed by merging **y_test** and **y_train** using rbind()

* **subject** (10299 rows, 1 column) formed by merging **subject_test** and **subject_train** using rbind()

* **data** (10299 rows, 563 columns) formed by merging **x**, **y** and **subject** using cbind()

## STEP 4: Extracting only Mean and Standard deviation of each measurement

* **req_data** (10299 rows, 88 columns) is created by subsetting data by selecting only those columns which contain the word 'mean' and 'std' along with *subject* and *code*

## STEP 5: Use descriptive activity names of columns

* Use the **activities** data table to replace the *code* column in with the corresponding activity name

## STEP 6: Label dataset variables appropriately

* *code* is renamed to *activities*

* *Acc* is replaced by *Accelerometer*

* *Gyro* is replaced by *Gyroscope*

* *BodyBody* is replaced by *Body*

* *Mag* is replaced by *Magnitude*

* All start with f is replaced by *Frequency*, etc.

## STEP 7: Create independent tidy dataset with average of each variable for each activity and each subject

* **final_data** (180 rows, 88 columns) is created by summarizing **req_data**, taking mean of each variable for each activity and each subject after grouped by subject and activity

* Export **final_data** to FinalData.txt


