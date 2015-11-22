---
title: "Codebook for Getting and Cleaning Data class project"
author: "sc7b"
date: "November 20th, 2015"
output: "tidy_data.txt"
---

## Project Description
This course project involved tidying a set of data from Samsung

##Study design and data processing
The study design is well laid out in their README.txt. 30 people wore Samsung smartphones while perorming 6 specific activities.
Data was collected from the phone's sensors. Noise filters and low pass filters were applied to this data.

###Collection of the raw data
The data was collected 50 times per second from the smartphones accelerometer and gyroscope. This data was 3-dimensional.

###Notes on the original (raw) data 
For more detailed information about the data collection process as well as the data preprocessing, see the README.txt included with the dat

##Creating the tidy datafile
After downloading and unzipping the Samsung data files, the train and test data were read into R. Features.txt was also read in as it contains
essential information about the variables that were collected. Next, several dplyr functions were used to combine and clean the data into one
data frame. Many extraneous variables were omitted. Activity and Subject factors were added to the dataset. Later the data was summarized by
grouping over Activity and Subject and then taking the mean of each associated column.


###Guide to create the tidy data file
To create the tidy data file, first download the associated data files, then run "run_analysis.R" from the data directory. A file called
tidy_data.txt will be written to that directory and a dataframe called dfMeanStd will exist in memory

###Cleaning of the data
For a more detailed description of the data cleaning process see either the README.md file or the comments in the run_analysis.R file

##Description of the variables in the tidy_data.txt file
The tidy_data.txt file that run_analysis.R creates contains a data frame that contains 180 observations of 81 variables.
This data represents means of each variable collected in the samsung data, broken down by participant and activity.
There are 30 participants and 6 activities and this 30*6=180 observations.
For a complete description of all the variables in the data, please see the features_info.txt provided with the original data.
Variable names were changed in many ways. -X, -Y, and -Z were instead changed to XAxis, YAxis, and ZAxis respectively.
Also the leading "t" was removed from all the time domain measurements.
The leading "f" signifing frequency domain (FFT) conversion was changed to "Freq".
Parenthesis were removed from variable names
Also, "mean" was changed to "Mean" and "std" to "StdDev".

A complete list of variables is provided below

 [1] "Subject"                      "Activity"                    
 [3] "BodyAccMeanXAxis"             "BodyAccMeanYAxis"            
 [5] "BodyAccMeanZAxis"             "GravityAccMeanXAxis"         
 [7] "GravityAccMeanYAxis"          "GravityAccMeanZAxis"         
 [9] "BodyAccJerkMeanXAxis"         "BodyAccJerkMeanYAxis"        
[11] "BodyAccJerkMeanZAxis"         "BodyGyroMeanXAxis"           
[13] "BodyGyroMeanYAxis"            "BodyGyroMeanZAxis"           
[15] "BodyGyroJerkMeanXAxis"        "BodyGyroJerkMeanYAxis"       
[17] "BodyGyroJerkMeanZAxis"        "BodyAccMagMean"              
[19] "GravityAccMagMean"            "BodyAccJerkMagMean"          
[21] "BodyGyroMagMean"              "BodyGyroJerkMagMean"         
[23] "freqBodyAccMeanXAxis"         "freqBodyAccMeanYAxis"        
[25] "freqBodyAccMeanZAxis"         "freqBodyAccMeanFreqXAxis"    
[27] "freqBodyAccMeanFreqYAxis"     "freqBodyAccMeanFreqZAxis"    
[29] "freqBodyAccJerkMeanXAxis"     "freqBodyAccJerkMeanYAxis"    
[31] "freqBodyAccJerkMeanZAxis"     "freqBodyAccJerkMeanFreqXAxis"
[33] "freqBodyAccJerkMeanFreqYAxis" "freqBodyAccJerkMeanFreqZAxis"
[35] "freqBodyGyroMeanXAxis"        "freqBodyGyroMeanYAxis"       
[37] "freqBodyGyroMeanZAxis"        "freqBodyGyroMeanFreqXAxis"   
[39] "freqBodyGyroMeanFreqYAxis"    "freqBodyGyroMeanFreqZAxis"   
[41] "freqBodyAccMagMean"           "freqBodyAccMagMeanFreq"      
[43] "freqBodyAccJerkMagMean"       "freqBodyAccJerkMagMeanFreq"  
[45] "freqBodyGyroMagMean"          "freqBodyGyroMagMeanFreq"     
[47] "freqBodyGyroJerkMagMean"      "freqBodyGyroJerkMagMeanFreq" 
[49] "BodyAccStdDevXAxis"           "BodyAccStdDevYAxis"          
[51] "BodyAccStdDevZAxis"           "GravityAccStdDevXAxis"       
[53] "GravityAccStdDevYAxis"        "GravityAccStdDevZAxis"       
[55] "BodyAccJerkStdDevXAxis"       "BodyAccJerkStdDevYAxis"      
[57] "BodyAccJerkStdDevZAxis"       "BodyGyroStdDevXAxis"         
[59] "BodyGyroStdDevYAxis"          "BodyGyroStdDevZAxis"         
[61] "BodyGyroJerkStdDevXAxis"      "BodyGyroJerkStdDevYAxis"     
[63] "BodyGyroJerkStdDevZAxis"      "BodyAccMagStdDev"            
[65] "GravityAccMagStdDev"          "BodyAccJerkMagStdDev"        
[67] "BodyGyroMagStdDev"            "BodyGyroJerkMagStdDev"       
[69] "freqBodyAccStdDevXAxis"       "freqBodyAccStdDevYAxis"      
[71] "freqBodyAccStdDevZAxis"       "freqBodyAccJerkStdDevXAxis"  
[73] "freqBodyAccJerkStdDevYAxis"   "freqBodyAccJerkStdDevZAxis"  
[75] "freqBodyGyroStdDevXAxis"      "freqBodyGyroStdDevYAxis"     
[77] "freqBodyGyroStdDevZAxis"      "freqBodyAccMagStdDev"        
[79] "freqBodyAccJerkMagStdDev"     "freqBodyGyroMagStdDev"       
[81] "freqBodyGyroJerkMagStdDev"   