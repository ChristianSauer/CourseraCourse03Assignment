## Readme for the Tidy\_UCI\_HAR_Dataset.txt ##
This file was generated for the Coursera "Getting and Cleaning Data" Course, see: [https://class.coursera.org/getdata-004](https://class.coursera.org/getdata-004).

It contains data for the recognition of human activities through the sensors of Smartphones.


###Data###
The data are taken from the *Human Activity Recognition Using Smartphones Data Set* provided by the UCI machine learning repository, see [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Various transformations and other activities where performed to create a tidier dataset. The exact nature of the transformations are described in the codebook.

###Codebook###
The codebook can be found in this repository.

###How to create the tidy dataset###

To (re)create the tidy dataset, please run the run_analysis.R file from this repository. It will perform the following steps:

1.  Creating a data directory in the current working directory (Note: if you want to download the data in a specific folder, please uncomment the setwd() function at the top of the file and enter the desired path)
2.  Downloading the data from the Coursera downloading link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3.  Loading and merging the testing and training datasets.
4. Combining the Subject, X and Y files into one dataframe
5. Assigning the column names as specified in features.txt
6. Assigning the 6 factors (Walking etc.) to the activity column.
7. Dropping all columns who have not "std()" or "mean ()" in their names, except Subject and Activity. Resulting in 68 columns.
8. Aggregating the data by Subject and Activity, using the mean for the averaging of the other columns.
9.  Tidying the column names, e.g. dropping "()" and changing "-" to "\_". To further the readabillity, the camel case is retained. Also, the "_" are kept. I did not change the columns further, because I am unfamiliar with the domain and did not want to make changes which whould be illogical to researchers.
10.  Writing the tidy dataset to the working directory with the name Tidy_UCI_HAR_Dataset.txt.

##Acknowledgments##

1. The script needs an internet connection.
2. If you do not want to download the file, please delete the lines 162 - 166. But then the working directory must contain a \data folder with the  original unzipped UCI dataset (should look like: "working directory\data\UCI HAR Dataset".
3. No additional libraries are required.
4. You can read in the tidy dataset read.table().
5. The script itself is extensively documented, please take a look.
6. If you are working on a weak PC like me, uncomment the rm() lines in the script. Intermediate variables will then be deleted, to improve the performance.