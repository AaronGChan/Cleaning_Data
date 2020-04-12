
setwd("UCI HAR Dataset/test")
subject_test = read.table("subject_test.txt", col.names = "Subject")
x_test = read.table("X_test.txt")
y_test = read.table("Y_test.txt", col.names = "Label")

test = cbind(subject_test, x_test)
test = cbind(test,y_test)
setwd('..')
setwd("train")
subject_train = read.table("subject_train.txt", col.names = "Subject")
x_train = read.table("X_train.txt")
y_train = read.table("Y_train.txt", col.names = "Label")
train = cbind(subject_train,x_train)
train = cbind(train, y_train)

data = rbind(test,train)
nrow(x_train)
nrow(x_test)
nrow(data)
setwd('..')
names = read.table("features.txt")
true_names = as.vector(names$V2)
true_names <- c("Subject",true_names)
true_names <- c(true_names, "Label")
colnames(data) <- true_names

check <- grepl("mean|std|Subject|Label", true_names)
means <- true_names[check]
data <- data[,means]
activity = read.table("activity_labels.txt", col.names = c("ID", "Activity"))
data <- merge(activity, data, by.x = "ID", by.y = "Label")
data <- data[,-1]

reformed <- lapply(colnames(data), function(y) gsub("\\(\\)|-|_","",y))
#reformed <- lapply(reformed, function(y) gsub("t","Time",y))
#reformed <- lapply(reformed, function(y) gsub("f","Freq",y))
colnames(data) = reformed

tidy_data <- aggregate(data[,3:81], data[,1:2], mean)
t <- colnames(tidy_data)
for(i in t){
  print(i)
}
  
#setwd('..')
#write.table(tidy_data, "tidy_data.txt", row.names = F)