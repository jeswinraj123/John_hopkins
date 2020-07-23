data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(data)
data[,11]<-as.numeric(data[,11])
hist(data[,11])
print(names(data)[1])
print(names(data))
states <- data[, 2]
states <- unique(states)
state<-"SC"
if(state %in% states == FALSE) stop("invalid state")
