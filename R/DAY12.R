
# Text mining
# 비정형문서 -> 뉴스기사 , SNS
# 자연어에서 의미 있는 정보를 찾는 과정
# 데이터 마이닝 기법을 통해서 통찰력을 얻거나 의사결정을 지원하기 위한 과정

# KoNLP , tm , wordcloud

install.packages(c("hash", "tau", "Sejong", 
                   "RSQLite", "devtools", "bit", 
                   "rex", "lazyeval", "htmlwidgets", 
                   "crosstalk", "promises", "later", 
                   "sessioninfo", "xopen", "bit64", 
                   "blob", "DBI", "memoise", "plogr", 
                   "covr", "DT", "rcmdcheck", "rversions"), 
                    type = "binary")  

install.packages('remotes')

remotes::install_github('haven-jeon/KoNLP', 
                        upgrade = "never", 
                        INSTALL_opts=c("--no-multiarch"))


Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_151')

install.packages( c('KoNLP' , 'wordcloud' , 'tm'))
install.packages('RColorBrewer')



library(rJava)
library(KoNLP)
library(tm)
library(wordcloud)
library(RColorBrewer)

# 명사 , 형용사 etc 사전
useSejongDic()


text <- "최근 이슈가 되고 있는 빅데이터에 대한 이해와 활용을 위해 데이터 과학(Data Science)의 측면에서 접근한다.
빅데이터는 통계학을 비롯한 경영, IT 등의 다양한 분야들이 서로 결합되어 있고 그 정의가 다양하지만, 본 강의는 데이터 분석을
기반으로 하는 과학적 의사결정의 관점에서 바라보고자 한다. 빅데이터에 대한 이해를 위해 실제 사례들을 살펴보고,
데이터를 통해 의사결정에 유용한 정보 및 지식을 찾는 과정을 이해한다. 나아가 빅데이터 분석에서 필수적으로 언급되고 있는
R 통계프로그램을 소개하고 이를 분석에 활용할 수 있게 한다."

# 명사추출 : extractNoun()

nouns <- extractNoun(text)
class(nouns)

# 조사 제거 : 
# nouns[nchar(nouns[2]) >= 2]
nouns <- nouns[nchar(nouns) >= 2]

table(nouns)

nouns <- gsub('빅데이터.*' , '빅데이터' , nouns)
# nouns <- gsub('[^가-힣]','',nouns)


nouns <- gsub('[a-zA-Z]|[[:punct:]]', '', nouns)
wordFreq <- table(nouns)
class(wordFreq)
names(wordFreq)
?wordcloud
pal <- brewer.pal(6 , 'Accent')

wordcloud(words = names(wordFreq) , 
          freq  = wordFreq, 
          min.freq = 1 , 
          random.order = T , 
          colors = pal)


# tm (전처리)
# 말뭉치? -> 특정한 목적을 가지고 언어의 표본을 추출한 집합

# 텍스트 마이닝 단계
# 문서 > 말뭉치 > Term Document Matrix(구조화된 문서) > 분석

facebook <- file(file.choose() , encoding = 'UTF-8')
facebook.data <- readLines(facebook)
facebook.data[76]

head(facebook.data)
str(facebook.data)


# 단어 추가
# term = '추가할 단어' , tag = ncn(명사지시코드)
user.dic <- data.frame(term = c('R 프로그래밍' , '페이스북' , '임정섭' , '조수연'),
                       tag  = 'ncn')

buildDictionary(ext_dic = 'sejong' , user_dic = user.dic)
useSejongDic()

# 단어추출을 위해서 사용자 함수정의
# 문자변환 -> 명사 단어 추출 -> 공백 합침
# paste()
user.exNouns <- function(x) {
  paste(extractNoun(as.character(x)) , collapse = " ")
}

facebook.nouns <- sapply(facebook.data , user.exNouns)
str(facebook.nouns)
facebook.nouns[76]


# 전처리
# 말뭉치 Corpus VectorSource

myCorpus <- Corpus( VectorSource(facebook.nouns) )
myCorpus
inspect( myCorpus[1] )
inspect( myCorpus[2] )

# 말뭉치에 대한 전처리 tm_map()
myCorpusPrepro <- tm_map(myCorpus , removePunctuation) # 문장부호 제거
inspect( myCorpusPrepro[1] )
myCorpusPrepro <- tm_map(myCorpusPrepro , removeNumbers) # 수치 제거
myCorpusPrepro <- tm_map(myCorpusPrepro , tolower) # 소문자 변경
myCorpusPrepro <- tm_map(myCorpusPrepro , removeWords , stopwords('english')) # 불용어(stopwords) 제거
stopwords('english')

myCorpusPrepro
inspect( myCorpusPrepro[1] )

# 단어 선별(2개 ~ 8개)
# 한글 1개 -> 2byte
myCorpusPreproTerm <- TermDocumentMatrix( myCorpusPrepro , 
                                          control = list(wordLengths=c(4, 16)) )
class(myCorpusPreproTerm)

# 단어의 빈도수 구하기
# Corpus -> 평이한 문서 : TermDocumentMatrix -> data.frame
myTerm.df <- as.data.frame( as.matrix(myCorpusPreproTerm) )

wordResult <- sort( rowSums(myTerm.df) , decreasing = T )
class(wordResult)
myName <- names(wordResult)

# wordcloud
wordcloud(myName , 
          wordResult)


pal <- brewer.pal(12 , 'Set1')
wordcloud(words = myName , 
          freq  = wordResult, 
          min.freq = 8 , 
          random.order = T , 
          colors = pal)

word.df <- data.frame(word = myName , 
                      freq = wordResult)
str(word.df)

wordcloud(words = word.df$word , 
          freq  = word.df$freq, 
          min.freq = 8 , 
          random.order = T , 
          colors = pal , 
          rot.per = .5)

top10 <- head(wordResult , 10)

pie(top10 , 
    col = rainbow(10) , 
    radius = .5)

# 빈도수 백분율 적용
pct <- round( top10/sum(top10) * 100 , 1)
names(top10)

labs <- paste(names(top10) , '\n' , pct , '%')

# windowsFont()

pie(top10 , 
    main = 'SNS 빅데이터 관련 토픽분석' , 
    col = rainbow(10) , 
    radius = 1 , 
    labels = labs , 
    cex = .8)


# 실습 president_text_mining.txt
useSejongDic()

president <- file(file.choose())
president.data <- readLines(president)
president.data[1]

presidentCorp <- Corpus(VectorSource(president.data))

presidentCorp <- tm_map(presidentCorp , stripWhitespace)
presidentCorp <- tm_map(presidentCorp , removeNumbers)
presidentCorp <- tm_map(presidentCorp , removePunctuation)

president.exNouns <- function(doc) {
  txt <- as.character(doc)
  extractNoun(txt)
}


presidentTDM <- TermDocumentMatrix(presidentCorp , 
                                   control = list(tokenize = president.exNouns))


presidentMAT <- as.matrix(presidentTDM)
class(presidentMAT)

rownames(presidentMAT)
rowSums(presidentMAT)


stopword <- c('저에' , '새론')
presidentTDM <- TermDocumentMatrix(presidentCorp , 
                                   control = list(tokenize    = president.exNouns , 
                                                  wordLengths = c(4,10) , 
                                                  stopwords   = stopword))



presidentMAT <- as.matrix(presidentTDM)
class(presidentMAT)

rownames(presidentMAT)
rowSums(presidentMAT)

wordFreq <- sort(rowSums(presidentMAT) ,decreasing = T)
names(wordFreq)

wordcloud(words =  names(wordFreq), 
          freq  =  wordFreq, 
          min.freq = 3 , 
          random.order = T , 
          colors = pal)



# 연관분석(단어와 단어 사이의 연관성 분석)
# 연관어 네트워크 시각화

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_151')

library(rJava)
library(KoNLP)

# 1. 텍스트 파일 가져오기 marketing.txt

marketing <- file(file.choose() , encoding = 'UTF-8')
marketing.data <- readLines(marketing)
str( marketing.data )

# 2. 줄 단위로 명사 추출
# Map() 

linewords <- Map(extractNoun , marketing.data) 
length(linewords)

# 전체를 대상으로 중복 단어 제거
# unique()

linewords <- unique(linewords)
length(linewords)
class(linewords)

# 줄 단위를 대상으로 중복 단어 제거
?sapply
linewords <- sapply(linewords , unique)
length(linewords)
class(linewords[[1]])

nchar( linewords[[1]][1] )

# 전처리
# 길이가 2-4 사이의 단어를 필터링하는 함수 정의
user.filter01 <- function(x) {
  nchar(x) >=2 && nchar(x) <= 4 && is.hangul(x)
}

# 벡터 단위 필터링  
user.filter02 <- function(x) {
  Filter(user.filter01 , x)
}

# 줄 단위 대상 필터링
final.linewords <- sapply(linewords , user.filter02)


# 연관분석을 위한 패키지 arules
install.packages('arules')
library(arules)

# 단어를 트랜잭션으로 변환
# as()
wordtransaction <- as(final.linewords , 'transactions')
inspect(wordtransaction)

# 트랜잭션을 대상으로 연관규칙을 생성
# apriori(data , parameter , apperance , control)
tranrule <- apriori(wordtransaction)

tranruleparam <- apriori(wordtransaction , 
                         parameter = list(supp=0.25 , conf = 0.05))

inspect(tranrule)
inspect(tranruleparam)

# 시각화
# 데이터 구조 변경 
# 연관규칙 -> 라벨을 추출
rules <- labels(tranrule , ruleSep =" ")
class( rules )

# matrix
# list

ruleslist <- sapply(rules , strsplit , " " , USE.NAMES = F)
class(ruleslist)
ruleslist

# list -> matrix
rulesMat <- do.call('rbind' , ruleslist)
class( rulesMat )

rulesMat[ 1:5 , ]

# 시각화를 위한 igraph
install.packages('igraph')
library(igraph)

# 연관단어를 정점 형태의 목록으로 시각화
# edgelist
ruledg <- graph.edgelist(rulesMat[ 1:10 , ])
str(ruledg)

plot.igraph(ruledg ,
            vertex.label = V(ruledg)$name,
            vertex.label.color = 'red', 
            vertex.label.cex   = 1.2 , 
            vertex.size = 20 , 
            vertex.frame.color = 'blue')



# 구글 지도를 활용한 시각화
# ggmap

library(devtools)
install_github('dkahle/ggmap')
library(ggmap)

aip.key = "AIzaSyBu-5obPaXczZKRleHqIAlYctTx1oKEtB0"
register_google(aip.key)
gg_seoul <- get_googlemap('seoul' , maptype = 'terrain')

ggmap(gg_seoul)

# 

geo_code <- enc2utf8('대전역') %>% geocode()
geo_data <- as.numeric(geo_code)

get_googlemap(center = geo_data , 
              maptype = 'roadmap' , 
              zoom = 13) %>% ggmap() +
  geom_point(data = geo_code,
             aes(x = geo_data[1] , y = geo_data[2]))
































































































