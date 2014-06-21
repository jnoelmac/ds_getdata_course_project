run_analysis <- {
  
  # 1.  Merges the training and the test sets to create one data set.
  # load the 6 individual data files, the 561 measurements, the activity and the subject doing the activity
 df_features <- read.table ("features.txt")
 df_x_test <- read.table ("X_test.txt",col.names=df_features[,2])
 df_y_test <- read.table ("y_test.txt",col.names="Activity")
 df_subject_test <- read.table("subject_test.txt",col.names="Subject")
 df_test <- cbind(df_x_test,df_subject_test,df_y_test)
 
 df_x_train <- read.table ("X_train.txt",col.names=df_features[,2])
 df_y_train <- read.table ("y_train.txt",col.names="Activity")
 df_subject_train <- read.table("subject_train.txt",col.names="Subject")
 df_train <- cbind( df_x_train,df_subject_train, df_y_train)
 
 # merge the test and train data sets
 df1 <- rbind(df_test,df_train)

 # 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 # subset dataset to only the subject, activity and 66 mean() and std() variables
 df2 <- df1[,c(562,563,1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)]
 
 # 3. Uses descriptive activity names to name the activities in the data set. 
 # Replace activity number with name
 df2$Activity[which(df2$Activity=="1")]<-"WALKING"
 df2$Activity[which(df2$Activity=="2")]<-"WALKING_UPSTAIRS"
 df2$Activity[which(df2$Activity=="3")]<-"WALKING_DOWNSTAIRS"
 df2$Activity[which(df2$Activity=="4")]<-"SITTING"
 df2$Activity[which(df2$Activity=="5")]<-"STANDING"
 df2$Activity[which(df2$Activity=="6")]<-"LAYING"
 
 # 4. Appropriately labels the data set with descriptive variable names. 
 # clean up the column names to replace non-alpanumeric with underscore (_)
 names(df2) <- gsub("__","",gsub("[[:punct:]]","_",colnames(df2)))
 
 # 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 # calculate the mean of all the measurements groups by Subject and Activity
 df3 <- melt(df2, id=(c("Subject", "Activity")))
 df3 <- cast(df3, Subject+Activity~variable, mean)
 
 # Write the data to a file
 write.table(df3,file="Activity_Recognition_Smartphones_coursera_tidy_data.txt", quote=FALSE,row.names=FALSE)
}