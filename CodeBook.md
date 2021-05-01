# Code Book for Getting and Cleaning Data Project

# Variables
* activities: Labels for each of the 6 activities (coded 1 through 6)
* features: Names for each of the 561 measurements in each observation
* measurement_means: Means for every measurement
* measurement_sd: Standard deviation for every measurement
* test_activities: IDs for the subject in each observation of the test set (1 through 6)
* test_measurements: 561 measurements per observation in the test set
* train_activities: IDs for each subject in each observation in the train set (1 through 6)
* train_measurements: 561 measurements per observation in the train set

# Data
## Loading the datasets
The datasets should be loaded with something similar to the following. Modify according to your current working directory or express a complete filepath.
´´´
test_activities <- read.table("%path-to-folder%/Original_Dataset/test/y_test.txt")
test_measurements <- read.table("%path-to-folder%/Original_Dataset/test/X_test.txt")
train_activities <- read.table("%path-to-folder%/Original_Dataset/test/y_train.txt")
train_measurements <- read.table("%path-to-folder%/Original_Dataset/test/X_train.txt")
features <- read.table("%path-to-folder%/Original_Dataset/features.txt")
activities <- read.table("%path-to-folder%/Original_Dataset/activity_labels.txt")
test_subjects <- read.table("%path-to-folder%/Original_Dataset/test/subject_test.txt")
train_subjects <- read.table("%path-to-folder%/Original_Dataset/train/subject_train.txt")
´´´

# Transformations
## Merging the sets
For both sets, activities and measurements were merged with cbind. The two resulting sets were merged with rbind.
## Assigning Names to Columns
The merged set was given column names from the features.
## Merging activity names
With merge, names of the activites were merged with their corresponding numeric label.
## Average by activity
Measurement data was grouped and means calculated using the aggregate function.
