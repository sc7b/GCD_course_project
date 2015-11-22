---
title: "README for Getting and Cleaning Data class project"
author: "sc7b"
date: "November 21st, 2015"
---
##What this is
This file describes how to convert data from Samsung found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into a tidy data file called "tidy_data.txt"

##Assumptions
It is assumed that you have downloaded and extracted the data from Samsung. Also, it is assumed you will be running the "run_analysis.R" file in the same directory as the extracted data.

##Assumptions about the data
I have assumed that no changes to the data have been made since the "run_analysis.R" file was created. The analysis file has many bits hard coded and is not designed to work on any data other that what was previously in existence in November of 2015.

##Units
All time domain variables (everything not starting with "freq") are in standard gravity units 'g'. The grouped upon factor Subject runs from 1 to 30 and represents a participant with the grouped upon factor Activity has six possible values (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying). The frequency domain variables (those starting with "freq") are in Hz.

##What run_analysis.R does
The run_analysis.R file will read in all the train and test data, and, after processing, output a tidy_data.txt file that contains the mean of each variable, grouped by participant and activity. Participants are numbered 1-30. There are 6 different activities. The result is a data frame containg 180 observations of 81 variables.

run_analysis.R also changes many variable names to make them more human readable. The leading "t" was removed from all the time domain measurements.
The leading "f" signifing frequency domain (FFT) conversion was changed to "Freq".
Parenthesis were removed from variable names
Also, "mean" was changed to "Mean" and "std" to "StdDev".
And finally, "-X", "-Y", and "-Z" were instead changed to "XAxis", "YAxis", and "ZAxis" respectively.

More detail can be found in the Codebook.md file as well as in the comments of the run_analysis.R file.
Also, the README.txt provided with the original dataset may be of use.
