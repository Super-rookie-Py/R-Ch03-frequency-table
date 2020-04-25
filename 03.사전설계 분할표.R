## 사전설계  분할표 만들기

pre <- read.csv("0302.pre.csv",
                head = TRUE,
                na.strings = ".")
library(reshape)
pre <- rename(pre, 
               c(癤퓍reat = "treat"))

pre$treat <- factor(pre$treat,
                    levels = c(1, 2),
                    labels = c("비타민","Placebo"))
pre$cold <- factor(pre$cold,
                   levels = c(1, 2),
                   labels = c("Cold",'noCold'))

attach(pre)

pre.n <- table(treat, cold)
pre.n
pre.p <- prop.table(pre.n)
pre.p
pre.t <- cbind(pre.n,pre.p)
pre.t
pre.a <- addmargins(pre.n)
pre.a

detach(pre)




