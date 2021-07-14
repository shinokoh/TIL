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

