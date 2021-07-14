
# R 을 이용한 DBMS 정형 데이터 처리방법
# jdbc -> rJava , DBI , RJDBC package

install.packages('rJava')
install.packages('DBI')
install.packages('RJDBC')

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_151')

library(rJava)
library(DBI)
library(RJDBC)

# DB 연동 순서
# Driver loading , Connection , Query 수행 , 결과집합을 처리하는 과정~

# 1. driver loading
driver <- JDBC(driverClass = 'oracle.jdbc.driver.OracleDriver',
               classPath   = 'C:\\oraclexe\\app\\oracle\\product\\11.2.0\\server\\jdbc\\lib\\ojdbc6.jar')

# 2. connection
conn <- dbConnect(driver , 
                  'jdbc:oracle:thin:@localhost:1521:xe' , 
                  'hr' , 
                  'hr')

select.sql <- 'select * from employee'

# dbGetQuery() : select
# alter user hr identified by hr account unlock ; 
# conn hr/hr

emp.tbl <- dbGetQuery(conn , select.sql)
str(emp.tbl)

# dbSendUpdate() : DML(insert, update , delete) , DDL(create , drop , alter)

create.tbl <- 'create table r_tbl(
  id  varchar2(20) primary key , 
  pwd varchar2(20) not null,
  username varchar2(50) not null , 
  upoint   number       default 100
)'

dbSendUpdate(conn , create.tbl)

# insert
insert.sql <- "insert into r_tbl values('jslim',  'jslim' , '섭섭이' , default)" 
dbSendUpdate(conn , insert.sql)

r.tbl <- dbGetQuery(conn , 'select * from r_tbl')
str(r.tbl)


emp.tbl <- dbGetQuery(conn , 'select * from tabs')
str(emp.tbl)
emp.tbl$TABLE_NAME

update.sql <- "update r_tbl
               set username = 'admin'
               where id = 'jslim' " 

# update
dbSendUpdate(conn , update.sql)
r.tbl <- dbGetQuery(conn , 'select * from r_tbl')
str(r.tbl)

# delete
dbSendUpdate(conn , "delete from r_tbl where id = 'jslim' ")
r.tbl <- dbGetQuery(conn , 'select * from r_tbl')
str(r.tbl)

select.sql <- 'select * from employee'

emp.tbl <- dbGetQuery(conn , select.sql)
str(emp.tbl)

# 파생변수로 gender 추가
# ifelse ~
# for ~
??str_sub
library(stringr)
size <- NROW(emp.tbl$EMP_NO)
gender <- c()
for(idx in 1:size) {
  if( str_sub(emp.tbl$EMP_NO[idx] , 8 , 8) == 1 | str_sub(emp.tbl$EMP_NO[idx] , 8 , 8) == 3) {
    gender[idx] = 'M'
  }else {
    gender[idx] = 'F'
  }
}
emp.tbl$gender <- gender
emp.tbl$gender <- NULL

emp.tbl$gender <- ifelse(str_sub(emp.tbl$EMP_NO , 8 , 8) == 1 | str_sub(emp.tbl$EMP_NO , 8 , 8) == 3 , 'M', 'F')

# 성별에 따른 급여 평균 구한다면?
library(dplyr)
emp.tbl %>% 
  group_by(gender) %>%
  dplyr::summarise(mean.sal = mean(SALARY))

# aggregate()
?aggregate

genderGroupMean <- aggregate(emp.tbl$SALARY , 
                             list(emp.tbl$gender) , 
                             mean)
genderGroupMean

# 시각화
# bar()
library(ggplot2)
ggplot(genderGroupMean , 
       aes(x = Group.1 , y = x , fill = Group.1)) +
  geom_bar(stat = 'identity')


# 비정형 데이터(텍스트 마이닝)
# 단어 빈도를 나타내는 시각화(wc , koNLP ,tm)

?file
dataset <- file(file.choose() , encoding = 'UTF-8')
dataset.read <- readLines(dataset)

str(dataset.read)
head(dataset.read)

class(dataset.read)
dataset.read[74]



# 문장부호 제거 , 특수문자 제거 , 숫자 제거 , 모든 영문자는 소문자로 변경
# 정규표현식 , gsub() , tolower() , toupper()

sentence <- gsub('[[:punct:]]' , "" , dataset.read)
sentence <- gsub('[[:cntrl:]]' , "" , sentence)
sentence <- gsub('\\d+' , "" , sentence)
sentence <- tolower(sentence)
sentence[74]


# 문장을 단어로 나눈다면(공백 정규식)?
# str_split()
library(stringr)
??str_split
words <- str_split(sentence , '\\s+')
class(words)

# list -> vector
word.vec <- unlist(words)
word.vec[1:10]

# 불용어 , stopword

# 단어사전 가져오기
posDic <- readLines(file.choose() , encoding = 'UTF-8')
negDic <- readLines(file.choose() , encoding = 'UTF-8')

length(posDic)
length(negDic)

posDic[1:10]
negDic[1:10]

posDic <- c(posDic , '지원')
negDic <- c(negDic , '불편한')


library(stringr)
library(plyr)
?laply
lapply
# 감성분석

# 단어 vs 사전 matching
# match()
pMatch <- match(word.vec , posDic)
nMatch <- match(word.vec , negDic)

# 사전에 등록된 단어 위치추출
pMatch <- !is.na(pMatch)
nMatch <- !is.na(nMatch)

# 긍정단어 합 - 부정단어 합
scores <- sum(pMatch) - sum(nMatch)

# 점수반환
# data.frame ->  score(점수) , text(단어)
scores.df <- data.frame(score = scores , text = word.vec)

sentimental.function <- function(words , posDic , negDic) {
  
  scores = laply(words , function(words , posDic , negDic){
    pMatch <- match(words , posDic)
    nMatch <- match(words , negDic)
    
    pMatch <- !is.na(pMatch)
    nMatch <- !is.na(nMatch)
    
    score <- sum(pMatch) - sum(nMatch)
    return (score)
    
  } , posDic , negDic)
  
  scores.df <- data.frame(score = scores , text=words)
  return (scores.df)
}



# result type : data.frame
result <- sentimental.function(word.vec , posDic , negDic) 
names(result)
result$score
# 감성분석 빈도수
result$color[result$score >= 1 ] <- 'blue'
result$color[result$score == 0 ] <- 'green'
result$color[result$score <  0 ] <- 'red'

table(result$color)


result$remark[result$score >= 1 ] <- '긍정'
result$remark[result$score == 0 ] <- '중립'
result$remark[result$score <  0 ] <- '부정'

sentimental.pie <- table(result$remark)
class(sentimental.pie)
names(sentimental.pie)

# 시각화
?pie
pie(sentimental.pie , main='감성분석 결과' , 
    col = rainbow(3) , labels = names(sentimental.pie) , 
    radius = .8 , 
    angle = 45)
















library(stringr)
library(plyr)

# 감성분석
# service_data_facebook_bigdata.txt

fbook <- file(file.choose() , encoding = "UTF-8")
fbook_read <- readLines(fbook)
head(fbook_read)
str(fbook_read)

# 2. 전처리(정규표현식을 필요로 한다)
# 문장부호 제거 [[:punct:]] 하는 정규표현식을 활용한다면?
# 특수문자 제거 [[:cntrl:]]
# 숫자 제거 [0-9] \\d+ 
# \\w+ , \\s+ , \n , \t

# gsub()함수를 이용해서 
s <- gsub('[[:punct:]]' , '' , fbook_read)
s <- gsub('[[:cntrl:]]' , '' , s)
s <- gsub('\\d+' , '' , s)
s <- tolower(s)
s[1]
head(fbook_read,1)
wordList <- str_split(s, "\\s+") 
wordVec <- unlist(wordList)

# 제공되는 단어사전으로부터 파일을 읽어와 보자
# service_data_pos_pol_word.txt
positiveDic <- file(file.choose(), encoding="UTF-8")
pDic <- readLines(positiveDic)
head(pDic)
str(pDic)

# service_data_neg_pol_word.txt
negativeDic <- file(file.choose(), encoding="UTF-8")
nDic <- readLines(negativeDic)
head(nDic)
str(nDic)

pDic <- c(pDic, "긍정의 씨앗")
str(pDic)
nDic <- c(nDic, "부정의 씨앗")
str(nDic)


#  분석을 위한 함수 정의

#  분석된 단어(wordVec) VS 사전 단어(pDic, nDic)에 매치가 되는지를 검사
#  match()

pMatch <- match(wordVec, pDic)
nMatch <- match(wordVec, nDic)

# 사전에 등록된 단어 추출을 한다면?
pMatch <- !is.na(pMatch)
nMatch <- !is.na(nMatch)

scores <- sum(pMatch) - sum(nMatch)

scoresDF <- data.frame(score = scores , text = wordVec)
head(scoresDF)

library(stringr)
library(plyr)
?laply

# 이 함수를 정의하세요
resultS <- function(words , positive , negative) {
  scores = laply(words, function(words, positive, negative) {
    pMatch = match(words, positive) 
    nMatch = match(words, negative)
    
    pMatch = !is.na(pMatch) 
    nMatch = !is.na(nMatch)
    
    score = sum(pMatch) - sum(nMatch) 
    return(score)
  }, positive, negative)
  
  scores.df = data.frame(score=scores , text=words)
  return(scores.df)
}


resultTbl <- resultS(wordVec, pDic, nDic) 

str(resultTbl)
resultTbl
resultTbl$text
resultTbl$score
resultTbl$remark[resultTbl$score >= 1 ] <- "긍정"
resultTbl$remark[resultTbl$score == 0 ] <- "중립"
resultTbl$remark[resultTbl$score <  0 ] <- "부정"



pieResult <- table(resultTbl$remark)
?pie
pie(pieResult, 
    labels = names(pieResult),
    col = c('yellow', 'green', 'blue'),
    radius = 1.0)
































