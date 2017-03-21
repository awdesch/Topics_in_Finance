rm(list=ls(all=TRUE))
graphics.off()

libraries = c("dygraphs", "zoo")
lapply(libraries, function(x) if (!(x %in% installed.packages())) { install.packages(x) })
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

EXAA         = read.csv("EXAA.csv",header=T,sep=";",dec=".")
data         = (as.numeric(as.character(EXAA[,26])))
names(data)  = time(zooreg(1:length(data),start=as.Date("2003-01-01")))

dygraph(data,ylab="EXAA spot price")