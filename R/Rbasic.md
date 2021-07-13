

# R basic

## DAY01

### 01. vector

1.  벡터의 정의 

- 벡터는 **한 가지 데이터 타입**의 여러 개의 값이 저장된 객체

  |     객체     |                특성                | 차원  |
  | :----------: | :--------------------------------: | :---: |
  |    스칼라    |           1개의 값 저장            | 0차원 |
  |     벡터     | **1개 데이터 타입**의 여러 값 저장 | 1차원 |
  | 데이터프레임 |      2가지 이상의 데이터 타입      | 2차원 |

### 02. vector 생성

1. 숫자형 벡터의 생성 & 할당

```
벡터명 <- c(1,2,3,...)
```

2. 숫자형 벡터: 연속되는 정수 벡터의 생성 & 할당 

```
벡터명 <- c(1:100)
```

3. 문자형 벡터의 생성 & 할당

```
벡터명 <- c('문자','문자1','문자2'...'문자n') 
```

- n은 문자의 자릿수, 인덱스를 의미함
- 총 n개의 항을 가진 문자벡터가 생성됨을 의미

4. 논리형 벡터 생성 & 할당

```
벡터명 <- c(연산식1, 연산식2, 연산식3,...연산식n)
* 조회시 	TRUE/FALSE 로 출력
```



### 03. 객체 조회 및 출력

1. 벡터의 전체항 출력

```
벡터명
```

* 벡터명을 입력하고 실행(Ctrl+enter)

2. 벡터의 특정한 항 또는 일부 항만 출력

```
- n번째 항(인덱스가 n)을 출력
벡터명[n]

- n번째에서 m번째 항까지 출력
벡터명[n:m]

- n번째, m번째, x번째 항만 출력
벡터명[c(n,m,x)]
```





## DAY02

### 01.  R stringr 패키지 

1. 패키지 설치

``` R
install. packages("stringr")
library(stringr)
```



2. 문자열 관련 패키지

**str_length**

- 글자 길이 수 확인

  ``` R
  txtVec <- c("BigData" , "Bigdata" , "bigdata" , "Data" , "dataMining" , "class1" , "class2") 
  
  str_length(txtVec)
  
  [1]  7  7  7  4 10  6  6
  ```

  

**str_sub**

- 부분 참조

  ```R
  greetingMsg <- "hi, bigdata is very important" 
  
  substr(greetingMsg , 5, 11) 
  
  [1] "bigdata"
  ```

  

**str_split**

- 문자열 나누기

  ```R
  greetingMsg <- "hi, bigdata is very important" 
  
  str_split(greetingMsg , ",")
  
  [1] "hi"                         " bigdata is very important"
  ```

  

**str_extract**

- 매칭 문자열 추출, 매치된 부분 문자열을 추출하고 매치가 안되면 NA 추출

  ``` R
  install.packages("stringr")
  library(stringr)
  
  shoppinglist <- c("apples 4", "flour","sugar","milk2")
  
  str_extract(shoppinglist, "\\d")
  # \\d : 숫자
  [1] "4" NA  NA  "2"
  
  str_extract(shoppinglist, "[a-z]+")
  [1] "apples" "flour"  "sugar"  "milk"  
  
  str_extract(shoppinglist, "[a-z]{4}")
  [1] "appl" "flou" "suga" "milk"
  
  ```

  ```R
  str_extract("abc123def456" , "[a-zA-Z]{3}")
  [1] "abc"
  
  str_extract_all("abc123def456" , "[a-zA-Z]{3}")
  [[1]]
  [1] "abc" "def"
  ```

  **gsub**:필요없는 단어를 삭제 후 추출

  ```R
  gsub("[0-9]+","",shoppinglist)
  [1] "apples " "flour"   "sugar"   "milk" 
  
  gsub("[0-9]+" , "" , "abc123def456")
  [1] "abcdef"
  ```

  

  :memo: ​**메타문자&정규표현식 알아가기**

  ```R
  # 단어 : \\w
  # 숫자 : \\d
  # 특수문자 : \\특수문자
  # 엔터키 : \n, 탭키 :\t
  # []: 1회 , {n} : n반복
  
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
  ```

  

**str_locate_all**

- 문자열의 위치 파악

  ```R
  strMsg <- "우리는 달려간다~이상한 나라로~섭섭이가 잡혀있는 마왕의 소굴로~"
  str_locate_all(strMsg , '섭섭')
  [1,]    18  19
  ```

  

**str_replace_all**

- 문자열 변환

  ```R
  str_replace_all(strMsg , '섭섭' , '섭순')
  [1] "우리는 달려간다~이상한 나라로~섭순이가 잡혀있는 마왕의 소굴로~"
  ```



3. 예제풀어보기

```R
stringDumy <- "가나다라adfefcs마바345사아자차35"
> stringDumy
[1] "가나다라adfefcs마바345사아자차35"
```

Q00. 영어 단어만 추출

```
str_extract_all(stringDumy, '[a-z]{1,}')
[1] "adfefcs"
```

Q01. 연속된 한글 3자 이상을 추출

```
str_extract_all(stringDumy, '[가-힣]{3,}')
[1] "가나다라" "사아자차"
```

Q02. 나이(두자리숫자)만 추출

```
str_extract_all(stringDumy, '[0-9]{2})
[1] "34" "35"
```

Q03. 숫자 제외하고 추출

``` 
str_extract_all(stringDumy, '[^0-9]')
 [1] "가" "나" "다" "라" "a"  "d"  "f"  "e"  "f"  "c"  "s" 
[12] "마" "바" "사" "아" "자" "차"

str_extract_all(stringDumy , '[^0-9]+')
[1] "가나다라adfefcs마바" "사아자차" 

```



### 02. matrix

1. matrix (행렬)만들기

```R
#기본구문: mat <- matrix(벡터, nrow, ncol, byrow = T)
--------------------------------
mat <- matrix(1:10, 2, 5)
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10

class(mat)
[1] "matrix" "array" 

dim(mat)
[1] 2 5 
#2행 5열 의미
#byrow = T가 디폴트값(행을 기준으로 매트릭스 생성)
```



2. index 하기(데이터 접근[행 인덱스, 열 인덱스])

```R
mat <- matrix(1:10, 2, 5)
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10

#2행 2열의 성분만 출력
mat[2,2]
[1] 4

#1행을 제외한 1,3열의 정보만 추출
mat[-1,c(T,F,T,F,F)]
[1] 2 6

#1,3 열을 제외한 새로운 행렬을 만든다면?
mat[,-c(F,T)]
    [,1] [,2] [,3] [,4]
[1,]    3    5    7    9
[2,]    4    6    8   10

class(mat[,-c(F,T)])
[1] "matrix" "array" 
```



3. matrix(행렬)이름짓기

```R
#매트릭스를 만들어준 뒤 rownames/colnames 로 이름을 지정하는 방법

name<-matrix(1:9,3,3)
name
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

rownames(name) <- c("r1","r2","r3")
colnames(name) <- c("c1","c2","c3")
   c1 c2 c3
r1  1  4  7
r2  2  5  8
r3  3  6  9


#매트릭스를 만들면서 이름을 지정하는 방법

name<-matrix(1:9,3,3)
      dimnames = list(c("r1","r2","r3"),
                      c("c1","c2","c3"))
   c1 c2 c3
r1  1  4  7
r2  2  5  8
r3  3  6  9

```



4. 행렬의 이름을 이용한 index(행과 열의 이름을 이용해 조회가 가능)

```R
name["r1", ]
c1 c2 c3 
 1  4  7 
 
 name["r2","c3"]
 [1] 8
```



5. matrix(행렬) 단순기본연산

```R
> name * 2
   c1 c2 c3
r1  2  8 14
r2  4 10 16
r3  6 12 18

> name / 2
    c1  c2  c3
r1 0.5 2.0 3.5
r2 1.0 2.5 4.0
r3 1.5 3.0 4.5

> name + 2
   c1 c2 c3
r1  3  6  9
r2  4  7 10
r3  5  8 11

> name - 2
   c1 c2 c3
r1 -1  2  5
r2  0  3  6
r3  1  4  7

#행렬 간 연산
mat01 = matrix(c(1,2,3,4,5,6,7,8,9) , nrow = 3 )
mat02 = matrix(c(1,2,3,4,5,6,7,8,9) , ncol = 3 )

> mat01
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

> mat02
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

mat01 * mat02
     [,1] [,2] [,3]
[1,]    1   16   49
[2,]    4   25   64
[3,]    9   36   81

# 행렬 간 연산에서는 앞 행렬의 열의 숫자와 뒤 행렬의 행의 숫자가 같아야한다.
mat01 %*% mat02
     [,1] [,2] [,3]
[1,]   30   66  102
[2,]   36   81  126
[3,]   42   96  150

```



### 03. apply 계열 총정리

1. apply 함수 정의

- 데이터의 각 행, 열에 대한 평균 또는 합과 같은 연산을 계산하는 함수

```R
#기본구문: apply(vector or matrix, 방향, function..)
#방향: 1 -> 행 방향(가로), 2 -> 열 방향(세로)
#함수: sum, mean 등
```



2. apply 함수 적용

```R
> name
   c1 c2 c3
r1  1  4  7
r2  2  5  8
r3  3  6  9
------------
# 행 방향(1)기준으로 sum
apply(name,1,sum)
r1 r2 r3 
12 15 18 

# 열 방향(2)기준으로 평균
apply(name,2,mean)
c1 c2 c3 
 2  5  8 
 
 > head(iris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
 
 # species(5행)을 제외한 각 열에 데이터에 대한 합, 평균, 중위수 구하기
 apply(iris[ , 1:4] , 2, sum)
 Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
       876.5        458.6        563.7        179.9
       
 apply(iris[ , 1:4] , 2, mean)
 Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
    5.843333     3.057333     3.758000     1.199333
    
 apply(iris[ , -5] , 2, median)
 Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
        5.80         3.00         4.35         1.30 
```



3. rowSums() , colSums() , rowMeans() , colMeans()

```R
apply(iris[ , 1:4] , 2, sum)
 Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
       876.5        458.6        563.7        179.9
       
apply(iris[ , -5] , 2, sum)
 Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
       876.5        458.6        563.7        179.9
       
colSums(iris[ , -5])  

#같은 결과를 내는 함수
```



4. lapply와 sapply의 정의와 차이

- lappy() 의 반환 타입: list
- sapply() 의 반환 타입: vector 또는 matrix
- 각 컴포넌트에 대한 함수를 적용한 결과를 반환하는 함수



5. lapply 와 sapply기본구문

```r
laaply(object, function)
saaply(object, funtion)
```



6. lapply 와 sapply 함수 예시

```R
lis01 <- list(1:5)
lis02 <- list(6:10)

lapply(X = c(lst04 , lst05) , FUN = sum)
[[1]]
[1] 15

[[2]]
[1] 40

sapply(X = c(lst04 , lst05) , FUN = sum)
[1] 15 40
```



7. tapply

```R
tapply(데이터, 인덱스, 함수)

# 1~10까지의 숫자를 홀수, 짝수별로 묶어 합계를 구한다면?
tapply(1:10 , 1:10 %% 2 == 1, sum )

x <- c(1:10)
tapply(x , ifelse(x%%2 == 1, "odd", "even"), sum)
```



8. aggregate

```R
gender.mean <- with(height.gender.df ,
					aggregate(height, list(gender),
					mean))
					
 Group.1        x
1       f 162.0000
2       m 179.3333

#실린더별 전체 컬럼의 평균
with(car.df, aggregate(car.df, list(cyl), mean))
 Group.1      mpg cyl     disp        hp     drat       wt
1       4 26.66364   4 105.1364  82.63636 4.070909 2.285727
2       6 19.74286   6 183.3143 122.28571 3.585714 3.117143
3       8 15.10000   8 353.1000 209.21429 3.229286 3.999214
      qsec        vs        am     gear     carb
1 19.13727 0.9090909 0.7272727 4.090909 1.545455
2 17.97714 0.5714286 0.4285714 3.857143 3.428571
3 16.77214 0.0000000 0.1428571 3.285714 3.500000
> 
```



### 04. data.frame

1. 데이터프레임 정의 

- 데이터프레임은**행과 열을 갖는 2차원 표의 형태로 데이터를**저장

  |     객체     |              특성              | 차원  |
  | :----------: | :----------------------------: | :---: |
  |    스칼라    |         1개의 값 저장          | 0차원 |
  |     벡터     | 1개 데이터 타입의 여러 값 저장 | 1차원 |
  | 데이터프레임 |  **2가지 이상**의 데이터 타입  | 2차원 |

- 데이터프레임은 여러 개의 컬럼을 가질 수 있고, 2가지 이상의 유형 데이터를 저장할 수 있음



2. 데이터프레임 생성

- 기존의 벡터를 가지고 데이터프레임 생성

  ```R
  x <- c(1,2,3,4,5)
  y <- c("a","b","c","d","e")
  DF <- data.frame(x,y) 
  DF
    x y
  1 1 a
  2 2 b
  3 3 c
  4 4 d
  5 5 e
  ```

- 바로 데이터프레임 생성

  ```r
  DF <- data.frame(x = c(1,2,3,4,5)
                   y = c("a","b","c","d","e")) 
    x y
  1 1 a
  2 2 b
  3 3 c
  4 4 d
  5 5 e
  ```

  

3. 데이터프레임에서 데이터 조회, 출력

- 특정 컬럼 지정 조회(출력)

  ```R
  1) 행을 기준으로 1,4행만 출력
  DF[ c(T,F,F,T,F),]
    x y
  1 1 a
  4 4 d
  
  
  2) x컬럼만 가져오기
  DF$x
  [1] 1 2 3 4 5
  
  3)응용
  # X값이 짝수인 행의 데이터만 조회
  DF[DF$x %%2 == 0, ]
    x y
  2 2 b
  4 4 d
  
  # X값이 짝수인 행의 2열만 데이터만 조회
  DF[DF$x %%2 == 0, 2]
  [1] "b" "d"
  ```

  1) 데이터프레임명 [c(T/P,...), T/F(디폴트는 '행'을 기준으로 )]

  2) '$'표시를 통해 데이터프레임의 특정 컬럼을 지정할 수 있음



4. 데이터프레임에서 컬럼 추가

```R
데이터프레임명$컬럼명 <-C(값1,값2...)
```

```R
데이터프레임명$컬럼명 <-벡터명
```



### 05. array

1. array의 정의

- matrix와 array의 차이

``` R
matrix + page 의 개념
- matrix : 행과 열을 가지는 2차원
- array : 행과 열 그리고 page를 가지는 3차원
```



2. array 생성

- 기본구문

```R
# array명 <- array(data,dim)
# dim(array명)<-c(행숫자, 열숫자, 페이지숫자)
```

```r
z <- c(1:48)
arr <- array(z,c(4,4,3))
arr
     [,1] [,2] [,3] [,4]
[1,]    1    5    9   13
[2,]    2    6   10   14
[3,]    3    7   11   15
[4,]    4    8   12   16

, , 2

     [,1] [,2] [,3] [,4]
[1,]   17   21   25   29
[2,]   18   22   26   30
[3,]   19   23   27   31
[4,]   20   24   28   32

, , 3

     [,1] [,2] [,3] [,4]
[1,]   33   37   41   45
[2,]   34   38   42   46
[3,]   35   39   43   47
[4,]   36   40   44   48

class(arr)
[1] "array"
```

```R
ary <- array(1:12 , dim = c(2,2,3) ) 
ary
     [,1] [,2]
[1,]    1    3
[2,]    2    4

, , 2

     [,1] [,2]
[1,]    5    7
[2,]    6    8

, , 3

     [,1] [,2]
[1,]    9   11
[2,]   10   12


class(ary)
[1] "matrix" "array" 
```



3. array index

- 기본구문

```R
# array명[행,열,페이지]
```

```R
ary[1,1,3]
[1] 9

```

- 배열파악

```R
> dim(iris3)
[1] 50  4  3

> mode(iris3)
[1] "numeric"

> class(iris3)
[1] "array"
```



### 06.list

1. list 개념

- 모든 타입을 원소로 가질 수 있다 



2. list 생성

```R
lis <- list(c(1,2,3), "abc", "192")
[[1]]
[1] 1 2 3

[[2]]
[1] "abc"

[[3]]
[1] "192"
```

```r
tmpList <- list(name="홍길동" , height=178)
tmpList
$name
[1] "홍길동"

$height
[1] 178

tmpList$name
[1] "홍길동"

tmpList$height
[1] 178

mode(tmpList)
[1] "list"

class(tmpList)
[1] "list"
```



3. list index

- [] 와 [[]] 이용

```R
tmpList[1]
[1] "홍길동"
```



4. list 키-값 추가&제거

- 새로운 key, value 추가

```r
tmpList$id <- c("hgd123")
tmpList

$name
[1] "홍길동"

$height
[1] 178

$id
[1] "hgd123"
```

- key 제거

```
tmpList$id <- NULL
```



## DAY03

### 01. list

1. list 개념

- 모든 타입을 원소로 가질 수 있다 

  

2. list 생성

```R
lis <- list(c(1,2,3), "abc", "192")
[[1]]
[1] 1 2 3

[[2]]
[1] "abc"

[[3]]
[1] "192"
```

```r
tmpList <- list(name="홍길동" , height=178)
tmpList
$name
[1] "홍길동"

$height
[1] 178

tmpList$name
[1] "홍길동"

tmpList$height
[1] 178

mode(tmpList)
[1] "list"

class(tmpList)
[1] "list"
```



3. list indexing

- [] 와 [[]] 이용
- [[]] : 리스트의 해당번째에 있는 데이터를 가져옴
- []: 이름과 함께 데이터를 가져옴
- [ [2] ]] [2,1]: 두번째 리스트인 매트릭스에서 2행 1열의 값을 가져옴
- list명[[c(1,3)]]: list[[1]]번의 3번째 값을 가져옴 

```R
lis01 <- list(name = c("홍길동", "홍길순"),
              age = c(25,24),
              mat = matrix(1:9,3,3))
$name
[1] "홍길동" "홍길순"

$age
[1] 25 24

$mat
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

lis01$name
[1] "홍길동" "홍길순"

lis01$age[2]
[1] 24

lis01 [[3]][2,2]: lis01의 세번째 리스트의 2행 2열 값을 가져옴
[1] 5

lis01[[c(1,2)]]: lis01의 첫번째 리스트의 두번째 값을 가져옴
[1] "홍길순"

lis01[c(1,2)]: lis01의 첫번째, 두번째 리스트를 가져옴
$name
[1] "홍길동" "홍길순"

$age
[1] 25 24
```



4. list 키-값 추가&제거

- 새로운 key, value 추가

```r
tmpList$id <- c("hgd123")
tmpList

$name
[1] "홍길동"

$height
[1] 178

$id
[1] "hgd123"
```

- key 제거

```
tmpList$id <- NULL
```



### 02. 행렬관련

1. 행렬 갯수 파악

```R
nrow(): 행 갯수
ncol(): 열 갯수
```



2. 행렬 이름 지정

```
rownames() <- c("행이름1", "행이름2"..)
colnames() <- c("열이름1", "열이름2"..)
```



3. 행렬 추가

```
x <- cbind(x,열추가1)
x <- rbind(x, 값1,값2,값3)
```



###  03. factor 

1. factor의 개념

- vector 의 한 종류로 범주(level)가 있는 vector
- 순서가 있는 factor(순위형데이터), 순서 없는 factor(명목형 데이터)가 있음



2. factor 생성

```R
data <- c('A','B','AB','A','O','B')
fact <- factor(data)

[1] A  B  AB A  O  B 
Levels: A AB B O
```



3. factor로 변환

```R
# vector -> factor
change <- factor(fact)
change

[1] A  B  AB A  O  B 
Levels: A AB B O
```



4. level

```R
nlevels(fact): 범주 수 
[1] 4

levels(fact): 범주
[1] "A"  "AB" "B"  "O" 

is.factor(fact) 
[1] TRUE

ordered(fact) 
[1] A  B  AB A  O  B 
Levels: A < AB < B < Or
```



### 05. with

1. with 함수 

- 데이터프레임 또는 리스트내에 존재하는 필드에 손쉽게 접근하기 위한 함수

```
with( data , 표현식) 
with( data , tapply(계산하고자하는 vector, 기준 factor, 함수)) within()
```

2. with()

```r
mean(iris$Sepal.Length)
[1] 5.843333

mean(iris$Sepal.Width)
[1] 3.057333

--> with(iris, { print(mean(Sepal.Length))
             print(mean(Sepal.Width)) })
             
[1] 5.843333
[1] 3.057333
             
```



### 06. is.na () : 결측값 찾기, 결측값 제거

1. is.na()를 통한 결측값  찾기

- is.na(X) = X가 NA면 TRUE, 아니면 FALSE 반환
- !is.na()는 결측값이 아닌 레코드를 반환할 때 쓰임 

```R
# 결측값 제거가 필요한 경우
x <- data.frame(val=c(1,2,3,4, NA , 5, NA)) 
x

mean(x)

[1] NA
경고메시지(들): 
In mean.default(x) : 인자가 수치형 또는 논리형이 아니므로 NA를 반환합니다

#x의 레코드 값에 NA(결측값)이 섞여 있어, 계산을 하면 NA가 나온다 

#is.na를 이용한 결측값 찾기
is.na(x$val)
[1] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE

```



2. na.rm = T 를 통한 결측값 제거 

- 집계함수(mean, max, min, sum...)의 경우, na.rm = T 인수를 포함해 결측값을 제외한 집계 결과를 얻을 수 있음

```R
mean(x$val , na.rm = T)
[1] 3

median(x$val, na.rm = 	T)
[1] 3

#결측값 제거
x <- within(x ,
            val <- ifelse(is.na(val),
                         mean(x$val,na.rm = T),
                         val))
  val
1   1
2   2
3   3
4   4
5   3
6   5
7   3
```



## DAY04

### 01. if, else, ifelse 구문

1. if~else

- if(조건식){표현식}
- 조건식이 참이면 표현식을 실행하고 거짓이면 실행하지 않는 구조

```R
score <- 55 
if(score >= 60) {
  print("합격") 
} else {
    print("불합격")
  }

[1] "불합격"

grade <- ""
if (score >= 90) {
  grade <- 'A'
}else if (score >= 80) {
  grade <- 'B'
}else if (score >= 70) {
  grade <- 'C'
}else if (score >= 60) {
  grade <- 'D'
}else {
  grade <- 'F'
}

cat("당신의 점수는", score ,"점이고, 당신의 학점은", grade , "입니다")
sprintf("당신의 점수는 %d 이고 학점은 %s 입니다",score, grade)

당신의 점수는 55 점이고, 당신의 학점은 F 입니다
"당신의 점수는 55 이고 학점은 F 입니다"
```

2. if~else 활용예제

:question:주민등록번호를 가지고 성별을 구분한다면

```R
user.ssn <- "730910-1XXXXXX"
#str_sub(데이터, 시작문자열, 끝문자열)
gender <- substr(user.ssn, 8, 8)
if (gender == '1' | gender == '3') {
  print('남자')
} else {
  print('여자')
}
[1] "남자"
```



1. ifelse

- ifelse(조건, 참일 경우 출력값, 아닐경우 출력값)
- ifelse () : if와 else를 한번에 수행해주는 함수로, 조건 충족 여부에 따라 결과가 달라지는 분기함수
- ifelse는 파생변수를 만드는 mutata() 함수와 함께 활용되는 경우가 많음

```R
# user.ssn <- "730910-1XXXXXX"
# gender <- substr(user.ssn, 8, 8)
# | (= or)
ifelse( gender == '1' | gender == '3', '남자', '여자')

[1] "남자"
```



3. ifelse () 를 활용해 파생변수 생성

```R
# AGE50_YN 파생변수 생성, 추가 나이가 50초과이면 Y , 미만 N
# ifelse~

ex.data.frm <- ex.data.frm %>%
  mutate(AGE50_YN = ifelse(AGE > 50 , 'Y' , 'N'))

ex.data.frm
```



### 02. for, while 구문

#### 01.for문

1. for 기본구문

- for (var in seq) {expression}
- var(변수)가 seq(범위)만큼 expression을 반복함 

```R
#for(변수 in 반복범위){표현식}

sum(1:10)
# 1+2+3...+10
user.sum = 0
for(i in 1:10){
  user.sum <- user.sum + i
}
user.sum

[1] 55


#1~10 까지 홀수만 공백을 두고 출력
for(i in 1:10){
  if(i %% 2 != 0) {
    cat(i,'\t')
  }
}
1 	3 	5 	7 	9 


```

2. for문 활용예제

```R
#1~100사이의 홀수/짝수의 합을 출력한다면?

even <- 0 
odd <- 0 
for(idx in 1:100 ) {
  if(idx %% 2 == 0) {
    even <- even + idx
  }else {
    odd <- odd + idx 
  }
}
cat("even = " , even , " odd = " , odd)
```



#### 02. while문

1. while 기본구문

- while(조건){expression}
- 조건이 참일 경우,  expression(블록구문)을 수행함

```R
#while(조건){표현식}
i <- 1
while(i <= 10) {
  print(i)
  i = i + 1 #문장 마지막에 증감식을 필요로 함
}

[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
[1] 8
[1] 9
[1] 10

idx <- 1
while(idx <= 10) {
  idx = idx + 1 
  print(idx)  
  if(idx %% 2 != 0) {
    next
  }
  
}

[1] 2
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
[1] 8
[1] 9
[1] 10
[1] 11
```



###  03. 사용자 정의 함수

1. 사용자 정의 함수 

- 사용자가 직접 만드는 함수
- 필요한 변수를 생성 및 정의 -> 표현식 실행 -> 계산값 반환하는 형식 

```r
# 함수종류
#01
user.function <- function() {
  print('no input and no return')
}
user.function()

#02
user.function <- function(x) {
  print('input and no return')
  print(x)
}
user.function(1)

#03
user.function <- function(x , y) {
  print('input and return')
  return (x+y)
}
user.function(10, 5)

result <- user.function(10, 5)
result 

#04
user.function <- function() {
  print('no input and return')
  return ('맛점하세요~~')
}
result <- user.function()
result 
```

- 함수 선언 & 호출

```R
# 선언
new.user.func <- function(x, y) {
  cat("x = " , x , '\n')
  cat("y = " , y , '\n')
  result <- x + y
  return (result)
}

# 호출
result.sum <- new.user.func(y=5, x=10)
x =  10 
y =  5 

result.sum
[1] 15

new.user.func <- function(...) {
  args <- list(...)
  for(idx in args) {
    print(idx)
  }
}

new.user.func(1, 2 , 3)

[1] 1
[1] 2
[1] 3
```



2. 사용자 정의 함수 활용예제

```R
#결측치 비율을 계산하는 함수를 정의, 행 및 열별로 비율 계산

#함수정의
naMissFunc <- function(df) {
  sum(is.na(df)) / length(df)  * 100
}


rowMissPer <- apply(iris.df , 1 , naMissFunc)
colMissPer <- apply(iris.df , 2 , naMissFunc)

barplot(colMissPer)
```



## DAY05

### 01. doBy 패키지

**(summaryBy , orderBy , sampleBy)**

- 그룹에 대한 연산을 도와주는 함수를 포함하는 패키지

```R
#doBy 패키지 설치
install.packages('doBy')
library(doBy)
```

#### 01. summaryBy

-  원하는 컬럼의 값을 특정한 조건에 따라 요약(mean)
- summaryBy(컬럼, 데이터)

```R
#iris데이터 전체 컬럼값(.) 을 Species 를 기준(조건)으로 요약
summaryBy(. ~ Species, iris)

#iris데이터 전체 컬럼값(.) 을 Species 를 기준(조건)으로 요약
summaryBy(Sepal.Length ~ Species , iris)

```



#### 02. orderBy

```R
#iris 데이터 전체컬럼을(컬럼{생략가능} ~) Species를 기준으로 오름차순 정렬
orderBy( ~ Species , iris)

#iris 데이터 전체컬럼을(컬럼{생략가능} ~) Species 오름차순, Sepal.Length 내림차순 정렬
orderBy( ~ Species - Sepal.Length , iris)
```



#### 03. sampleBy

- sample()

```R
#1~10까지의 숫자 중 5개의 숫자 복원추출(replace = T)
sample(1:10 , 5, replace = T )
```

- sampleBy()

```R
#기본구문
sampleBy(
  formula, # 균등추출이 필요한 컬럼
  frac = 0.1, #복원추출의 비율
  replace = FALSE, #복원추출 여부
  data = parent.frame()) #원본데이터
```



## DAY06

### 01. plyr, dplyr 패키지

 filer()/select()/mutate()/arrange()/group_by()/summarise()

#### 1. 패키지 설치

```R
install.packages(c("plyr" , "dplyr" , "hflights"))
library(plyr)
library(dplyr)
library(hflights)

#hflights: 휴스턴에서 출발하는 모든 비행기의 이착륙기록(2011)
str(hflights)
head(hflights)
flight.df <- hflights

#as_tibble()
#행과 열의 갯수를 알려주고, 데이터 내 변수가 어떤 자료형인지 쉽게 파악 가능

flight.tbl <- as_tibble(flight.df)
flight.tbl

# A tibble: 552 x 21
    Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier
   <int> <int>      <int>     <int>   <int>   <int> <chr>        
 1  2011     1          1         6    1400    1500 AA           
 2  2011     1          1         6     728     840 AA           
 ...
```



#### 2. filter()

1) filter() : 조건에 맞는 행만 필터링해 추출하는 함수 

2) 기본구문

```r
#filter(data,
       조건식)
```

3) 활용예제

```R
#1월 1일의 데이터만 추출
filter(flight.tbl, Month == 1 , DayofMonth == 1)

  <int> <int>      <int>     <int>   <int>   <int> <chr>        
 1  2011     1          1         6    1400    1500 AA           
 2  2011     1          1         6     728     840 AA     
 ....

#1월 또는 2월 정보만 추출
filter(flight.tbl , Month == 1 | Month == 2 )

   <int> <int>      <int>     <int>   <int>   <int> <chr>        
 1  2011     1          1         6    1400    1500 AA           
 2  2011     1          2         7    1401    1501 AA      ....
```



#### 3. select()

1) 특정 컬럼만 선택해서 추출

```r
#select(테이블, 선택컬럼)
select(flight.tbl , Year, Month )

    Year Month
   <int> <int>
 1  2011     1
 2  2011     1
```



#### 4. mutate()

1) 새로운 컬럼 추가 - 파생변수 

```R
# ArrDelay - DepDelay 를 구하는 gain 컬럼 추가

str(flight.df)

mutate(flight.tbl , 
       gain = ArrDelay - DepDelay )
```



#### 5. arrange()

1)  arrange():  정렬함수

- 기본설정은 오름차순

2) 활용예제

```r
#월 기준 오름차순 
arrange(flight.tbl , Month)

    Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier
   <int> <int>      <int>     <int>   <int>   <int> <chr>        
 1  2011     1          1         6    1400    1500 AA           
 2  2011     1          2         7    1401    1501 AA           
 3  2011     1          3         1    1352    1502 AA    

#월 기준 내림차순
arrange(flight.tbl , desc(Month))

select(flight.tbl , Year , Month , DayofMonth)
select(flight.tbl , -c(Year , Month , DayofMonth))
select(flight.tbl , (Year:DayofMonth))
select(flight.tbl , -(Year:DayofMonth))
```



#### 6. group_by()

1) 그룹함수

```R
#항공기별(TailNum) 평균 비행거리(Distance)를 구하시오
gr <- group_by(flight.df , TailNum)
str(gr)

tmp.df <- summarise(gr, 
                    mean(Distance, na.rm = T))

  TailNum  `mean(Distance, na.rm = T)`
   <chr>                          <dbl>
 1 ""                              939.
 2 "N0EGMQ"                       1095.
 3 "N10156"                        802.
 4 "N10575"                        632.
```



#### 7. summarise()

1)  요약함수

```r
#출발지연시간 DepDelay 의 평균 및 합계
summarise(flight.df , 
          avg = mean(DepDelay, na.rm = T),
          sum = sum(DepDelay, na.rm = T))

       avg     sum
1 9.444951 2121251

tmp.df <- summarise(planes.df , 
                    count = n() , 
                    dis = mean(Distance , na.rm = T) , 
                    delay = mean(ArrDelay , na.rm = T) )
tmp.df

   TailNum  count   dis  delay
   <chr>    <int> <dbl>  <dbl>
 1 ""         795  939. NaN   
 2 "N0EGMQ"    40 1095.   1.92
 3 "N10156"   317  802.   8.20
 4 "N10575"    94  632.  18.1 
```



#### 8. chain()함수

1) %>%  조작을 연결해 한 번에 수행하는 함수 

2) 단계별 설명

```R
str(light.df)

# 단계1 그룹화 (group_by)  
# Year, Month, DayofMonth 의 수준별 그룹화
tmp01 <- group_by(flight.df , Year, Month, DayofMonth)
tmp01

# 단계2 출력 (select) 
# Year 부터 DayofMonth , ArrDelay , DepDelay 열 선택
tmp02 <- select(tmp01 , Year:DayofMonth , ArrDelay , DepDelay)
tmp02
# 단계3 요약(연산) (summarise)
#평균연착시간(arr)과 평균출발지연시간(dep)을 구한다 
tmp03 <- summarise(tmp02,
                   arr = mean(ArrDelay, na.rm = T),
                   dep = mean(DepDelay, na.rm = T))
tmp03

# 단계4 필터링(조건주기) (filter)
# 평균 연착시간과 평균 지연시간이 30분 이상인 데이터만 추출
tmp04 <- filter(tmp03, arr > 30 | dep > 30)
tmp04
```

3) chain함수 (%>%) 활용

```r
flight.df %>% 
  group_by(Year , Month , DayofMonth) %>%
    dplyr::select(Year:DayofMonth , ArrDelay , DepDelay) %>%
      dplyr::summarise(arr = mean(ArrDelay , na.rm = T) , 
                dep = mean(DepDelay , na.rm = T)) %>%
        filter(arr > 30 | dep > 30)
```



## DAY07

**외부파일(csv, xls , txt)데이터의 가공 및 시각화**

### 01. 외부파일(csv, xls , txt)데이터 설치 및 가공

#### 1. 패키지 설치(readxl) 및 데이터 로드

1. 설치

```R
install.packages('readxl')

library(readxl)
```

- read_excel() - xl파일

- read_table() - txt파일

- read_csv() - csv파일

  

2. 데이터로드 및 열 이름 부여

````R
tmp.xl <- read_excel(file.choose())

class(tmp.xl)

 

tmp.txt <- read.table(file.choose(),

​           header = T, 열 이름(헤더) 부여여부

​           nrows = 7, 출력하고자하는 행수

​           sep = "\t") 공백값 지정

tmp.txt

````



3. tbl -> 데이터프레임으로 변환

````R
ex.data <- read_excel(file.choose())

ex.data.frm <- as.data.frame(ex.data)

str(ex.data.frm)

````



4. 변수값 factor로 변환

```R
# SEX,AREA(char) 를 factor로 변환

ex.data.frm$SEX <- as.factor(ex.data.frm$SEX)

ex.data.frm$AREA <- as.factor(ex.data.frm$AREA)
```

 

#### 2.데이터 가공

- 다양한 데이터 가공 예제

```R
#[ chain %>% , group_by , summarise ] , split

library(dplyr)

names(ex.data.frm)



#1) 성별에 따른 AMT17 평균 이용금액

#- split, sapply 활용

split(ex.data.frm$AMT17, ex.data.frm$SEX)

 

sapply(split(ex.data.frm$AMT17, ex.data.frm$SEX),

​    mean, na.rm = T)

 

# - %>% 활용

ex.data.frm %>%

 group_by(SEX) %>%

 summarise(mean17 = mean(AMT17))

 

#2) 지역에 따른 Y17_CNT 이용건수의 합

ex.data.frm %>%

 group_by(AREA) %>%

 summarise(SUM17 = sum(Y17_CNT))

 

#3) 새로운 파생변수 추가(AMT합, CNT합)

ex.data.frm %>%

 mutate(sumamt = Y17_AMT + Y16_AMT , 

​     sumcnt = Y17_CNT + Y16_CNT)

#4) AGE50_YN이라는 변수(나이가 50 초과면 Y, 아니면 N)추가

ex.data.frm %>%

 mutate(AGE50_YN = ifelse(ex.data.frm$AGE > 50 , 'Y', 'N'))

 

#5) 변수명 변환AMT17 -> , AMT16 -> Y16_AMT 

?rename

ex.data.frm <- rename(ex.data.frm , AMT17 = Y17_AMT , AMT16 = Y16_AMT )

 
```



#### 3.데이터 결합

- 두개의 파일을 로드

- 가로결합 join()

- inner join , left join, right join , full join

- inner.df <- join(tmp.x.df , tmp.y.df , by='id' , type='xxxxxx')

- left_join() , inner_join() , full_join()

```R
m.history <- read_excel(file.choose())

f.history <- read_excel(file.choose())

m.history <- as.data.frame(m.history)

f.history <- as.data.frame(f.history)

library(plyr)

 

m.f.history <- join(m.history, f.history ,by='ID', type='full')
```



1. 외부데이터 가공 예제2

 ````r
 
 
 #1. m.f.history.df 데이터 세트에서 ID 변수만 추출
 
 select(m.f.history.df, ID)
 
  
 
 #2. m.f.history.df 데이터 세트에서 ID, AREA, Y17_CNT 변수 추출
 
 select(m.f.history.df, ID, AREA, Y17_CNT)
 
  
 
 #3. m.f.history.df 데이터 세트에서 AREA 변수만 제외하고 추출
 
 select(m.f.history.df, -AREA)
 
  
 
 #4. m.f.history.df 데이터 세트에서 AREA, Y17_CNT 변수를 제외하고 추출
 
 select(m.f.history.df, -c(AREA,Y17_CNT))
 
  
 #5. m.f.history.df 데이터 세트에 AREA(지역)가 서울인 경우만 추출
 
 m.f.history.df %>%
 
  filter(AREA == '서울')
 
  
 
 #6. m.f.history.df 데이터 세트에서 AREA(지역)가 서울이면서 
 
   Y17_CNT(17년 이용 건수)가 10건 이상인 경우만 추출 
 
 m.f.history.df %>%
 
  filter(AREA == '서울',
 
 ​     Y17_CNT >= 10)
 
  
 #7. m.f.history.df 데이터 세트의 AGE 변수를 오름차순 정렬
 
 m.f.history.df%>%
 
  select(AGE) %>%
 
  arrange(AGE)
 
  
 
 #8. m.f.history.df 데이터 세트의 AMT17 변수를 내림차순 정렬
 
 m.f.history.df%>%
 
  select(AMT17) %>%
 
  arrange(desc(AMT17))
 
  
 
 #정렬 중첩 
 
 #9. m.f.history.df 데이터 세트의 AGE 변수는 오름차순, Y17_AMT 변수는 내림차순 정렬
 
 m.f.history.df%>%
 
  select(AGE,AMT17) %>%
 
  arrange(AGE, -AMT17)
 
  
 
 #데이터 요약하기
 
 #10. m.f.history.df 데이터 세트의 Y17_AMT(17년 이용 금액) 변수 값 합계를
 
  TOT_Y17_AMT 변수로 도출
 
 m.f.history.df %>%
 
  mutate(TOT_Y17_AMT = sum(AMT17))
 
  
 
 #11. m.f.history.df 데이터 세트의 AREA(지역) 변수 값별로 
 
  Y17_AMT(17년 이용 금액)를 더해 SUM_Y17_AMT 변수로 도출
 
 m.f.history.df %>%
 
  group_by(AREA) %>%
 
  mutate(SUM_Y17_AMT = sum(AMT17))
 
  
 
 #::나이분류
 
 #12. m.f.history.df 데이터 세트의 
 
 #AGE 값이 50 이상이면 “50++”, 
 
 #40 이상이면 “4049”
 
 #30 이상이면 “3039”, 
 
 #20 이상이면 "2029”, 
 
 #나머지는 “0019”를 값으로 하는 AGE_GR10 변수 생성
 
  
 
 m.f.history.df$AGE_GR10 <- ifelse(m.f.history.df$AGE >=50 , '50++' , 
 
 ​                 ifelse(m.f.history.df$AGE >=40 , '4049' ,
 
 ​                     ifelse(m.f.history.df$AGE >=30 , '3039' ,
 
 ​                        ifelse(m.f.history.df$AGE >=20 , '2029' ,'0019'))))
 
  
 
 str( m.f.history.df )
 
 ?summarise
 
  
 
 m.f.history.df %>% 
 
  group_by(AREA) %>% 
 
  dplyr::summarise(SUM_Y17_AMT=sum(AMT17))
 
  
 
 m.f.history.df
 ````



### 02. 외부파일 데이터 시각화

*데이터 시각화 패키지 설치

```R
library(ggplot2)
```

*빈도분석패키지(descr)설치

```R
install.packages('descr')
library(descr)
?freq
freq(m.f.history.df$AREA, plot = T)
freqGender <- freq(m.f.history.df$SEX , plot = T)

barplot(freqGender)
```



#### 1. 이산변수 시각화

- 이산변수: 명목변수 / 순위변수
- 시각화 방법: 막대, 점, 파이

```R
chart.data <- c(380, 520, 330, 390, 320, 460, 300, 405)
names(chart.data) <-c("2020 1Q","2020 2Q","2020 3Q","2020 4Q","2021 1Q","2021 2Q","2021 3Q","2021 4Q")

chart.data
range(chart.data) # 최소값과 최대값
max(chart.data) # 최대값
min(chart.data) # 최소값
length(chart.data) 
```

1)  막대차트(barplot())

```R
barplot(chart.data , 
        xlim = c(0, 600), # x축 최소, 최대값 지정 
        col  = rainbow(8) , # 색상
        main = '2020 vs 2021' , # 제목지정
        horiz = T , # 가로방향
        ylab  = '년도별 현황' , # y축 제목 
        xlab  = '매출 현황') # x축제목
```



2) 점차트(dotchart)

```R
dotchart(chart.data , 
         color = c('green' , 'red') , # 색상
         lcolor = 'blue' , # 선컬러 
         pch = 1:3 ,  # 모양
         xlab = '매출액' , 
         cex = 0.8, #크기
         main = '2020 vs 2021')
```



3) 파이 (pie())

```R
pie(chart.data ,
    labels = names(chart.data) , 
    border = 'blue' , 
    col = rainbow(8),
    cex = 1.5)
```



#### 2. 연속형 변수 시각화

- 연속형 변수 : 변수가 연속된 구간을 가지고 있다는 의미
- 종류 : 간격변수, 비율변수
- 상자, 히스토그램, 산점도

1) 상자(boxplot())

```R
iris
pie(table(iris$Species))

*table(테이블$컬럼명) : 빈도수 확인

barplot(table(m.f.history.df$SEX),
        names = c('남자','여자'),
        main = '성별빈도' , 
        xlab = 'gender' , 
        ylab = 'cnt')

boxplot(m.f.history.df$Y17_CNT , m.f.history.df$Y16_CNT)
```




2) 히스토그램(hist())

```R
hist(iris$Sepal.Length , 
     xlab = '꽃받침길이',
     ylim = c(0, 40))
```



3)산점도(plot())

* 난수(random number)생성(runif)

```R
x <- runif(5, min = 0 , max = 1)
y <- x^2

plot(x, y , type = 'l')
plot(x, y , type = 'o' , pch = 25)
plot(x, y , type = 'h')
plot(x, y , type = 's')
```



4)산점도 매트릭스

```R
pairs(iris[1:4])
```



5)3차원 산점도

```r
install.packages('scatterplot3d')
library(scatterplot3d)
?scatterplot3d

scatterplot3d(iris$Sepal.Length , 
              iris$Petal.Length , 
              iris$Sepal.Width , type = 'p' , 
              color = c('red'))
```



## DAY08

데이터 시각화

ggplot() + 

geom_point()/geom_line()/geom_boxplot()/geom_histogram()/geom_bar()

```R
# ggplot()
# geom_XXXXXXX (그래프, 도형)
# coord_XXXXXX (옵션)

# ggplot()
# aes(x축변수 , y축변수)
# geom_point() : 산점도
# geom_line() : 선 그래프
# geom_boxplot() 
# geom_histogram()
# geom_bar()

# ggplot() + geom_xxxx() + coord_xxx()
```



#### 1. 산점도(점그래프)

- ggplot(), geom_point()

1) 산점도 기본구문

```R
ggplot(data, # 객체이름
        mapping = aes(x = x축지정, # 컬럼x
                      y = y축 지정))+ # 컬럼y 
  geom_point(colours = 'red' , 
             pch = 4 ,
             size = 1)

```

- 자주 사용되는 Argument

| **Argument** | **활용예제**   | **의미**                                             |
| ------------ | -------------- | ---------------------------------------------------- |
| **data**     | data=객체이름A | 데이터프레임 객체                                    |
| **x**        | x=컬럼이름X    | 그래프 x변수                                         |
| **y**        | y=컬럼이름Y    | 그래프 y변수                                         |
| **size**     | size=숫자      | 산점도 점 크기                                       |
| **color**    | color=컬럼이름 | 산점도 점의 색상                                     |
| **shape**    | shape=컬럼이름 | 산점도에나타난 점의 모양                             |
| **alpha**    | alpha=0.5      | 점의 투명도(alpha=1,완전 불투명 / Aplha=0,완전 투명) |
| ***pch***    | pch = 숫자     | 점의 모양                                            |



2) 제목, 축이름 설정

```R
# 산점도 만들기
g <- ggplot(data = iris , 
            mapping = aes(x = Sepal.Length , 
                          y = Sepal.Width)) +
  geom_point(colour = c('red','blue','green')[iris$Species] , 
             pch  = c(0,2,20)[iris$Species] , 
             size = c(1,1.5,2)[iris$Species] )

# 제목, 축 이름 설정
g + labs(title    = '제목' , 
         subtitle = '부제목' , 
         caption  = '주석' , 
         x = 'x축의 이름' , 
         y = 'y축의 이름')
```

3) 산점도 그리기 예시

```R
tmp.df <- data.frame(
  years = c(2015, 2016, 2017, 2018, 2019, 2020, 2021) , 
  gdp   = c(300, 350, 400, 450, 500, 550, 600)
)

tmp.df

ggplot(data = tmp.df , 
       aes(x = years , y = gdp)) +
  geom_point(color = 'red',
             pch = 2 ,
             size = 3) +
  geom_line(linetype = 'dashed')
```

#### 2. 영역차트

- ggplot + geom_area

1) 영역차트 구문

```r
ggplot(uspopage , 
       aes(x = Year , y = Thousands , fill=AgeGroup)) +
  geom_area(color = 'black' , 
            size   = 1 , #선사이즈 
            alpha  = 0.4)
```

#### 3. 막대그래프

- geom_bar()

```r
1) 막대그래프 구문

tmp.df <- data.frame(
  movies = c('강철비2' , '발신제한' , '아바타' , '크루엘라' , '루카'),
  cnt    = c(5, 11, 3, 8, 10)
)

# 01
ggplot(data = tmp.df , 
       aes(x = movies , y = cnt)) +
  geom_col(col = 'blue' , width = .4 , fill = 'red') + 
  ggtitle('bar chart')

# 02
library(MASS)
str( Cars93 )

ggplot(data = type.cnt.df , 
       aes(x = Type , y = cnt)) +
  geom_bar(stat = 'identity' , fill = 'yellow' , col='red') +
  ggtitle('bar chart using type')

```

#### 4.히스토그램

- geom_histogram()

- 데이터 생성

  ```R
  hist.df <- data.frame(
  gender = factor(rep(c('F' , 'M') , each = 200)),
  weight = round( c( rnorm(200 , mean=55 , sd=5) , rnorm(200 , mean=65 , sd=5) ))
  )
  ```

  

- 히스토그램 생성

  ```r
  ggplot(hist.df) +
  geom_histogram(aes(x = weight, fill = gender),
                 bins = 10, # 구간의 개수
                 binwidth = 5) # 구간의 넓이 
  ```
  
  

#### 5. 박스플롯

- geom_boxplot()

```R
ggplot(data = data3) +
  geom_boxplot(aes(x = num , y=weight) , 
               outlier.color = 'red' , 
               outlier.shape = 24 , 
               outlier.size  = 2) +
  coord_flip() # 가로방향으로 변경
```

- 박스플롯Argument

| **Argument**       | **사용예시**                             | **의미**                                                   |
| ------------------ | ---------------------------------------- | ---------------------------------------------------------- |
| **data**           | data=데이터프레임명                      | 데이터프레임 지정                                          |
| **x, y**           | mapping=aes(x=컬럼X, y=컬럼Y)            | x, y 변수 지정- 한쪽은 범주형(factor), 한쪽은 연속(number) |
| **fill**           | mapping=aes(fill=컬럼명) /  fill=''색상' | 박스플롯 채우기 (색상                                      |
| **color**          | color='색상'                             | 박스플롯 테두리 색상                                       |
| **outlier.color**  | outlier.color='색상'                     | outlier의 테두리 색상 지정                                 |
| **outlier.fill**   | outlier.fill='색상'                      | outlier의 채우기 색상 지정                                 |
| **outlier.shape**  | outlier.shape=숫자K                      | outlier의 모양 지정                                        |
| **outlier.size**   | outlier.size=숫자K                       | outlier 점의 크기 지정                                     |
| **outlier.stroke** | outlier.stroke=숫자K                     | outlier 점의 테두리 두께 지정                              |
| **outlier.alpha**  | outlier.alpha=숫자K                      | outlier 점의 투명도 지정. (0~1 사이)                       |





### DAY11

#### 01. 정형 데이터 처리

1. 패키지 설치

```R
install.packages('rJava')
install.packages('DBI')
install.packages('RJDBC')

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_121')

library(rJava)
library(DBI)
library(RJDBC)
```



2. 데이터베이스 연동

1) driver loading 

```r
driver <- JDBC(driverClass = 'oracle.jdbc.driver.OracleDriver',
               classPath   = 'C:\\oraclexe\\app\\oracle\\product\\11.2.0\\server\\jdbc\\lib\\ojdbc6.jar')

```

2) connection(오라클 연동)

```r
conn <- dbConnect(driver , 
                  'jdbc:oracle:thin:@localhost:1521:xe' , 
                  'hr' , 
                  'hr')

select.sql <- 'select * from employee'
```



3.  쿼리수행

```r
# dbGetQuery() : select 

emp.tbl <- dbGetQuery(conn , select.sql)
str(emp.tbl)

> str(emp.tbl)
'data.frame':	22 obs. of  13 variables:
 $ EMP_ID   : chr  "100" "101" "102" "103" ...
 $ EMP_NAME : chr  "한선기" "강중훈" "최만식" "정도연" ...
 $ EMP_NO   : chr  "621133-1483658" "621136-1006405" "861011-1940062" "631127-2519077" ...
 $ EMAIL    : chr  "sg_ahn@vcc.com" "jh_park@vcc.com" "ms_choi@vcc.com" "sy_kang@vcc.com" ...
```

```r
# dbSendUpdate() : DML(insert, update , delete) , DDL(create , drop , alter)

create.tbl <- 'create table r_tbl(
  id  varchar2(20) primary key , 
  pwd varchar2(20) not null,
  username varchar2(50) not null , 
  upoint   number       default 100
)'

dbSendUpdate(conn , create.tbl)
```

```r
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
```

```r
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
```

```r
# 파생변수로 gender 추가

emp.tbl$gender <- ifelse(str_sub(emp.tbl$EMP_NO , 8 , 8) == 1 | str_sub(emp.tbl$EMP_NO , 8 , 8) == 3 , 'M', 'F')

```

```R
# 성별에 따른 급여 평균 구한다면?
library(dplyr)
emp.tbl %>% 
  group_by(gender) %>%
  dplyr::summarise(mean.sal = mean(SALARY))
  
    gender mean.sal
  <chr>     <dbl>
1 F      2257500 
2 M      3364286.

# 시각화
# bar()

library(ggplot2)
ggplot(genderGroupMean , 
       aes(x = Group.1 , y = x , fill = Group.1)) +
  geom_bar(stat = 'identity')

```



#### 02.비정형데이터 처리

