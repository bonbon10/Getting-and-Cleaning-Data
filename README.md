---
title: "README.md" 
output: html_document   
---
## Getting and Cleaning Data: Final Project

**Introduction:**

This project uses data from the UCI Machine Learning Repository on wearable devices. The data include acceleration and velocity measurements for 30 volunteers wearing a smartphone on the waist, while they perform six activities. The goal is to create a tidy dataset that contains the average of each variable for each activity and each subject.  


**The following files are included:**

- README.md: A markdown file that explains how all the scripts work and how they are connected.
- run_analysis.R: The R script containing the code for collecting, processing, and preparing the tidy dataset. This includes detailed comments that explains what the code is intended to do. 
- Codebook.md: A codebook that describes the variables, the data, and any data cleaning performed. 
- tidy_data.txt: The final output as a tidy dataset that includes the mean for each variable for each activity and each subject. The data are in wide format, with 180 rows representing 30 subjects and 6 activities. 
    

**Notes:**

- The script starts with the assumption that the Samsung data are available in the working directory in an unzipped UCI HAR Dataset folder.

