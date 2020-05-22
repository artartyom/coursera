# Getting and Cleaning Data -- Week 4 Assignment

## Description

The provided script performs the merging and tidying of the data collected from the accelerometers of the Samsung Galaxy S smartphone users. After running the script, the user is presented with the 'result' subdirectory containing the tidy dataset and the unpacked original data set.

## Files

Apart from this README.md file, the repository contains the following files:

- run_analysis.R - the R script used for the analysis
- CodeBook.md - the codebook describing the modified variables
- result - the directory containing the result of the work of the script

## Dependencies

The script depends on the following packages:

- dplyr
- tidyr
- data.table

## How it works

The script is supplied with comments which should explain what each section does. Here is the general outline of how it works.

### Preparation

The data are downloaded and extracted into the target directory (created if needed). All the data are then loaded into three lists: **traindatalist**, **testdatalist** and **labelslist**. The **traindataset** and **testdatalist** are similar in structure and contain the following objects:

- **data** - a data.table containing the measures (corresponds to the 'X\_train.txt' and 'X\_test.txt')
- **subjects** - a data.table containing the row-wise list of subject IDs (corresponds to the 'subject\_train.txt' and 'subject\_test.txt')
- **activity** - a data.table containing the row-wise list of activities performed (corresponds to the 'Y\_train.txt' and 'Y\_test.txt')

The **labelsdatalist** list contains the key-value pairs needed to assign the labels:

- **measure** - a data.table containing the column number-measure type pairs for the **data** data.table.
- **activity** - a data.table containing the code-activity pairs for the **activity** data.table.

### Transforming data

The key-value pairs for the required measures (mean and SD) are extracted from the **measure** dataframe of the **labelsdatalist** using a regular expression grep and stored in the **reqmeasures** dataframe. The proper training and test datasets are formed using cbind of the components of the corresponding lists; then the two datasets are merged using rbind. This is appropriate since we know that there are no duplicate entries. The proper names of the columns are set using the **reqmeasures** dataframe, and the proper names of activities are set using the **labelsdatalist$activity** data as a factor.

### Tidying data

Most of the column names are actually variables, so the data are melted to fix that. Since the single column name contained info on several variables (measure, type of function applied, coordinate), separate is used to make three distinct columns. Dcast is then used to calculate mean values of measured mean and SD across every combination of subject, activity, measure, coordinate and function.
Not all observations have a coordinate value, so NAs are placed where appropriate. The column containing valies is renamed to better indicate its content.

### Saving data

The directory is changed to 'result', where the file is saved in accordance to the task requirements. The directory is then changed once again, to the one where the script was started.
