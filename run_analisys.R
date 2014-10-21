# The main feautres of this code should be:
# - Merges the training and the test sets to create one data set.
# - Extracts only the measurements on the mean and standard deviation for each measurement. 
# - Uses descriptive activity names to name the activities in the data set
# - Appropriately labels the data set with descriptive variable names. 
# - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

setwd('UCI HAR Dataset/')

# subject files
file_train_1 <- 'train/subject_train.txt'
file_test_1  <- 'test/subject_test.txt'
data_train_1 <- data.frame(read.csv(file_train_1, header = F, sep = ""))
data_test_1 <- data.frame(read.csv(file_test_1, header = F,sep = ""))
if (!file.exists('merged_data/')) dir.create('merged_data/',showWarnings = FALSE)
data_subject <- rbind(data_train_1[], data_test_1[])

# X_ files
file_train_2 <- 'train/X_train.txt'
file_test_2  <- 'test/X_test.txt'
data_train_2 <- data.frame(read.csv(file_train_2, header = F, sep = ""))
data_test_2 <- data.frame(read.csv(file_test_2, header = F, sep = ""))
names(data_test_subject) = 'subject'
names(data_train_subject) = 'subject'
if (!file.exists('merged_data/')) dir.create('merged_data/',showWarnings = FALSE)
data_2 <- rbind(data_train_2[], data_test_2[])

# y_ files
file_train_3 <- 'train/y_train.txt'
file_test_3  <- 'test/y_test.txt'
data_train_3 <- data.frame(read.csv(file_train_3, header = F, sep = " "))
data_test_3 <- data.frame(read.csv(file_test_3, header = F, sep = " "))
names(data_test_subject) = 'subject'
names(data_train_subject) = 'subject'
if (!file.exists('merged_data/')) dir.create('merged_data/',showWarnings = FALSE)
data_3 <- rbind(data_train_3[], data_test_3[])

