##기술통계분석(범주형)


freq <- read.csv("0301.frequency.csv",
                 header=TRUE,
                 na.strings = ".")

#변수 이름 바꾸기 
library(reshape)
freq <- rename(freq, 
                   c(癤퓁d = "id"))


freq$grade <- factor(freq$grade,
                        levels = c(1,2,3,4,5),
                        labels = c("A", "B","C","D","F")
)
freq
######################################
# 도수분포표 만들기(일변량)

# attach(시작) ~ detach(끝) : 데이터 프레임 활성화
# grade.n <- table(freq$grade) # attach 없을때 (사용하면 변수 언급 안해도됨)
#테이블을 이용하여 빈도수 확인

attach(freq)
grade.n <- table(grade) 

# 상대빈도(%)
grade.p <- prop.table(grade.n)
grade.p

#빈도 + 상대빈도
grade.t <- cbind(grade.n, grade.p) #column bind 열로 합치기.
grade.t


#빈도 + 상대빈도 + 합계
#margin = 1 : 행 백분율
#margin = 2 : 열 백분율
#margin = NULL : 전체 백분율
grade.a <- addmargins(grade.t, margin=1)
grade.a


detach(freq)


