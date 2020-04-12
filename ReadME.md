---
title: "UCI HAR Dataset Cleaned"
author: "Aaron Chan"
date: "4/12/2020"
output: html_document
---

## Problem Statement 

Data for the UCI Human Activity Using Smart Phone Data Set was split up and disorganized. Students were tasked with combining the training and testing data, relabel the column names, and aggregate the results.    


## Process 
Read in files -> merge training/test -> clean data -> aggregate the data    

## Files in Repository 
UCI HAR Dataset -> where the original data was found   
tidy_data.txt -> aggregated data by activity and subject   
run_analysis.R -> R script used to clean and aggreagate data, when ran will output the tidy_data.txt 
CodeBook.md -> Markdown that will list all the variables and explain the meaning of them 

##R Script 
The script will read in files from the UCI HAR Dataset folder.  
We combine for test/train the the y variables and the subject labels.   
After that we join the two datasets.    
We then only select measurments that contain mean or standard deviation.   
We join on y labels with the activity labels.   
After that, we group by activity and subject id and find the mean for each variable. 

##Conclusion
The result is a cleaned dataset that is labeled as "data" in the Rscript and an aggregated tidy dataset labeled "tidy_data" in the Rscript. 