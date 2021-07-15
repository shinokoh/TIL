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

