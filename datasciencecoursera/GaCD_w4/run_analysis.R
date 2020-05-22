#load the required dependencies
require(dplyr) #for data manipulation with select() and mutate()
require(data.table) #for fread(), melt() and dcast()
require(tidyr) #for tidying data with separate()

#create (if needed) a directory to store the result in, change to it
if (!dir.exists("result")) dir.create("result")
setwd("result/")

#download, unpack and remove the .zip, change into the dataset directory
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
unzip("data.zip", overwrite = TRUE); file.remove("data.zip")
setwd("UCI HAR Dataset/")

#load all the data into three lists
traindatalist <- list(data=fread("train/X_train.txt"),
                      subjects=fread("train/subject_train.txt"),
                      activity=fread("train/y_train.txt"))
testdatalist <- list(data=fread("test/X_test.txt"),
                     subjects=fread("test/subject_test.txt"),
                     activity=fread("test/y_test.txt")) 
labelslist <- list(measure=fread("features.txt"),
                   activity=fread("activity_labels.txt"))

#see which numbers of columns correspond to the required measures
reqmeasures <- labelslist$measure[grep("mean[(]|std[(]",labelslist$measure$V2)]

#cbind required columns into whole dataframes, then rbind dataframes 
traindata <- cbind(traindatalist$subjects,
                  traindatalist$activity,
                  select(traindatalist$data, reqmeasures$V1))
testdata <- cbind(testdatalist$subjects,
                   testdatalist$activity,
                   select(testdatalist$data, reqmeasures$V1))
wholedata <- rbind(traindata, testdata)
names(wholedata) <- c("subject", "activity", reqmeasures$V2)

#add the descriptive activity labels
wholedata <- mutate (wholedata, activity=factor(wholedata$activity, 
                            levels=labelslist$activity$V1, 
                            labels = labelslist$activity$V2))

#melt the data so that the variables are in a single column
tidydata <- melt(wholedata, id.vars=c("subject", "activity"))

#separate the combined into three different columns, one for each
tidydata <- separate(tidydata, variable, c("measure","func","coordinate"))

#dcast the data in two columns according to the original value (mean or st.dev) 
#mean is used as the aggregator function
tidydata <- dcast(tidydata, subject+activity+measure+coordinate+func~., 
      fun.aggregate = mean)

#not all the coordinates are available -- set NAs
tidydata$coordinate[tidydata$coordinate==""]<-NA

#rename the columns appropriately
tidydata <- rename(tidydata, avgvalue=.)

#write the output file and return to the original working directory
setwd("..")
write.table(tidydata, "tidy.txt", row.names = FALSE)
setwd("..")
