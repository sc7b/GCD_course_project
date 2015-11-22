## sc7b class project for Getting and Cleaning Data #34
## November 20th, 2015

## web source for the data
projectDataURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

##hardcoded relative paths for all the files

subject_test<-"gcd_project_data\\UCI HAR Dataset\\test\\subject_test.txt"
X_test<-"gcd_project_data\\UCI HAR Dataset\\test\\X_test.txt"
y_test<-"gcd_project_data\\UCI HAR Dataset\\test\\y_test.txt"

subject_train<-"gcd_project_data\\UCI HAR Dataset\\train\\subject_train.txt"
X_train<-"gcd_project_data\\UCI HAR Dataset\\train\\X_train.txt"
y_train<-"gcd_project_data\\UCI HAR Dataset\\train\\y_train.txt"

dataFeatures<-"gcd_project_data\\UCI HAR Dataset\\features.txt"

mcn<-read.table(dataFeatures)

sTest<-read.table(subject_test)
sTrain<-read.table(subject_train)
XTest<-read.table(X_test)
XTrain<-read.table(X_train)
yTest<-read.table(y_test)
yTrain<-read.table(y_train)



## step 1 is to merge the test and training datasets
## we'll want to use some dplyr verbs for this so ...
library(dplyr)

## we'll start with rbind
XTotal<-rbind(XTest, XTrain)
## now, after doing some experiments on the data, I found some duplicate
## entries for some of the columns. These are all the bandsEnergy columns
## I'm going to get rid of them before moving on
## they are rows 303-344, 382:423, and 461:502
## we also get rid of the angle measures that are 555:561
XTotal<-select(XTotal, 1:302,345:381,424:460,503:554)
## now we have to pull those out of the features.txt file
## these are each in separate rows so can't use "select"
myColNames<-mcn[c(1:302, 345:381, 424:460, 503:554),]

## step 4 is to change some of our column names to a more
## human readable naming convention. Doing that first!
## I'm going to use "sub" and some regexp stuff to clean things a bit

mcn<-sub("^t","", myColNames[,2],)   ## gets rid of the t for time bit
mcn<-sub("^f","freq",mcn,)           ## replaces f to say freq
mcn<-sub("BodyBody", "Body", mcn,)   ## some say BodyBody for some reason
mcn<-sub("-mean", "Mean", mcn,)
mcn<-sub("-std", "StdDev", mcn,)
mcn<-sub("-X","XAxis", mcn,)
mcn<-sub("-Y","YAxis", mcn,)
mcn<-sub("-Z","ZAxis", mcn,)
mcn<-sub("\\(\\)","", mcn,)

## and now assign the features.txt names to the X columns
colnames(XTotal)<-mcn

##back to step 1...
## the y files contain #s thate correspond to an activity
yTotal<-rbind(yTest, yTrain)
## step 3 uses descriptive activity names instead of the #s found in y
## the activity_labels file has this info
## I'm just going to loop over all the rows

for(lcv in 1:nrow(yTotal)) {
      
      if(yTotal[lcv,1]==1) yTotal[lcv,1]<-"Walking"
      else if(yTotal[lcv,1]==2) yTotal[lcv,1]<-"Walking Upstairs"
      else if(yTotal[lcv,1]==3) yTotal[lcv,1]<-"Walking Downstairs"
      else if(yTotal[lcv,1]==4) yTotal[lcv,1]<-"Sitting"
      else if(yTotal[lcv,1]==5) yTotal[lcv,1]<-"Standing"
      else if(yTotal[lcv,1]==6) yTotal[lcv,1]<-"Laying"
}

## back to step 1 again :P
## the subject files tell you who performed each observation
sTotal<-rbind(sTest, sTrain)

df<-cbind(yTotal, XTotal)
names(df)[1]<-"Activity"
df<-cbind(sTotal, df)
names(df)[1]<-"Subject"


## now we'll get rid of our old data
rm("XTest")
rm("XTrain")
rm("XTotal")
rm("yTest")
rm("yTrain")
rm("yTotal")
rm("sTest")
rm("sTrain")
rm("sTotal")

## step 2 extracts only measurements on mean and std dev for each measurement
## plus the first two columns, SUbject and Activity
dfMeanStd<-select(df, 1,2,contains("Mean"), contains("StdDev"))


## step 5 is going to use some fancy dplyr stuff to group all the data
## and then apply a function over all the groups
dfTable<-group_by(dfMeanStd, Subject, Activity) %>% 
summarise_each(funs(mean), -Subject, -Activity)

##and now write it to a file
write.table(dfTable, "./tidy_data.txt", row.name=FALSE)


