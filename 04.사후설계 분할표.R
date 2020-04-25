## 사후설계 분할표 만들기

post <- read.csv("0303.post.csv",
                 header = TRUE,
                 na.strings = ".")
post
library(reshape)
post <- rename(post, 
              c(癤퓋morking = "smoking"))

post$smoking <- factor(post$smoking,
                        levels=c(1,2),
                        labels=c("smok","nsmok"))
post$cancer <- factor(post$cancer,
                      levels = c(1,2),
                      labels = c("cancer","health"))
str(post)

attach(post)
post.n <- xtabs(observation ~ cancer + smoking, data=post)

# 교차분석용 라이브러리 이용
install.packages("gmodels")
library(gmodels)
CrossTable(post.n)
