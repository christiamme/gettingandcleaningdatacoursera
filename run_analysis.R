# Getting and Cleaning Data Project

# 1. Merge training and test sets
train_set <- cbind(train_activities,train_measurements)
test_set <- cbind(test_activities,test_measurements)
merged_sets <- rbind(test_set,train_set)

# 4. Label the data with with descriptive variable names
subject_title <- data.frame(list(0,"activity"))
names(subject_title)<- NULL
names(features)<- NULL
titles<-rbind(data.frame(subject_title),data.frame(features))
colnames(merged_sets)<-titles[,2]

# 2. Extract the measurements on the mean and standard deviation for each measurement
measurement_means <- sapply(merged_sets, mean)
measurement_means <- cbind(titles,data.frame(measurement_means))
measurement_sd <- sapply(merged_sets, sd)
measurement_sd <- cbind(titles,data.frame(measurement_sd))

# 3. Descriptive activity names for the activities
names(activities) <- list("activity","act_name")
merged_activities <- merge(activities,merged_sets,by="activity")

# 5. Tidy data set with the average of each variable for each activity and each measurement
agg_by_activity <- aggregate(merged_activities[3:563],list(merged_activities$act_name),mean)
write.table(agg_by_activity,"tidy_data.txt")
