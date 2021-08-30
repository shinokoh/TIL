**PYTHON BASIC**



# DAY 01

## 01. 기본구조

주석문&출력문(자릿수 지정, 정렬, 절삭)(print, format, sep, end )

1) 주석문

- '#' 문자로 주석을 달 수 있다 

- '"' "' 문자로 주석을 달 수 있다 

```python

# 주석처리

'''
주석처리가
될까요?
'''

해석기는 주석 부분을 무시합니다 
```



2)  출력

- print 명령
- print(출력내용 [ , sep = 구분자] [ , end = 끝 문자])
- 괄호 안에 상수, 변수, 수식 등 출력 내용 입력

```python
print('010','1234','5678', sep = '-')
> 010-1234-5678

print('qwer1234', 'naver.com', sep = '@')
> qwer1234@naver.com

print('welcome to' , end = ' ')
print('python world')
> welcome to python world
```



- format 함수

```python
print('{} {}'. format('one','two'))
> one two

print('{1} {0}'.format('one','two')) #인덱스로 숫자 지정도 가능
> two one

print('%s %d' % ('one', '100')) # %s: 문자 / %d: 숫자
# 숫자 자리에 문자를 넣어 에러가 뜸
```



- 자리수 지정

```python
print('%10s%' % 'python') # 문자 10자리 지정
>     python

print('%-10s%' % 'python') 
> python  

print('%5s%' % 'hellopython') # 지정문자수보다 출력문자 수 초과 시 모두 출력
> hellopython

print('%d' % 100) 
> 100

print('%1.3f' % 3.14159) # 총 한 자리고 소수점 셋째자리까지 표현
> 3.142
```



- 정렬

```python
print('{:>10}'.format('nice')) # :> 오른쪽 정렬, 총 10자리 
>       nice

print('{:<10}'.format('nice')) # :< 왼쪽 정렬, 총 10자리
> nice      

print('{:^10}'.format('nice')) # :^ 중앙 정렬, 총 10자리
>    nice   

print('{:_<13}'.format('990101-')) # 공백은 '_'로 채우고 왼쪽 정렬
> 990101-__________
```



- 절삭( . )

```python
print('%.5s' % 'pythonstudy') #총 다섯자리까지만 표시
> pytho

print('{:10.5}'.format('pythonstudy')) #총 10자리, 5자리까지만 출력
> pytho

print('{:.5}'.format('pythonstudy'))
> pytho

print('%4d' % 42) # 총 4자리 숫자
>   42

print('{:4d}'.format(42))
>  42
```



## 02. 변수(Variable)

파이썬 Built-In Types(기본 자료형) 변수 종류

```
- Numeric(숫자)
1) 정수(int)
2) 실수(float)
3) 복소수(complex)
- Sequence
- Text Sequence
- Set
- Mapping(dict , tuple)
1) 딕셔너리: {'key':'value , ..}
2) 튜플: ('CAR', 'BUS')
- Boolean : 참(true), 거짓(false) 두 개 값을 가지는 자료형
- Class(Object Oriented Programming)

변수 지정방법
- Camel  Case -> function , method (ex numberOfCollege)
- Pascal Case -> class (ex NumberOfCollege)
- Snake  Case -> variable , method , function (ex number_of_college)

주의사항
변수는 숫자로 시작할 수 없다
허용되는 특수문자 _ , $
예약어는 변수명으로 사용이 불가
```



1. 변수종류

```python
intValue = 123
floatValue = 3.14
boolValue = True
strValue = 'python'
print(type(intValue), type(floatValue),type(boolValue),type(strValue))
> <class 'int'> <class 'float'> <class 'bool'> <class 'str'>
```

- list

```python
list = ['홍길동' , 'hgd123', intValue ]
print(list , type(list))

> ['홍길동', 'hgd123', 123] <class 'list'>

print(list[0])

> 홍길동
```

- dict(key : value)

```python
dict = {
    "name" : "홍길동" ,
    "id" : "hgd123"
}

print(dict)

> {'name': '홍길동', 'id': 'hgd123'}
```

- 튜플

```python
tuple = (3, 5, 7)
print(tuple, type(dict))

> (3, 5, 7) <class 'dict'>
```

- set

```python
set = {5, 7, 8}
print(set, type(set))

> {8, 5, 7} <class 'set'>
```



2. 타입(형)변환

```python
numStr = "720"
numCnt = 100
print(numStr + str(numCnt))
> 720100

print( int(numStr) + numCnt )
> 820
```





## 03. 문자형 (string)

1. 인덱싱 및 슬라이싱

```python
seqTxt = 'Talk is cheap. Show me the code'
print(seqTxt , type(seqTxt) , len(seqTxt))
> Talk is cheap. Show me the code <class 'str'> 31

print(seqTxt[-1])
> e

print(seqTxt[0:4])
> Talk
```

- 인덱싱 및 슬라이싱 예제

```python
exStr = '홀짝홀짝홀짝홀짝홀짝홀짝'
# 홀만 출력한다면?
print(exStr[::2]) #0번 문자부터 2씩 건너뛰면서 출력
>홀홀홀홀홀홀

print(exStr[1::2]) #1번 문자부터 2씩 건너뛰면서 출력
> 짝짝짝짝짝짝
```



2. 문자 대체

```python
phone_number = "010.4603.2283"
print(phone_number , phone_number.replace("." , "-"))
> 10.4603.2283 010-4603-2283
```



3. 문자열 연산

```python
company_name = "   삼성전자   "
print(company_name * 4)
>   삼성전자      삼성전자      삼성전자      삼성전자

```



4. 공백삭제

```python
print(company_name.strip() , company_name.rstrip() , company_name.lstrip())
> 삼성전자    삼성전자 삼성전자

print(len(company_name.strip()) , len(company_name.rstrip()) , len(company_name.lstrip()))
> 4 7 7
```



5. 대, 소문자로 변환

```python
company_name = "samsung"
print(company_name.upper())
> SAMSUNG
```



6. 접미사로 문자 찾기 

```python
file_name = 'report.xls'

# 확장자가 xls인지 xlsx 인지 여부 확인?
file_name = 'report.xls'
print(file_name , file_name.endswith(('xls' , 'xlsx')) , type(file_name.endswith(('xls' , 'xlsx'))))
> report.xls True <class 'bool'>
```



7. 문자열 길이/문자 갯수/문자 찾기

```python
drinking = 'cocacola'
print( len(drinking) , drinking.count('c') , drinking.find('l') , drinking.index('a'))
> 8 3 6 3
```





# DAY 02

## 01. LIST

1. 리스트(list)

- 여러 변수들을 묶어 목록으로 만들 수 있는 자료형
- [](대괄호)를 사용하거나 list() 함수를 사용해서 만들 수 있음  

```R
# 리스트 생성
num_list = [1,2,3,4,5,6,7]
num_list = list(1,2,3,4,5,6,7)

print('최댓값: ',max(num_list))
print('최소값: ',min(num_list))
print('합계: ',sum(num_list))
print('평균: ',sum(num_list)/len(num_list))

> 최댓값:  7
> 최소값:  1
> 합계:  28
> 평균:  4.0
```



1) 리스트 식별자 확인

```python
list01 = [1,2,3]
list02 = [1,2,3]
print('객체 주소값 : ', id(list01), id(list02)) 
> 객체 주소값 :  1643226240000 1643226237632
    
# id(): 식별자 확인 함수
# is(): 비교, 객체 주소값을 비교하시오
print('객체 주소값 비교 : ', id(list01) is id(list02))
> 객체 주소값 비교 :  False
    
list03 = list01
print('object address : ' , id(list01) , id(list03) , list01 is list03)
> object address :  1643226240000 1643226240000 True
# 식별자가 같은 것을 확인할 수 있다

from copy import copy
list04 = copy(list01) #리스트의 복사
print(list04, list01 , id(list04), id(list01), id(list04) is id(list01))
> [1, 2, 3, 'jslim'] [1, 2, 3, 'jslim'] 1643184511552 1643226240000 False 
# 서로 다른 식별자를 가지고 있는 것을 확인할 수 있다
```



2) inner list

```python
a = ['a','b','c']
b = [10, 3.14, True , 'string' , a ]
print('inner list - ' , b[-1][1:] , type(b[-1][1:]))
> inner list -  ['b', 'c'] <class 'list'>
```



3) range 이용한 list 생성

- range 에 10 지정 시 0부터 9까지 숫자 생성

- 지정한 횟수의 숫자는 생성되는 숫자에 포함되지 않음
- 시작 인덱스와 끝 인덱스 간격부여할 수 있음

```python
# list(range(횟수)) / list(range(시작, 끝, 간격))
tmpRange = range(1, 11, 2) # 1번부터 11번까지 2씩 각격을 두면서 
print(list(tmpRange))
> [1, 3, 5, 7, 9]

print('range - ', tmpRange , 10 in tmpRange) # 지정 횟수 숫자는 생성된 숫자에 포함되지 않음 
> range -  range(1, 11, 2) False
```



- for과 range 응용

```python
for i in range(1, 11, 2) :
    print(i, end = '\t')

print()
> 1	3	5	7	9	

import random

tmpList = []
for i in range(5) : # 0~4까지 숫자 생성
    tmpList.append(random.randint(1,5)) # random.randint(시작, 끝) 시작부터 끝숫자까지 난수 생성

print(tmpList)
> [4, 1, 3, 1, 1]
```



4) list comprehension

- list 안 for 구문 포함
- 변수 = [실행문 for 변수 in 열거형객체]
- 변수 = [실행문 for 변수 in 열거형객체 if 조건식]

```python
x = [2,4,1,5,3]
for val in x :
    print(val)
>
2
4
1
5
3

# x중 3의 배수값에만 제곱을 해서 출력
result = [val ** 2 for val in x if val%3 == 0]
# 실행문 for in 열거형 객체
# 실행문 for in 열거형 객체 if 조건식
# 조건에 맞는 열거형 객체에 연산을 실행시켜주는 실행문
print('list comprehension ->' , result)
> list comprehension -> [9]

result = []
for val in x : # x 객체의 값을
    calc = val ** 2 # 제곱
    if calc%3 == 0 : # 제곱값이 3이 배수인 경우만
        result.append(calc) # 리스트에 추가

print(result)
> [9]

# 예제. 1에서 100까지의 숫자 중 3의 배수만 출력

exlist = []
for i in range(1,101) :
    if i%3 == 0 :
        exlist.append(i)
print(exlist)
> [3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99]

# 리스트  = [ 실행문 for ~ in 열거형객체 if 조건식]
exlist = [ i for i in range(1,101)  if i%3 == 0]
print('list com -> ', exlist)
> list com ->  [3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99]

```



## 02. TUPLE

1. 튜플명  = (요소1, 요소2, ... 요소n)

- 순서와 중복이 존재 -> 인덱싱과 슬라이싱이 가능
- 수정과 삭제는 불가능 -> 읽기 전용(실수로 수정 및 삭제되지 않아 유용)
- 튜플명 =() 또는 tuple () 함수를 사용해 생성할 수 있다

1) tuple 생성

```python
myTuple = (1)
print(myTuple, type(myTuple))
> 1 <class 'int'> # 하나의 값만 넣으면 그냥 숫자로 인식

myTuple = (1, )
print(myTuple, type(myTuple))
(1,) <class 'tuple'>


```

- 인덱싱도 가능

```python
# 인덱싱도 가능하다
myTuple = (1,2,3,4,4,5)
print(myTuple[0:3], type(myTuple[0:3]))
> (1, 2, 3) <class 'tuple'>
```

- 수정 및 삭제 불가능

```python
# 수정 및 삭제는 불가능
myTuple[0] =  10 --> 에러가 뜸
> TypeError: 'tuple' object does not support item assignment

# list로 형변환 후 수정 가능 
myList = list(myTuple)
myList[0] = 10
print(myList)
> [10, 2, 3, 4, 4, 5]
```



## 03. SET

1. set : 집합 자료형

- 집합명 = set([원소1, 원소2 , ... 원소n])

- 순서와 중복 모두 없음 -> 인덱싱, 슬라이싱 불가능
- set명 = {} 또는 set([]) 함수로 생성 가능4

1) set 집합 생성

```python
# {} 생성
tmpSet = {1,2,3,3,3,3,3,3,'jslim'}
print( tmpSet , type(tmpSet) )
> {'jslim', 1, 2, 3} <class 'set'>

# 
tmpSet = set([1,2,3,3,3,3,3,3,'jslim'])
print( tmpSet , type(tmpSet) )
> {1, 2, 3, 'jslim'} <class 'set'>
```



2. 집합연산

1) 교집합(intersection)

```python
s01 = set([1,2,3,4,5,6])
s02 = set([4,5,6,7,8,9])

print('교집합(intersection) & ' , s01.intersection(s02)  , s01&s02)

> 교집합(intersection) &  {4, 5, 6} {4, 5, 6}
```

2) 합집합(union)

```python
s01 = set([1,2,3,4,5,6])
s02 = set([4,5,6,7,8,9])

print('합집합(union) ' , s01.union(s02)  , s01|s02)
> 합집합(union)  {1, 2, 3, 4, 5, 6, 7, 8, 9} {1, 2, 3, 4, 5, 6, 7, 8, 9}
```

3) 차집합(difference)

```python
s01 = set([1,2,3,4,5,6])
s02 = set([4,5,6,7,8,9])

print('차집합(difference) - ' , s01.difference(s02)  , s01-s02)

> 차집합(difference) -  {1, 2, 3} {1, 2, 3}

```



3. set(집합)을 이용한 중복제거

- 중복이 없는 set의 특성을 활용해 중복제거 가능

```python
gender  = ['남','남','남','여','남','여','남','여','남','여','여']
sgender = set(gender)
print('중복제거 - ' , sgender)

> 중복제거 -  {'남', '여'}
```









## 04. DICT

1. 딕셔너리명 = { key1 : value1 , key2 : value2, ... keyn : valuen  }

- 사전이란 의미로 key 와 value값을 묶어놓은 구조
- 순서가 없음 -> 인덱싱 불가 
- key값 중복 불가능
- 수정과 삭제는 가능 
- 딕셔너리명 = {} 또는 dict() 함수로 생성할 수 있다 

1) 딕셔너리 생성(선언)

```python
tmpDict = {
    'name' : '홍길동' ,
    'id' : 'hgd123'
}
print(tmpDict, type(tmpDict))
> {'name': '홍길동', 'id': 'hgd123'} <class 'dict'>

# 키 유무 검색 가능
print('birth' in tmpDict) 
> False

# key 값을 value 찾는거 가능 
# 반대로 찾는 것은 불가
print(tmpDict['name'])
> 홍길동

# value값으로 list가 들어갈 수 있음
icecream = {
    '메로나' : [300 , 20] ,
    '비비빅' : [200 ,10] ,
    '브라보' : [1000 , 15]
}
print(icecream, type(icecream))
> {'메로나': [300, 20], '비비빅': [200, 10], '브라보': [1000, 15]} <class 'dict'>

print('메로나의 가격은 {}이고 수량은 {}입니다'.format(icecream['메로나'][0] , icecream['메로나'][1]))
> 메로나의 가격은 300이고 수량은 20입니다

print('메로나의 가격은 %d이고 수량은 %d입니다' % (icecream['메로나'][0] , icecream['메로나'][1]))
> 메로나의 가격은 300이고 수량은 20입니다

```

2) dict() 함수로 생성

```python
tmpDict = dict([
    ('city', 'seoul') , ('age','27')
])


#dict() 함수로 생성
tmpDict = dict(
    city = 'seoul' ,
    age  = 27
)
> {'city': 'seoul', 'age': 27} <class 'dict'>
```



2. 딕셔너리 함수

1) 딕셔너리명.get(key)

- 딕셔너리 key에 맞는 value값 탐색

```python
print(tmpDict['city'])
> seoul

print(tmpDict.get('city'))
> seoul
```

2) 딕셔너리명.update({key : value})

- 딕셔너리에 요소 추가 

```python
tmpDict.update({'name' : 'hgd123'})
print(tmpDict)
> {'city': 'seoul', 'age': 27, 'name': 'hgd123'}
```

3) dict(zip(튜플1(keys), 튜플2(vals))

- 두개의 튜플을 하나의 딕셔너리로 생성

```python
keys = [1,2,3,4,5]
vals = [6,7,8,9,10]

#방법 1
zipDict = dict(zip(keys , vals))
print('zipDict - ' , zipDict , type(zipDict))

> zipDict -  {1: 6, 2: 7, 3: 8, 4: 9, 5: 10} <class 'dict'>
```

4) 딕셔너리명.keys()

- dict_keys 객체 반환

```python
print(tmpDict.keys())
> dict_keys(['city', 'age'])
```

5) 딕셔너리명.values()

- dict_values 객체 반환

```python
print(tmpDict.values())
> dict_values(['seoul', 27])
```

6) 딕셔너리명.items()

- dict_items 객체 반환
- key와 value모두 출력
- key와 value가 각각의 튜플로 묶여져서 출력된다 

```python
print(tmpDict.items())
> dict_items([('city', 'seoul'), ('age', 27)])
```

7) 딕셔너리명.clear()

- 딕셔너리를 비워줌

```python
tmpDict.clear()
print(tmpDict)
> {}
```



## 05 .Boolean 

- 참(True), 거짓(False) 두 개의 값을 가지는 자료형
- True는 1로, False는 0으로 표현
- 논리연산자(not, and, or)
- 비교연산자(&, | , ~)
- " " , [] , () , {}, 0 , None -> false

```python
a = 5
b = 0

print('booltype = ', bool(-1))
> booltype =  True

print('bitwise - ', bool((a&b)))
> bitwise -  False

print('bitwise - ', bool((a|b)))
> bitwise -  True


tmpList = []
tmpstr = ""
print(bool(tmpList), bool(tmpstr) , bool((1,2,3)))
> False False True

trueFlag  = True
falseFlag  = False

print('True - False', int(trueFlag), int(False))
> True - False 1 0

print('and - &', trueFlag and falseFlag , trueFlag&falseFlag) #하나만 false여도 false
> and - & False False

print('or - |', trueFlag or falseFlag, trueFlag|falseFlag) #하나만 True여도 True
> or - | True True

print('not', not trueFlag)
> not False
```





# DAY 03



## 01. 날짜 및 시간(datetime)

1. datetime 모듈

```python
# from 패키지명.모듈 import 함수명
# from 모듈 import 함수명 또는 클래스
# import 모듈명

from datetime import date, datetime
print('type - ', type(date))
> type -  <class 'type'>
```

- date 함수 : 년/월/일 표시

```python
today = date.today()
print('오늘의 날짜: ', today)
> 오늘의 날짜:  2021-07-19

print('오늘의 년/월/일: ', today.year, today.month, today.day)
> 오늘의 년/월/일:  2021 7 19
```

- datetime 함수 : 시/분/초 까지 표시

```python
usertime = datetime.today()
print(usertime)
> 07-19 16:57:34.273748

print('시간만 출력해봐요', usertime.hour , usertime.minute, usertime.minute)
> 시간만 출력해봐요 16 57 57
```



2. 시간연산

- print('오늘날짜에서 하루를 더해봐요', today + 1) <- 에러발생

```python
from datetime import date, datetime, timedelta
from dateutil.relativedelta import relativedelta

# timedelta 함수(day 연산)
today = date.today()
days = timedelta(days = -1)
print('하루 전 날짜를 출력해봐요:', today + days)
> 하루 전 날짜를 출력해봐요: 2021-07-18

# 이틀 후 날짜를 출력해봐요
days = timedelta(days = +2)
print(today + days)
> 2021-07-21

#relativedelta 함수(months, years 연산)
# 두달 전 날짜를 출력해봐요
months = relativedelta(months= -2)
print(today + months)
> 2021-05-19

# 2년 후 날짜를 출력해봐요
years = relativedelta(years= +2)
print(today + years)
> 2023-07-19
```



3. 특정날짜객체 생성

```python
# parse 함수 활용
from dateutil.parser import parse
userDate = parse('2019-7-16')
print(userDate , type(userDate))
> 2019-07-16 00:00:00 <class 'datetime.datetime'>
```

4. 날짜 형변환

1) 날짜를 문자형태로 변환

```python
# 날짜 -> 문자: strftime 함수 사용

print("날짜를 문자형태로 변환하세요: ", userDate.strftime('%m-%d-%y'
))
날짜를 문자형태로 변환하세요:  07-16-19
```

2) 문자를 날짜형태로 변환

```python
# 문자 -> 날짜: strptime 함수 사용

print("날짜를 문자형태로 변환하세요: ", userDate.strftime('%m-%d-%y'
), type(userDate.strftime('%m-%d-%y'
)))

> 날짜를 문자형태로 변환하세요:  07-16-19 <class 'str'>

str = '19, 7, 6, 10:29:12'
print("문자를 날짜형태로 변환하세요 : ", datetime.strptime(str, '%y, %m, %d, %H:%M:%S'), type(datetime.strptime(str, '%y, %m, %d, %H:%M:%S')))

> 문자를 날짜형태로 변환하세요 :  2019-07-06 10:29:12 <class 'datetime.datetime'>
```





## 02. 제어문(if)

- if 조건문은 특정 조건일 때 코드를 실행하는 문법

1) if / if~else / elif

```python
# if 사용하기 
if 조건식 :
   코드1 #들여쓰기(ident)

tmpList = [1]
if tmpList : 
    print('pass')
    
# if~else 사용하기
if 조건식 :
   코드1 #들여쓰기(ident)
else :
    코드2

score = int( input('점수를 입력하세요 : ') )
if score >= 60 :
    print('pass')
else :
    print('non pass')

> 
점수를 입력하세요 : 50
non pass

Q1. 윤년 판별
윤년? 4의 배수이고(year%4 == 0) 100의 배수가 아니거나(year%100 != 0) 400의 배수일때(year%400 == 0)

year = int(input('년도를 입력하시오: '))
if (year%4 == 0 and year%100 != 0) or (year%400 == 0) :
    print('윤년입니다')
else :
    print('평년입니다')

> 년도를 입력하시오: 2020
윤년입니다

#elif 사용하기

Q2. 해당년도가 윤년일 경우 2월달의 마지막일은 29, 평년일 경우 2월달의 마지막일은 28일/출력 형식은 'yyyy년 m월 마지막일은 dd일 입니다'로 출력

A1. 
year = int(input("년도를 입력하세요:"))
month = int(input("달을 입력하세요:"))
year_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
leap_year_day = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if(year%4 == 0 and year%100 != 0)  :
    print('{}년 {}월 마지막일은 {}일 입니다'.format(year, month, leap_year_day[month - 1]))
elif (year%400 == 0) :
    print(print('{}년 {}월 마지막일은 {}일 입니다'.format(year, month, leap_year_day[month - 1])))
else :
    print('{}년 {}월 마지막일은 {}일 입니다'.format(year, month, year_day[month - 1]))
    
> 년도를 입력하세요: 2020
달을 입력하세요:2
2020년 2월 마지막일은 29일 입니다

A2.
if month == 2 :
    if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0) :
        lastday = 29
        print('{}년 {}월 마지막일은 {}일 입니다'.format(year, month, lastday))
    else :
        lastday = 28
        print('{}년 {}월 마지막일은 {}일 입니다'.format(year, month, lastday))
> 년도를 입력하세요: 2020
달을 입력하세요:2
2020년 2월 마지막일은 29일 입니다

# if~in 구문 활용하기

list31 = [1,3,4,5,7,8,10,12]
if month != 2:
    if month in list31 :
        print('{}년 {}월 마지막일은 31일 입니다'.format(year, month))
    else :
        print('{}년 {}월 마지막일은 30일 입니다'.format(year, month))
else :
    if (year%4==0 and year%100 !=0) or year%400 ==0:
        print("{}년 {}의 마지막 달은 27일 입니다".format(year, month))
    else:
        print("{}년 {}의 마지막 달은 28일 입니다".format(year, month))

> 년도를 입력하세요:2020
달을 입력하세요:7
2020년 7월 마지막일은 31일 입니다
```



2) 중첩 조건문

```python
grade = 'A'
avg = 91

if grade == 'A' :
    if avg >= 95 :
        print('장학금 100%')
    elif avg >= 90 :
        print('장학금 90%')

> 장학금 90%
```



3) 3항연산자

- 형식: 변수명 = 참일 경우 실행코드 if 조건식 else 거짓일 경우 실행코드

```python
num = 9
if num >= 5 :
    result = num * 2
else :
     result = num + 2
     
result = num * 2 if num >= 5 else num + 2
print('result - ', result)
> result -  18
```



## 03. 반복문(for/while)

1. for 와 range

```python
# 기본구문
for 변수 in range (횟수) :
	반복할 코드
    

for v1 in range(10) :
    print('v1 is' , v1)
>
v1 is 0
v1 is 1
v1 is 2
v1 is 3
v1 is 4
v1 is 5
v1 is 6
v1 is 7
v1 is 8
v1 is 9

```

```python
score = []
for i in range(5) : # 5번 반복
	score.append(int(input('숫자입력: ')))
>
숫자입력:1
숫자입력:2
숫자입력:3
숫자입력:4
숫자입력:5

for element in score :
	print(element)
> 
1
2
3
4
5

# 위 결과값을 가로로 출력하시오

for i in range(len(score)):
    print(score[i], end = '\t')
> 1	2	3	4	5

# score 입력값의 총합 출력
# score 입력값의 평균 출력
sum = 0 
avg = 0
for i in range(len(score)) :
    sum += score[i]
    avg = sum/len(score)
print('총합은', sum)
print('평균은', avg)
> 총합은 15
> 평균은 3.0
```

2. while 반복문

```python
dogNames = []
isFlag = True

while isFlag : # True 이면 아래 코드를 반복실행해라
    name = input("what is your dog's name?")
    if name == "" : # 강쥐이름이 없다면
        isFlag = False # False 값을 반환 -> 반복중단
        break # 빠져나오셈
    else :
        dogNames.append(name) # 강쥐이름을 입력한다면 dogNames 리스트에 반복해서 추가하삼
print('강쥐들의 이름은?', dogNames)

>
what is your dog's name?몽몽이
what is your dog's name?몽순이
what is your dog's name?댕댕이
what is your dog's name?      #공란입력 --> break
강쥐들의 이름은? ['몽몽이', '몽순이', '댕댕이']
```

- while문을 이용한 guess game(활용예제)

```python
from random import randint # 난수 생성 모듈
answer = randint(1, 101) # 1~100 숫자 중 난수생성
print('정답: ', answer)
tries = 1 # 시도횟수 지정

Q. 기회는 10번!, guess 게임을 만들어보자 

while tries >= 10 : # 기회는 10번
    guess = int(input("정답을 맞춰보시오 : "))
    if guess == answer :
        print("정답입니다")
        break 
    elif guess >= answer :
        print("down")
    else :
        print("up")
    tries += 1 # tries = tries + 1
 
> 
정답:  46
정답을 맞춰보시오: 1
up
정답을 맞춰보시오: 2
up
정답을 맞춰보시오: 50
down
정답을 맞춰보시오: 46
정답입니다

Process finished with exit code 0

print('정답: {} & 시도횟수 : {}'.format(answer, tries))
> 정답: 46 & 시도횟수 : 4

```

1) 활용예제(한줄에 n 개씩 결과값을 출력하시오)

- 올림픽은 4년에 한번 개최된다. 2000 - 2050 년 사이의 올림픽 개최년도를 출력하고, 한줄에 5개 년도씩 출력하시오

```python
for year in range(2000, 2051, 4)
	print (year)
>
2000
2004
2008
2012
2016
2020
2024
2028
2032
2036
2040
2044
2048

# 가로로 5개씩 어떻게 출력?
cnt = 0 # 실행 횟수를 count를 함
for year in range(2000, 2051, 4) :
    cnt += 1 
    if cnt%5 == 0 : # 실행 횟수가 5번째가 되면 
        print(year, end = '\n')  # 다음 줄에 출력
    else :
        print(year, end = '\t') # 아니면 가로로 출력

>
2000	2004	2008	2012	2016
2020	2024	2028	2032	2036
2040	2044	2048	
```

2) 활용예제2(조건에 맞는 값만 출력)

```python
tmpList = ['I' , 'AM' , 'study' , 'PYTHON' , 'language' , '!']

# 위 리스트에서 세 글자 이상 문자만 출력하시오

for x in tmpList :
    if len(x) >= 3 :
        print(x)
>
study
PYTHON
language

# 위 리스트에서 대문자인 문자들만 출력하시오
for x in tmpList :
    if x.isupper() : 
        print(x)
> 
I
AM
PYTHON

# 확장자를 제외하고 파일이름만 출력
tmpList = ['greeting.py' , 'ex01.py' , 'intro.hwp' , 'bigdata.doc']

for i in range(len(tmpList)) :
    print(tmpList[i].split('.')[0])
>
greeting
ex01
intro
bigdata
```



3. 이중 반복구문(루프구문)

```python
# 구구단 만들기

cnt = 1
for i in range(2, 10) :
    for j in range(2, 10):
        cnt += 1
        if cnt%8 == 0 :
            print('{}*{} = {}'.format(i, j, i*j), end = '\n')
        else :
            print('{}*{} = {}'.format(i, j, i * j), end='\t')
> 
2*2 = 4	2*3 = 6	2*4 = 8	2*5 = 10	2*6 = 12	2*7 = 14	2*8 = 16
2*9 = 18	3*2 = 6	3*3 = 9	3*4 = 12	3*5 = 15	3*6 = 18	3*7 = 21	3*8 = 24
3*9 = 27	4*2 = 8	4*3 = 12	4*4 = 16	4*5 = 20	4*6 = 24	4*7 = 28	4*8 = 32
4*9 = 36	5*2 = 10	5*3 = 15	5*4 = 20	5*5 = 25	5*6 = 30	5*7 = 35	5*8 = 40
5*9 = 45	6*2 = 12	6*3 = 18	6*4 = 24	6*5 = 30	6*6 = 36	6*7 = 42	6*8 = 48
6*9 = 54	7*2 = 14	7*3 = 21	7*4 = 28	7*5 = 35	7*6 = 42	7*7 = 49	7*8 = 56
7*9 = 63	8*2 = 16	8*3 = 24	8*4 = 32	8*5 = 40	8*6 = 48	8*7 = 56	8*8 = 64
8*9 = 72	9*2 = 18	9*3 = 27	9*4 = 36	9*5 = 45	9*6 = 54	9*7 = 63	9*8 = 72
9*9 = 81	
Process finished with exit code 0

```



# DAY 04

## 01. 사용자 정의 함수

1. 사용자 정의 함수 

- 말그대로 사용자가 직접 만들어 사용하는 함수 

```python
# 함수 정의 기본구조

def 함수명(매개변수) : 
	수행할 코드1 
	...
	[return 반환값]

# def 함수이름(option) :
#   statement
#   return value

# 함수 생성
def printGreeting() :
    print('hello python')

# 함수 호출 
printGreeting()
> hello python

# 함수 생성2 
def mySum(x, y, z=10)
	return x + y + z

# 함수 호출
print(mySum(5,7))
> 22
```

- 매개변수란? 함수에 입력으로 전달된 값을 받는 변수
- 인자 또는 인수란? 함수 호출시 설정된 함수로 넘겨지는 값들

1) 활용예제

- list 속 숫자의 총합을 구하는 함수를 만들어 보자

```python
# 기본원리
data = [1, 3, 5, 7, 9]
tot = 0
for i in data :
    tot += i
print('총합은?', tot)
> 총합은? 25
```

```python
# 함수생성

def totalCalc(data) : # 총합을 구하는 함수 정의
    total = 0
    for i in data :
        total += i
    return total
totalCalc(data)
> 총합은? 25
```

2) 활용예제

- 짝수만 골라 리스트를 생성하는 함수를 만들어 보자

```python
myList = [3, 4, 10, 23, 34, 3, 6]

def pickEven(numlist) :
    result = []
    for num in numlist :
        if num%2 == 0 :
            result.append(num)
    return result

result = pickEven(myList)
print('result - ' , result )
> result -  [4, 10, 34, 6]

```



# DAY 05

## 01. 클래스(class) & 인스턴스

1. 클래스: 일종의 부류 (ex.과일)
2. 인스턴스: class에 포함되는 일종의 실체 (ex. 눈앞에 있는 사과)

```python
class 클래스이름 :
	변수 #선언하는 위치에 따라 소유의 주체가 달라짐(클래스or인스턴스)
	생성자 
	함수 #클래스 내부에 정의된 함수를 매서드라고 함 
```

- 클래스 생성

```python
# class 

class Person :
    
    # 클래스 소유의 변수
    # 모든 인스턴스가 공유하는 변수
    cls_val = 3.5
    
    # magic Function
    # 인스턴스 소유의 변수
    def __init__(self, name, age, gender) :
        self.name = name
        self.age = age
        self.gender = gender
    # 인스턴스 소유의 함수
    def doing(self) :
        print('일하고 있습니다')
    
    def perInfo(self) :
        return '이름 {}, 나이 {}, 성별{}'.format(self.name, self.age, self.gender)
    
    def printClsVar(self) :
        print('cls_var value: ',person.cls_var)
```

- 인스턴스 생성

```python
# 인스턴스 생성
PerName = '홍길동'
PerAge = 23
PerGender = 'M'

def doing():
    print('{} 는 나이가 {} 살이고 성별은 {} 이다'.format(PerName, PerAge, PerGender))
doing()

>홍길동 는 나이가 23 살이고 성별은 M 이다


perObj01 = Person('홍길동', 49, 'M')
perObj01.doing()
print(perObj01.name)
print(perObj01.age)
>
일하고 있습니다
홍길동
49
```

- 클래스 생성

```python
class Employee :
    # 클래스 소유 변수
    raise_rate = 1.1

    # 인스턴스 소유 변수
    def __init__(self, userName , userSalary):
        self.userName = userName
        self.userSalary = userSalary

    # 인스턴스 함수
    def incrementSalary(self): 
        self.userSalary = self.userSalary * Employee.raise_rate
    
    def getSalary(self):
        return '{} 님의 급여는 {} 입니다'.format(self.userName, self.userSalary)
    
    @classmethod # 클래스 소유 함수 
    def changeRate(cls, ratio):
        cls.raise_rate = ratio
        print('인상률 {} 가 적용 되었습니다'.format(ratio))
```

- 인스턴스

```python
empObj01 = Employee('홍길동', 1000)
print(empObj01.getSalary())
> 홍길동 님의 급여는 1000 입니다

# 급여인상
empObj01.incrementSalary() # 급여 인상 계산 실행
print(empObj01.getSalary()) # 인상된 결과값 출력
> 홍길동 님의 급여는 1100.0 입니다

# 인상률 변경
Employee.changeRate(1.5) # 인상률 변경 실행
empObj01.incrementSalary() # 변경된 인상률로 계산 실행
print(empObj01.getSalary()) # 인상 결과값 출력
> 
인상률 1.5 가 적용 되었습니다.
홍길동 님의 급여는 1650.0 입니다
```

