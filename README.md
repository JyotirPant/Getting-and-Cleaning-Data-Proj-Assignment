# Getting-and-Cleaning-Data-Proj-Assignment

### Storing Data into Variables

 x_train variable reads data from Train Data Set
 
 y_train variable reads data about the activities in train data set.
 
 x_test variable reads data from Test Data Set
 
 y_test variable reads data about the activities in test data set.
 
 subTest variable reads data about the subjects in test data set.
 
 subTrain variable reads data about the subjects in train data set
 
 ### Merging Table
  Merged_Tab stores merged table.
  
  Features files is used to get names of the measurements.
  
  These names were used as column names for Merged_Tab.
  
 ### Extracting relevant Informantion 
 
  Only those columns were extracted whose names had "mean()" or "std()".
 
  Descriptive names were provided to the Activities from activities_labels.txt file.
  
  This table was stored into Data_Tab.
  
 ### Averaging
  The extracted data was used to calculate column means by grouping by 'Subjects' Column and 'Activities' Column.
  
  This data was stored in 'Result' table.  
 
 
 
 
 
