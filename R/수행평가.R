
# 주요컬럼
# manufacturer : 제조회사
# displ : 배기량
# cyl : 실린더 개수
# drv : 구동 방식
# hwy : 고속도로 연비
# class : 자동차 종류
# model : 자동차 모델명
# year : 생산연도
# trans : 변속기 종류
# cty : 도시 연비
# fl : 연료 종류

library(ggplot2)
mpg.df <- mpg
head(mpg.df)

# 1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려 한다. 
# displ(배기량)이 4 이하인 자동차와 4 초과인 자동차 중 
# 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 확인하세요.

x <- filter(mpg.df , displ <= 4) 
y <- filter(mpg.df , displ > 4) 
if(mean(x$hwy) > mean(y$hwy)){
  print("4 이하인 자동차")
} else {
  print('4 초과인 자동차')
}

  # 2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다. 
# "audi"와 "toyota" 중 어느 manufacturer(제조회사)의 cty(도시 연비)가 
# 평균적으로 더 높은지 확인하세요.

head(mpg.df)
audi <- filter(mpg.df, mpg.df$manufacturer == 'audi')
toyota <- filter(mpg.df, mpg.df$manufacturer == 'toyota')

mean(audi$cty)
mean(toyota$cty)

if(mean(audi$cty) > mean(toyota$cty)){
  print("audi")
} else {
  print('toyota')
}

# 3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 한다. 
# 이 회사들의 데이터를 추출한 후 hwy(고속도로 연비) 전체 평균을 구하세요.

head(mpg.df)
ahwy<-filter(mpg.df, manufacturer == c("chevrolet", "ford", "honda" ))
mean(ahwy$hwy)

# 4. "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 
# 높은지 알아보려고 한다. "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 
# 자동차의 데이터를 출력하세요.


audi <- filter(mpg.df, manufacturer == "audi" )
audi %>%
  arrange(desc(hwy)) %>%
  head(5)
  
# 5. mpg 데이터는 연비를 나타내는 변수가 2개입니다. 
# 두 변수를 각각 활용하는 대신 하나의 통합 연비 변수를 만들어 사용하려 합니다. 
# 평균 연비 변수는 두 연비(고속도로와 도시)의 평균을 이용합니다. 
# 회사별로 "suv" 자동차의 평균 연비를 구한후 내림차순으로 정렬한 후 1~5위까지 데이터를 출력하세요.

head(mpg)

mpg_df <- mutate(mpg,  avg_y = hwy + cty / 2 )
filter_df <- filter(mpg_df , class == 'suv')

group_df <-aggregate(filter_df, by=list(filter_df$manufacturer), mean)

group_df %>%
  arrange(desc(avg_y)) %>%
  head(5)

# 6. mpg 데이터의 class는 "suv", "compact" 등 자동차의 특징에 따라 
# 일곱 종류로 분류한 변수입니다. 어떤 차종의 도시 연비가 높은지 비교하려 합니다. 
# class별 cty 평균을 구하고 cty 평균이 높은 순으로 정렬해 출력하세요.
mpg.df <-mpg
mpg.df %>% 
  group_by(class) %>%
  summarise(ctyavg = mean(cty)) %>%
  arrange(desc(ctyavg))

# 7. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려 합니다. 
# hwy(고속도로 연비) 평균이 가장 높은 회사 세 곳을 출력하세요.
mpg.df <-mpg
mpg.df %>% 
  group_by(manufacturer) %>%
  summarise(hwyavg = mean(hwy)) %>%
  arrange(desc(hwyavg)) %>%
  head(3)

# 8. 어떤 회사에서 "compact" 차종을 가장 많이 생산하는지 알아보려고 합니다. 
# 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력하세요.


com_df <- filter(mpg_df , class == 'compact')

com_df %>% 
  group_by(manufacturer) %>%
  summarise(count= n()) %>%
  arrange(desc(count))


#수행평가[5] day09

# 1. 컬럼명을 영문으로 변경

# 2. 각 피쳐별 결측값 확인sum(is.na(salary_data_ead$Age))


# 3. 임금 평균 확인

# 4. 임금 중앙값 확인

# 5. 임금 범위 구해보기(최저, 최고)

# 6. 임금에 대한 사분위수(quantile())구하기


# 7. 성별에 따른 임금 격차 확인해보기

# 8. 7번에서 분석된 데이터를 가지고 원하는 시각화 진행

# 9.  성별에 따른 표준편차 구하기

# 10. 경력별 임금 평균치

# 11. 경력별 임금 평균치 시각화


