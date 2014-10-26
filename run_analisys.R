# The main feautres of this code should be:
# - Merges the training and the test sets to create one data set.
# - Extracts only the measurements on the mean and standard deviation for each measurement. 
# - Uses descriptive activity names to name the activities in the data set
# - Appropriately labels the data set with descriptive variable names. 
# - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#setwd('Documents/github/Getting-and-Cleaning-Data-Course-Project')
setwd('UCI HAR Dataset/')

### Merging the training and testing data into a one data set called 'merged'
list_file_names <- c('subject','X','y')
for (file in list_file_names){
  file_train <- paste('train/', file, '_train.txt', sep = "")
  file_test  <- paste('test/', file, '_test.txt', sep = "")
  data_train <- read.csv(file_train, header = F, sep = "")
  data_test <- read.csv(file_test, header = F, sep = "")
  merged_data <- rbind(data_train,data_test)
  dirname <- 'merged_data/'
  if (!file.exists(dirname)) dir.create(dirname,showWarnings = FALSE)
  write.table(row.names = F, col.names = F, merged_data, file = paste(dirname, file, '_merged.txt', sep = ""), sep = " ", qmethod = "double")
}

list_file_names <- c('body_acc_x','body_acc_y','body_acc_z','body_gyro_x','body_gyro_y','body_gyro_z','total_acc_x','total_acc_y','total_acc_z')
for (file in list_file_names){
  file_train <- paste('train/Inertial Signals/', file, '_train.txt', sep = "")
  file_test  <- paste('test/Inertial Signals/', file, '_test.txt', sep = "")
  data_train <- read.csv(file_train, header = F, sep = "")
  data_test <- read.csv(file_test, header = F, sep = "")
  merged_data <- rbind(data_train,data_test)
  dirname <- 'merged_data/Inertial Signals/'
  if (!file.exists(dirname)) dir.create(dirname,showWarnings = FALSE)
  write.table(row.names = F, col.names = F, merged_data, file = paste(dirname, file, '_merged.txt', sep = ""), sep = " ", qmethod = "double")
}


### Adding column names (features)
dirname <- 'merged_data/'
file <- 'X'
file <- paste(dirname, file, '_merged.txt', sep = "")
data <- read.csv(file, header = F, sep = "")
file_features <- 'features.txt'
data_names <- read.csv(file_features, header = F, sep = "")
names(data) <- data_names[,2]

### Creating activities description data frame
file_activities <- 'activity_labels.txt'
activities_names <- read.csv(file_activities, header = F, sep = "")
dirname <- 'merged_data/'
file <- 'y'
file <- paste(dirname, file, '_merged.txt', sep = "")
data_activities <- read.csv(file, header = F, sep = "")
data_activities <- data.frame(factor(data_activities[,1],levels = activities_names[,1], labels =  activities_names[,2]))
names(data_activities) <- c('activityName')

### Creating subject data frame
dirname <- 'merged_data/'
file <- 'subject'
file <- paste(dirname, file, '_merged.txt', sep = "")
data_subject <- read.csv(file, header = F, sep = "")
names(data_subject) <- c('subject')

#### Extracting the measurements on the mean 'mean()' and standard deviation 'std()' for each measurement. 
index <- 1
index_list <- numeric(0)
for (i in data_names[,2]) {
  name <- unlist(strsplit(as.character(i),'-'))
  if (length(name) >= 2) {
    if (name[2] == 'mean()' || name[2] == 'std()') {
      index_list <- append(index_list,index)
    }  
  }
  index <- index + 1
}
data_new <- data[,index_list]


### Creating the new data set and saving the data set into a file
data_new <- cbind(data_subject,data_activities,data_new)
filename <- 'new_data_set.txt'
write.table(row.names = F, col.names = T, data_new, file = filename, sep = " ", qmethod = "double")


