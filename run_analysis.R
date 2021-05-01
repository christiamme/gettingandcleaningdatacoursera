# Getting and Cleaning Data Project

# Load data
test_activities <- read.table("Original_Dataset/test/y_test.txt")
test_measurements <- read.table("Original_Dataset/test/X_test.txt")
train_activities <- read.table("Original_Dataset/train/y_train.txt")
train_measurements <- read.table("Original_Dataset/train/X_train.txt")
features <- read.table("Original_Dataset/features.txt")
activities <- read.table("Original_Dataset/activity_labels.txt")
test_subjects <- read.table("Original_Dataset/test/subject_test.txt")
train_subjects <- read.table("Original_Dataset/train/subject_train.txt")

# 1. Merge training and test sets
train_set <- cbind(train_activities,train_measurements)
train_set <- cbind(train_subjects,train_set)
test_set <- cbind(test_activities,test_measurements)
test_set <- cbind(test_subjects,test_set)
merged_sets <- rbind(test_set,train_set)

# 2. Extract the measurements on the mean and standard deviation for each measurement
measurement_means <- sapply(merged_sets, mean)
measurement_means <- data.frame(measurement_means)
measurement_sd <- sapply(merged_sets, sd)
measurement_sd <- data.frame(measurement_sd)

# 3. Descriptive activity names for the activities
names(activities) <- list("activity","act_name")
colnames(merged_sets)[1:2] <- c("subject","activity")
merged_activities <- merge(activities,merged_sets,by="activity")

# 4. Label the data with with descriptive variable names
colnames(merged_activities)[4:564] <- as.character(features[,2])

# 5. Tidy data set with the average of each variable for each activity and each subject
agg_by_activity <- aggregate(merged_activities[4:564],list(merged_activities$subject,merged_activities$act_name),mean)
agg_by_activity <- agg_by_activity[order(agg_by_activity$Group.1),]
colnames(agg_by_activity)[1:2] <- c("subject","activity")
write.table(agg_by_activity,"tidy_data.txt", row.name=FALSE)
