getwd()
setwd("D:/TBDM")

dataset <- read.csv("kohkiloyeh.csv",sep = ",")

#install package untuk pohon keputusan
install.packages("C5.0")
install.packages("printr")

#load library
library(C50)
library(printr)

pohon_keputusan <- C5.0(pb ~., data = dataset)

#melihat hasil
pohon_keputusan
summary(pohon_keputusan)

plot(pohon_keputusan)

#membuat dataset
datatest <- dataset[,1:4]

#memprediksi dataset dengan pohon keputusan
prediksi <- predict(pohon_keputusan, dataset)

#membandingkan hasil prediksi dengan dataset
table(prediksi, dataset$pb)
