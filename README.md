ds_getdata_course_project
=========================

getting and cleaning data course project for coursera datascience specialization

This project contains a R script run_analysis.R scripted using R version 3.0.3 (2014-03-06) -- "Warm Puppy"

To run this R script the following files are needed in the working directory:
features.txt - names of the 561 original variables
y_test.txt and y_train.txt - activity recorded
X_test.txt and X_train.txt - measurements
subject_test.txt and subject_train.txt - the 1-30 value of the subject doing the recorded activity

Just running this one run_analysis.R completes the entire transformation of getting a mean of 66 measurements by Subject and Activity

The run_analysis.R script will 
	use read.table to load the 6 data files to data.frames with colnames
	use cbind to concatenate the test set of files then the train set of files together
	use rbind to append the test and train files together
	will subset the data.frame to only use the 66 measurements that are of concern for this project (see CodeBook.md)
	hardcoded the number to activity transformation and replaced the Activity variable with those text values
	using melt and cast to transform the measurements into a row of data and then take the mean grouping by Subject and Activity and making the measurements columns again
	writes out the data to a file called Activity_Recognition_Smartphones_coursera_tidy_data.txt
	
From the original README.txt
License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
