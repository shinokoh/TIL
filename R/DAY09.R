# EDA(Exploratory Data Analysis)
# 탐색적 데이터 분석(데이터 전처리 + 시각화 + 통계분석)

# 통계분석으로 보면 가설

# 데이터 전처리
# 1. 데이터 탐색(조회)
# 2. 결측값 처리
# 3. 이상치 발견하고 처리
# 4. 코딩변경(컬럼명 변경, 파생변수) , 데이터 조작
# 5. 탐색적 분석을 위한 시각화

# 가설 검증



# 몸풀기
library(ggplot2)

?midwest

midwest.df <- as.data.frame(midwest)
str(midwest.df)
names(midwest.df)

head(midwest.df)

# 1. 
# 전체인구 -> total    변경
# 아시아 인구 -> asian 변경
?rename

library(dplyr)
midwest.df <- rename(midwest.df , total = poptotal )
midwest.df <- rename(midwest.df , asian = popasian )

# 2. 
# total , asian 변수를 이용해서 '전체인구대비 아시아 인구 백분율' percasian 
# 파생변수를 만들고
# 히스토그램으로 만들어 분포하는지 살펴보자

midwest.df$percasian <- (midwest.df$asian / midwest.df$total) * 100

midwest.df <- midwest.df %>%
  mutate(percasian = (asian/total) * 100)

hist(prop.table(midwest.df$percasian) , 
     prob = F , 
     breaks = 25)


# 3. 
# 아시아 이구 백분율전체 평균을 구하고
# 평균을 초과하면 'over'
# 그 외에는 'under'를 부여하는 파생변수(mean)를 추가해 보자
# ifelse , mean


midwest.df <- midwest.df %>% 
  mutate(mean = ifelse(percasian > mean(percasian),'over', 'under'))

# 4.
# mean에 대한 빈도를 확인하고 한다면?
# 막대그래프로 시각화
# barplot , geom_bar
table(midwest.df$mean)

barplot(table(midwest.df$mean))

ggplot(midwest.df,aes(x=mean)) + 
  geom_bar()

# 5. 
# 전체인구대비 미성년 인구 백분율 추가(percyouth)
names(midwest.df)

midwest.df <- midwest.df %>%
  mutate(percyouth = (total - popadults) / total * 100)

# 6.
# 미성년 인구 백분율이 가장 높은 상위 5개 지역(county)을 확인하고 싶다면?
midwest.df %>%
  arrange(desc(percyouth)) %>%
    select(county , percyouth) %>%
      head(5)


# 7.
# 전체인구대비 아시아인 인구 백분율 ratio_asian 파생변수 추가
# 하위 10개 지역 state(주), county(지역) , ratio_asian 출력
midwest.df %>% 
  mutate(ratio_asian = (asian / total)*100) %>% 
    arrange(ratio_asian) %>% 
      select(state, county, ratio_asian) %>% head(n=10)



# 8.
# 미성년자 등급 변수를 추가한다(gradeyouth)
# 분류기준은 40% 이상 large , 30 ~ 40 middel , 30미만 small
# ifelse( , ,ifelse)
# 빈도를 시각화


midwest.df <- midwest.df %>% 
  mutate(gradeyouth = ifelse(percyouth>=40,'large',
                             ifelse(percyouth>=30,'middle','small')))

ggplot(midwest.df, aes(gradeyouth)) + 
  geom_bar()


# service_data_new_data_eda.csv

dataset <- read.csv(file.choose())
str(dataset)
dim(dataset)

# resident2 , gender2 범주형 변환
# 그리고 두 범주형 변수의 분포 확인(시각화 barplot , geom_bar)
dataset$resident2 <- as.factor(dataset$resident2)
dataset$gender2 <- as.factor(dataset$gender2)

class( table(dataset$resident2 , dataset$gender2) )
resident.gender.tbl <- table(dataset$resident2 , dataset$gender2)
?barplot
barplot(resident.gender.tbl , 
        legend = row.names(resident.gender.tbl),
        col    = rainbow(5) ,
        beside = T)

resident.gender.df <- as.data.frame( resident.gender.tbl )

ggplot(resident.gender.df) +
  geom_bar(aes(x = Var2 , y = Var1 , fill = Freq),
           stat = 'identity' , 
           position = 'dodge') 
  
ggplot(resident.gender.df , 
       aes(x = Freq  , y = Var2  , fill = Var1)) +
  geom_bar(stat = 'identity' , 
           position = 'dodge') 

ggplot(resident.gender.df , 
       aes(x = Var2  , y = Freq  , fill = Var1)) +
  geom_bar(stat = 'identity' , 
           position = 'dodge') 

# job2 , age2 범주형 변화
# 그리고 두 범주형 변수의 분포 확인(시각화 barplot , geom_bar)
str(dataset)


# 직업유형에 따른 나이 비율?(시각화)
ggplot(data = dataset , 
       aes(x=age , fill = job2)) +
  geom_bar()


# service_data_visualization_seoul_subway.csv

library(ggplot2)
seoul_subway <- read.csv(file.choose())
# seoul_subway <- read.csv(file.choose() , sep="," , header = T)

head(seoul_subway)
str(seoul_subway)

# x 축을 평균일 승차인원(AVG_ONEDAY)으로 설정하고
# y 축을 각 노선의 운행횟수(RUNNINGTIMES_WEEKDAYS)로 설정하고
# 평균 혼잡도(AVG_CROWDEDNESS)로 산점도를 그려보자

ggplot(seoul_subway , 
       aes(x = AVG_ONEDAY , y = RUNNINGTIMES_WEEKDAYS)) +
  geom_point(aes(col = LINE , size = AVG_CROWDEDNESS))

# x 축 각 노선(LINE)으로 일평균 막대그래프를 만들어보자

ggplot(seoul_subway , 
       aes(x = LINE , y = AVG_ONEDAY)) + 
  geom_bar(stat = 'identity')

  

# 데이터 전처리
dataset <- read.csv(file.choose() , header = T)
str(dataset)
head(dataset)

names(dataset)

# 결측값 확인
table(is.na(dataset))
library(MASS)
dataset[ !complete.cases(dataset) , ] 

# 결측값 제거
# caret package
dataset.new <- na.omit(dataset)
table(is.na(dataset.new))
str(dataset.new)

# 결측값을 대체
# 0 으로 대체
price <- dataset$price
ifelse(is.na(price) , 0 , price)

# 평균 대체
mean(dataset$price , na.rm = T)
ifelse(is.na(dataset$price) , mean(dataset$price , na.rm = T) , dataset$price)

# 통계적 방법으로 접근
price.avg <- mean(dataset$price , na.rm = T)
dataset$type <- rep(1:3 , 100)
# type : 1 * 1.5 , 2 * 1.0 , 3 * 0.5
# 가변수 priceState

temp = c()
for(i in 1:nrow(dataset)) {
  if(dataset$type[i] == 1) {
    temp[i] = dataset$type[i] * 1.5
  }else if(dataset$type[i] == 2){
    temp[i] = dataset$type[i] * 1.0
  }else {
    temp[i] = dataset$type[i] * 0.5
  }
}

dataset$priceState <- temp

dataset %>% mutate(priceState = ifelse(type==1,type*1.5,
                                       ifelse(type==2,type*1, type*0.5)))



# 이상치
str(dataset)
gender <- dataset$gender
range(gender)
table(gender)

gender.subset <- subset(dataset , gender == 1 | gender == 2)
gender.subset$gender <- as.factor(gender.subset$gender)
str(gender.subset)

# 변수의 유형이 연속형이라면
# 어떻게 이상치를 제거할까요?

seq.price <- dataset$price
length(seq.price)
summary(seq.price)
boxplot(seq.price)

# low   whisker : 중앙값 - 1.5 * IQR : 2.2875
# high  whisker : 중앙값 + 1.5 * IQR : 8.2125

dataset <- subset(dataset , seq.price >= 2.2875 & seq.price <= 8.2125)

seq.price <- dataset$price
boxplot(dataset)

# age
summary(dataset$age)

na.age <- na.omit(dataset$age)
sum(is.na(na.age))
table(is.na(na.age))
boxplot(na.age , horizontal = F)


# 리코딩
# 데이터의 가독성을 위해서 연속형변수 -> 범주형

dataset$resident
length(dataset$resident)
range(dataset$resident)

# 1 : 서울 , 2 : 부산 , 3: 광주 , 4: 대전 , 5 : 대구
# dataset$resident.new 추가한다면?

dataset$resident.new[dataset$resident == 1] <- '서울'
dataset$resident.new[dataset$resident == 2] <- '부산'
dataset$resident.new[dataset$resident == 3] <- '광주'
dataset$resident.new[dataset$resident == 4] <- '대전'
dataset$resident.new[dataset$resident == 5] <- '대구'


dataset %>% mutate(resident.new = ifelse(resident == 1, '서울',
                                         ifelse(resident == 2, '부산',
                                                ifelse(resident == 3, '광주',
                                                       ifelse(resident == 4, '대전', '대구')))))

# NA -> 행정수도인 대전
dataset$resident.new <- ifelse(is.na(dataset$resident.new), '대전' , dataset$resident.new)

dataset$job























































