# Assumes data are in working directory  

################################# 1: MERGING ################################
# Read in training data and test data
train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")

# Read in the files that identify the subject for each row in the training and test data
train.sub <- read.table("train/subject_train.txt")
test.sub <- read.table("test/subject_test.txt")

# Read in the files with the activity labels 
train.act <- read.table("train/Y_train.txt")
test.act <- read.table("test/Y_test.txt")

# Rename the variable name for subject and activity
names(train.sub) <- "subject"
names(test.sub) <- "subject"
names(train.act) <- "activity"
names(test.act) <- "activity"

# Merge the data, subject, and activity info - training data have 7352 records and test data have 2947 records
train.dat <- cbind(train.sub,train,train.act)
test.dat <- cbind(test.sub,test,test.act)

# List of subjects and how many observations they have
table(train.dat$subject)
table(test.dat$subject)

# Combine training and test data
dat <- rbind(train.dat,test.dat)

#################### 4: LABEL VARIABLES WITH DESCRIPTIVE NAMES #################

# Read in file with variable names for each column
var.names <- read.table("features.txt")

# Add a V to the number so it can be matched with the data columns
var.names$var.num <- paste("V",var.names[,1], sep="")
var.names[1:10,]

# Rename variable names in dataset
for (i in 1:nrow(var.names)){ 
    for (j in 1:length(names(dat))){ 
        if (var.names$var.num[i] == names(dat)[j]){
            names(dat)[j] <- as.character(var.names$V2[i])
        }
    }
}
head(names(dat))

############ 2: KEEP ONLY MEAN AND STANDARD DEVIATION MEASUREMENTS #############

# Note: need two \\ to indicate parentheses, and we want the subject id and activity kept 
# Get column number of subject and activity
sub.act.index <- which(colnames(dat) %in% c("subject","activity"))

subdat <- dat[,c(grep("mean(\\(\\))|std(\\(\\))",names(dat)),sub.act.index)]
names(subdat)

############################### 3: NAME ACTIVITIES ##############################

act <- read.table("activity_labels.txt")

subdat$act.label <- NULL

for (i in 1:nrow(subdat)){
    for (j in 1:nrow(act)){ 
        if (subdat[i,"activity"]==act[j,"V1"]){
            subdat[i,"act.label"] <- act[j,"V2"]
        }
    }
}
        
table(subdat$activity,subdat$act.label)

# Reorder column names 
subdat <- subdat[,c(67:69,1:66)]
names(subdat)

################################# 5: TIDY DATASET #################################

# Get the mean of each variable for each activity and each subject
tidy <- aggregate(subdat[,4:69], list(subdat$subject, subdat$act.label), mean)

names(tidy)[1] <- "Subject"
names(tidy)[2] <- "Activity"

# Add avg to the beginning of each variable name
for (i in 3:68){
    names(tidy)[i] <- paste("avg_",names(tidy)[i],sep="")
}
head(tidy)

# Output dataset as txt file
# Path deleted for privacy reasons
setwd("")
write.table(tidy, file="tidy_data.txt",row.name=FALSE)





