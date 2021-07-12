
#실습
install.packages('readxl')
library(readxl)
raw.data <- read_excel(file.choose())
str(raw.data)
#티블을 데이터프레임으로 변경
data.df <- as.data.frame(raw.data)
str(data.df)

names(data.df)
#주소, 상호 -> 어느 지역(구)에 치킨집이 많은지?

address<-data.df$소재지전체주소

#동확인
#정규표현식 - 공백과 숫자제거


address[1]
substr(address , 12, 16)

address.trim.num <- gsub('[0-9]' , "" , address)
address.trim.space <- gsub('' , "" , address.trim.num)

# 동별 업수의 갯수(빈도 - table())

library(dplyr)
address.tbl.df <- address.trim.space %>%
  table() %>%
  data.frame()

install.packages('treemap')
library(treemap)

treemap(address.tbl.df,
        index = "." ,
        vSize = 'Freq',
        title  = '동별분포')

#동별로 가게(상호)분포 확인?

data.df
address2 <- data.df$소재지전체주소
address2
ad2<-substr(address2, 12, 15 )
tri.num <- gsub('[0-9]' , " ", ad2)
tri.num.df <- tri.num %>%
  table() %>%
  data.frame()
tri.num.df

treemap(tri.num.df,
        index = "." ,
        vSize = 'Freq',
        title  = '동별분포')

library(stringr)
str_extract(data.df$소재지전체주소 , 
            '[가-힣]+동 | [가-힣]+로')
dong.vc <- str_extract(data.df$소재지전체주소 , 
                       '[가-힣]+동 | [가-힣]+로')
dong.df <- as.data.frame(table(dong.vc))
str(dong.df)

treemap(dong.df, 
        index = "dong.vc" ,
        vSize = 'Freq',
        title  = '동별분포')

dust <- read_excel(file.choose())
#실습
#(서울시 구별)지역별 미세먼지의 차이를 확인
#H0: 구별 미세먼지의 차이가 없다(동작구, 서초구)

head(dust)
str(dust)
names(dust)

dust.df <- as.data.frame(dust)
str(dust.df)
dust.df$area

#동작구, 서초구 데이터 추출
dataset <- dust.df %>%
  filter(area %in% c('서초구','동작구'))

#날짜(yyyymmdd)에 따른 데이터 수 파악
count(dataset, yyyymmdd)

seocho <-subset(dataset, dataset$area == '서초구')
dongjak <- subset(dataset , area == '동작구')

dongjak %>%
  summarise(mean(dongjak$finedust), na.rm = T)

#describe() : 기초통계량
install.packages('psych')
library(psych)

describe(dongjak)

library(ggplot2)
#시각화
ggplot(data = dataset , 
       aes(x = yyyymmdd , y = finedust,
       col = area , group = area)) +
  geom_line() + 
  geom_point()


boxplot(seocho$finedust,
        dongjak$finedust,
        xlab = "area" , 
        ylab = 'finedust',
        main = '서초 vs 동작',
        col = rainbow(8),
        names= c('서초', '동작'))
