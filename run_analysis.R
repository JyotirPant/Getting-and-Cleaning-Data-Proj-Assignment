library(dplyr)
library(readr)
library(tibble)
library(data.table)
library(tidyr)

x_train<-read.table(paste(getwd(),"/UCI HAR Dataset/train/X_train.txt",sep = ""))
y_train<-read.table(paste(getwd(),"/UCI HAR Dataset/train/y_train.txt",sep = ""))
x_test<-read.table(paste(getwd(),"/UCI HAR Dataset/test/X_test.txt",sep = ""))
y_test<-read.table(paste(getwd(),"/UCI HAR Dataset/test/y_test.txt",sep = ""))
subTest<-read.table(paste(getwd(),"/UCI HAR Dataset/test/subject_test.txt",sep = ""))
subTrain<-read.table(paste(getwd(),"/UCI HAR Dataset/train/subject_train.txt",sep = ""))
ColNames<-read.table(paste(getwd(),"/UCI HAR Dataset/features.txt",sep = ""))

a<-cbind(x_test,y_test,subTest)
b<-cbind(x_train,y_train,subTrain)
MergedTab<-rbind(a,b)

names(MergedTab)=c(paste(as.character(ColNames$V2)),"Activity","Subject")
CN<-names(MergedTab)
Mean_Index<-grep("[Mm][Ee][Aa][Nn]\\(\\)",CN)
SD_Index<-grep("[Ss][Tt][Dd]\\(\\)",CN)
Mean_SD_Index<-sort(c(Mean_Index,SD_Index))

Activity_Index<-MergedTab$Activity
l<-cut(Activity_Index,6,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING", "LAYING"))
MergedTab$Activity = l

t<-CN
tnew<-c(t[1:302],paste(t[303:316],"X"),paste(t[317:330],"Y"),paste(t[331:344],"Z"),t[345:563])
tnew<-c(tnew[1:381],paste(t[382:395],"X"),paste(t[396:409],"Y"),paste(t[410:423],"Z"),t[424:563])
tnew<-c(tnew[1:460],paste(tnew[461:474],"X"),paste(tnew[475:488],"Y"),paste(tnew[489:502],"Z"),tnew[503:563])
CN1<-tnew
names(MergedTab)<-CN1

##First Output
Data_Tab<-tbl_df(MergedTab)[,c(Mean_SD_Index,562,563)]

res<-sapply(split(DT[1:66],list(DT$Subject,DT$Activity)),colMeans)
jj <- as.data.frame(res)
res<-transpose(jj)
names(res)<-CN[Mean_SD_Index]
ll<-as.data.frame(names(jj))
kk <- extract(ll,'names(jj)', into=c('V1', 'V','V2'), '([0-9]+)([\\.])([a-zA-Z]*+)', convert=TRUE)
Result<-cbind(res,kk$V1,kk$V2)
names(Result)[c(68,67)]<-CN[c(562,563)]
Result<-Result[,c(68,67,1:66)]


#Final Output
Result
