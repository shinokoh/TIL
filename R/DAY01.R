# 100에서 200으로 구성된 벡터 sampleVec를 생성한 다음
# 각 문제를 수행하는 코드를 작성하세요
sampleVec <-c(100:200)
sampleVec 


# 문제01] 인덱스가 10번째인 값을 출력하세요

sampleVec[10]
head(sampleVec,10)

# 문제02] 끝에서 10개의 값을 자라내어 출력하세요
#tip. head(), tail()
?head
tail(sampleVec,10)

# 문제03] 홀수만 출력하세요
# tip.  %%  = 나머지 연산자
sampleVec[sampleVec %% 2 == 1]

# 문제04] 3의 배수만 출력하세요 
sampleVec[sampleVec %% 3 == 0]

# 문제05] 앞에서 20개의 값을 잘라내어 변수 d.20 에 저장하고 d.20 값을 출력
d.20 <- head(sampleVec ,20)
d.20
# 문제06] d.20의 5번째 값을 제외한 나머지 값들을 출력
d.20[-5]

# 문제07] d.20의 5,7,9번째 값을 제외한 나머지 값들을 출력
d.20[c(-5,-7,-9)]




?month.name
month.name
absent <- c(10,8,14,15,9,10, 15, 12, 9, 7, 8, 7)
names(absent) <-month.name
absent


# 5월(MAY)의 결석생 수를 출력하시오.
absent[5]
absent['May']

# 7월(JUL), 9월(SEP)의 결석생 수를 출력하시오.
absent[ c('May' ,'September')]

# 상반기(1~6월)의 결석생 수의 합계를 출력하시오.
sum(absent[ c(1:6)])

# 하반기(7~12월)의 결석생 수의 평균을 출력하시오.
mean(absent[ c(7:12)])


# TRUE/FALSE 논리형 벡터
# &, |, !(not) ,xor

c(T,F,T,TRUE,FALSE)
!c(T,F,T,TRUE,FALSE)

xor(c(T,F,T) , c(TRUE, TRUE, FALSE))

?runif
x <- runif(3)
x
any(x>0.8)
all(x<0.8)

#문자형 벡터
c('a','b','c','d','e')
#문자형 벡터의 경우 대소 관계가 있음, 연산가능 (a>b)
strvec <-  c('h','t','t','n','o')
strvec[3] > strvec[5]

month.abb
paste(month.abb, 1:12)

paste(month.abb, 1:12, c("st", "nd","rd", rep("th",9)))

# [정규표현식(regular expression)]

# *  0 or more.
# +  1 or more.
# ?  0 or 1.
# .  무엇이든 한 글자를 의미
# ^  시작 문자 지정 
# ex) ^[abc] abc중 한 단어 포함한 것으로 시작
# [^] 해당 문자를 제외한 모든 것 ex) [^abc] a,b,c 는 빼고
# $  끝 문자 지정
# [a-z] 알파벳 소문자 중 1개
# [A-Z] 알파벳 대문자 중 1개
# [0-9] 모든 숫자 중 1개
# [a-zA-Z] 모든 알파벳 중 1개
# [가-힣] 모든 한글 중 1개
# [^가-힣] 모든 한글을 제외한 모든 것
# [:punct:] 구두점 문자, ! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [ ] ^ _ ` { | } ~.
# [:alpha:] 알파벳 대소문자, 동등한 표현 [A-z]
# [:lower:] 영문 소문자, 동등한 표현 [a-z]
# [:upper:] 영문 대문자, 동등한 표현 [A-Z].
# [:digit:] 숫자, 0,1,2,3,4,5,6,7,8,9,
# [:xdigit:] 16진수  [0-9A-Fa-f]
# [:alnum:] 알파벳 숫자 문자, 동등한 표현[A-z0-9].
# [:cntrl:] \n, \r 같은 제어문자, 동등한 표현[\x00-\x1F\x7F].
# [:graph:] 그래픽 (사람이 읽을 수 있는) 문자, 동등한 표현
# [:print:] 출력가능한 문자, 동등한 표현
# [:space:] 공백 문자: 탭, 개행문자, 수직탭, 공백, 복귀문자, 서식이송
# [:blank:] 간격 문자, 즉 스페이스와 탭.

#grep
?grep

strvec <-c('gender','height','age','weight','eight')
strvec

#ei 로 시작하는 값을 출력
grep('^ei', strvec, value = T)

#ei이라는 문자열이 있는 요소를 추출한다면
grep('ei', strvec, value = T)
grep('+ei', strvec, value = T)

#인덱스를 활용해 값을 출력
grep('ei', strvec)
strvec[grep('ei', strvec)]

txtvec <-c('bigdate','data','class','class1','class2')

# 시작문자 지정 : ^
# +1 or more
# 소문자 b로 시작하는 데이터 추출?
grep('^b+',txtvec, value=T)
grep('^b+',txtvec, value=T, ignore.cas=T)

# big 문자열이 있는 요소를 찾아 해당 문자열을 bigger
# 라는 단어로 바꾼다면
# gsub()

sub('+big+', 'bigger', txtvec)
gsub("")

# 숫자를 제거하고 싶다면
gsub('[0-9]', "", txtvec)

txtvec


