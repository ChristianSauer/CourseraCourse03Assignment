## Codebook for the Tidy\_UCI\_HAR_Dataset.txt ##
This file was generated for the Coursera "Getting and Cleaning Data" Course, see: [https://class.coursera.org/getdata-004](https://class.coursera.org/getdata-004).

###Data###
The data are taken from the *Human Activity Recognition Using Smartphones Data Set* provided by the UCI machine learning repository, see [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

###Transformations###
The following transformations where applied to the original data set:

1. The training and test data where merged into one dataset.
2. All information concerning Inertial Signals where discarded.
3. The information from the Subject / X and Y files where combined into one dataset.
4. The activity variable was saved as a factor, so that the activities can be readily seen in the dataset (see variable information below).
5. Variables which did not contain information about Subject, Activity, mean or standard deviation where discarded - resulting in 68 variables total.
6. The data where grouped by activity and subject, using the average on the other variables. Therefore, the resulting dataset contains a row for each subject and for each activity (1 subject takes 6 rows due to the 6 possible activities).
7. The variable names where simplefied, e. g. removing "()" and replacing "-" with "_". I choose to retain the Camelcase because lowercase variables of such length would be nearly unreadable. 
8. I choose to retain the old variable schema. It would have been possible to reduce the number of variables while increasing the number of rows, e. g. moving the f* and t* variables into one variable and adding a "domain" indicator variable, but I have not enough knowledge of this scientific field to know if that would be useful.

##How to create this dataset###
Please run the run_analysis.r file. It should download the UCI data into your working directory and take all necessary steps to create the tidy dataset. 

###List of variables###
Notes: 

- no missing values are present in the dataset.
- All variables except Subject and Activity where normalized and bounded to -1,+1.
- All variables except Subject and Activity are averages, see Transformations Nr. 6
- All variables prefixed with t are time-domain signals, recorded at 50 Hz. The original authors also performed filtering on these variables.
- All variables prefixed with f are denoting frequency domain signals, which where created using a fast fourier transformations by the original authors.


----------
Please note that the variables 3 -42  are time variables, not frequency variables.
 
1. Subject : The person which performed the activity. 30 persons are in the dataset.
2. Activity: The performed activity. 6 Activities where performed: 
	- WALKING
	- WALKING_UPSTAIRS
	- WALKING_DOWNSTAIRS
	- SITTING
	- STANDING
	- LAYING
1. tBodyAcc_mean_X: Average mean Acceleration of the body in the X Dimension.
1. tBodyAcc_mean_Y: Average mean Acceleration of the body in the X Dimension.
1. tBodyAcc_mean_Z: Average mean Acceleration of the body in the Z Dimension.
1. tBodyAcc_std_X: Average standard deviation of the Acceleration of the body in the X Dimension.
1. tBodyAcc_std_Y: Average standard deviation of the Acceleration of the body in the Y Dimension.
1. tBodyAcc_std_Z: Average standard deviation of the Acceleration of the body in the Z Dimension.
1. tGravityAcc_mean_X: Average mean g-force in the X Dimension.
1. tGravityAcc_mean_Y: Average mean g-force in the Y Dimension.
1. tGravityAcc_mean_Z: Average mean g-force in the Z Dimension.
1. tGravityAcc_std_X: Average standard deviation of the g-force in the X Dimension.
1. tGravityAcc_std_Y: Average standard deviation of the g-force in the Y Dimension.
1. tGravityAcc_std_Z: Average standard deviation of the g-force in the Z Dimension.
1. tBodyAccJerk_mean_X: Average mean acceleration during jerks in the X Dimension.
1. tBodyAccJerk_mean_Y: Average mean acceleration during jerks in the Y Dimension.
1. tBodyAccJerk_mean_Z: Average mean acceleration during jerks in the Z Dimension.
1. tBodyAccJerk_std_X: Average standard deviation of the acceleration during jerks in the X Dimension.
1. tBodyAccJerk_std_Y: Average standard deviation of the acceleration during jerks in the Y Dimension.
1. tBodyAccJerk_std_Z: Average standard deviation of the acceleration during jerks in the Z Dimension.
1. tBodyGyro_mean_X: Average mean of the gyroscope movement in the X Dimension.
1. tBodyGyro_mean_Y: Average mean of the gyroscope movement in the Y Dimension.
1. tBodyGyro_mean_Z: Average mean of the gyroscope movement in the Z Dimension.
1. tBodyGyro_std_X: Average standard deviation of the gyroscope movement in the X Dimension.
1. tBodyGyro_std_Y: Average standard deviation of the gyroscope movement in the Y Dimension.
1. tBodyGyro_std_Z: Average standard deviation of the gyroscope movement in the Z Dimension.
1. tBodyGyroJerk_mean_X: Average mean of the gyroscope movement in the X Dimension during jerks.
1. tBodyGyroJerk_mean_Y: Average mean of the gyroscope movement in the Y Dimension during jerks.
1. tBodyGyroJerk_mean_Z: Average mean of the gyroscope movement in the Z Dimension during jerks.
1. tBodyGyroJerk_std_X: Average standard deviation of the gyroscope movement in the X Dimension during jerks.
1. tBodyGyroJerk_std_Y: Average standard deviation of the gyroscope movement in the Y Dimension during jerks.
1. tBodyGyroJerk_std_Z: Average standard deviation of the gyroscope movement in the Z Dimension during jerks.
1. tBodyAccMag_mean: The average mean of the magnitude of the acceleration.
1. tBodyAccMag_std: The average standard deviation of the magnitude of the acceleration.
1. tGravityAccMag_mean: The average mean of the magnitude of the acceleration due to g-force.
1. tGravityAccMag_std: The average standard deviation of the magnitude of the acceleration due to g-force.
1. tBodyAccJerkMag_mean: The average mean of the magnitude of the acceleration due to jerks.
1. tBodyAccJerkMag_std: The average standard deviation of the magnitude of the acceleration due to jerks.
1. tBodyGyroMag_mean: The average mean of the magnitude of the gyroscope.
1. tBodyGyroMag_std: The average standard deviation of the magnitude of the gyroscope.
1. tBodyGyroJerkMag_mean: The average standard deviation of the magnitude of the gyroscope during jerks.
1. tBodyGyroJerkMag_std: The average mean of the magnitude of the gyroscope during jerks.

----------
This should be the variables 43 - 68, due to limitations of markdown, the enumeration starts at 1.
Please note that this are frequency variables, not time variables.

43. fBodyAcc_mean_X: Average mean Acceleration of the body in the X Dimension.
44. fBodyAcc_mean_Y: Average mean Acceleration of the body in the X Dimension.
1. fBodyAcc_mean_Z: Average mean Acceleration of the body in the Z Dimension.
1. fBodyAcc_std_X: Average standard deviation of the Acceleration of the body in the X Dimension.
1. fBodyAcc_std_Y: Average standard deviation of the Acceleration of the body in the Y Dimension.
1. fBodyAcc_std_Z: Average standard deviation of the Acceleration of the body in the Z Dimension.
1. fBodyAccJerk_mean_X: Average mean acceleration during jerks in the X Dimension.
1. fBodyAccJerk_mean_Y: Average mean acceleration during jerks in the Y Dimension.
1. fBodyAccJerk_mean_Z: Average mean acceleration during jerks in the Z Dimension.
1. fBodyAccJerk_std_X: Average standard deviation acceleration during jerks in the X Dimension.
1. fBodyAccJerk_std_Y: Average standard deviation acceleration during jerks in the Y Dimension.
1. fBodyAccJerk_std_Z: Average standard deviation acceleration during jerks in the Z Dimension.
1. fBodyGyro_mean_X: Average mean of the gyroscope movement in the X Dimension.
1. fBodyGyro_mean_Y: Average mean of the gyroscope movement in the Y Dimension.
1. fBodyGyro_mean_Z: Average mean of the gyroscope movement in the Z Dimension.
1. fBodyGyro_std_X: Average standard deviation of the gyroscope movement in the X Dimension.
1. fBodyGyro_std_Y: Average standard deviation of the gyroscope movement in the Y Dimension.
1. fBodyGyro_std_Z: Average standard deviation of the gyroscope movement in the Z Dimension.
1. fBodyAccMag_mean: The average mean of the magnitude of the acceleration.
1. fBodyAccMag_std: The average standard deviation of the magnitude of the acceleration.
1. fBodyBodyAccJerkMag_mean: The average mean of the magnitude of the acceleration due to jerks.
1. fBodyBodyAccJerkMag_std: The average standard deviation of the magnitude of the acceleration due to jerks.
1. fBodyBodyGyroMag_mean: The average mean of the magnitude of the gyroscope.
1. fBodyBodyGyroMag_std: The average standard deviation of the magnitude of the gyroscope.
1. fBodyBodyGyroJerkMag_mean: The average standard deviation of the magnitude of the gyroscope during jerks.
1. fBodyBodyGyroJerkMag_std: The average mean of the magnitude of the gyroscope during jerks.