## Getting and Cleaning Data Project

### Human Activity Recognition Using Smartphones Dataset -- Version 1.0

Contents
=========

In this repository, you can find the following:

1. The raw data [dataset.zip]
2. The tidy data set [tidy.txt]
3. A code book describing each variable and its values in the tidy data set [CodeBook.md]
4. An R script you can run in order to go from 1 -> 2,3 [run_analysis.R]

Concretely:

### The raw data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

You can download the data here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Alternatively, for your convenience, you can find the same dataset as a dataset.zip file in the repo. You only need to download and uncompress the data in your current working directory before running the script. The code assumes that a "UCI HAR Dataset" folder has been successfully created under your current working directory.

### The tidy data set

The code runs on the following raw data: 

- 'activity_labels.txt': Links the class labels with their activity nam

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

and produces the tidy dataset (for your convenience, the tidy dataset is also stored in the repo). The tidy data is in one single txt file. It contains 68 columns (activity, subject and 66 variables) and 180 rows. These 66 variables represent the average of a subset of variables in the original raw data. This subset has been produced by filtering and selecting only the mean or the standard deviation of the raw signals. See the Codebook.md file for more details.

### The codebook

The codebook describes the measurements in more detail:

1. Information about the variables contained in the tidy data 
2. Information about the summary choices and the trasnformations the software applies 
3. Information about the experimental study design

### The instruction R script

We also provide the run_analysis.R script that processes the raw data as input and produces the tidy data as output. 
The script has been tested on Windows 7 Professional 64-bit with service pack #1, RStudio (version 0.98.501) and R version 3.1.0 (64-bit). As a prerequisite, you need the reshape2 library to be properly installed in your R system.
Finally, the code assumes that the raw data set is kept in a "UCI HAR Dataset" folder under your current working directory.

1. Step 1 - open RStudio, setup the working directory appropriately (see the "raw data" section above), 
2. Step 2 - open and run/source the run_analysis.R script
3. Step 3 - get the output tidy dataset inside the "UCI HAR Dataset" folder



