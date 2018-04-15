##task 1

list.files("C:/Users/44877/Documents/Visual Studio 2015/Projects/lab3 Nicrime/lab3 Nicrime/data1/NI Crime Data/")
x <- list.files("C:/Users/44877/Documents/Visual Studio 2015/Projects/lab3 Nicrime/lab3 Nicrime/data1/NI Crime Data/", pattern = "*.csv", recursive = TRUE)
x

##alfile <- do.call(rbind, lapply(x, read.csv))

alfile <- function(file_list) {
data_frame <- NULL
    for (file in file_list) {
        data <- read.csv(header = TRUE,paste("C:/Users/44877/Documents/Visual Studio 2015/Projects/lab3 Nicrime/lab3 Nicrime/data1/NI Crime Data/",file,sep = ""),stringsAsFactors = FALSE)
        data_frame <- rbind(data_frame, data)
        }
    return(data_frame)
}


ALLNICrimeData <- alfile(x)
str(ALLNICrimeData)
write.csv(ALLNICrimeData, file = "C:/Users/44877/Documents/Visual Studio 2015/Projects/lab3 Nicrime/ALLNICrimeData.csv")
head(ALLNICrimeData)
nrow(ALLNICrimeData)

##task 2
ALLNICrimeData = subset(ALLNICrimeData, select = c("Month", "Longitude", "Latitude", "Location", "Crime.type"))
head(ALLNICrimeData)
write.csv(ALLNICrimeData, file = "C:/Users/44877/Documents/Visual Studio 2015/Projects/lab3 Nicrime/ALLNICrimeData.csv")

## task 3 
Crime.type <- factor(ALLNICrimeData$'Crime.type', order = TRUE)
ALLNICrimeData$"Crime.type" <- Crime.type
str(ALLNICrimeData)
head(ALLNICrimeData)
##task 4

Location <- gsub("On or near", "", as.character(ALLNICrimeData$Location))
ALLNICrimeData$Location <- Location

ALLNICrimeData$Location[ALLNICrimeData$Location == " "] <- 'NO RECORD '

head(ALLNICrimeData,10)
