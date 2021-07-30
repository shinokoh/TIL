
# closure , decorator , generator ,
# python file(input/output) - exception
# pandas file <- csv , excel , txt

'''
1. closure(클로저)
일급객체함수(first-class function)
변수의 스코프(글로벌 , 로컬 변수)
'''

# def outer(x) :
#     tmp = x
#     def inner() :
#         print(tmp)
#     return inner()
# outer(100)

def outer(x) :
    tmp = x # free variable (코드블럭안에 정의되었지만 블럭안에 정의되지않은 변수)
    def inner() :
        print(tmp * 100)
    return inner

result = outer(100)
result()

print('address - ' , result)
print('dir - ' , dir(result))
print('closure - ' , type(result.__closure__))
print('closure - ' , dir(result.__closure__[0]))
print('cell_contents - ' , result.__closure__[0].cell_contents)

'''
2. decorator (pattern) 
함수를 호출시 함수의 인자로 함수롤 넘겨 줄 수 있다.
'''
print('*** decorator *** ')
import time
def outer(func) :
    def inner() :
        # print('공통의 업무로직 수행 전')
        print('{} 함수의 수행시간 계산'.format(func.__name__))
        strTime = time.time()
        func()
        endTime = time.time() - strTime
        print('{} 함수의 수행시간 {}'.format(func.__name__ , endTime))
        # print('공통의 업무로직 수행 후')
    return inner

@outer
def coreFunc01() :
    for idx in range(0, 500) :
        print(idx)

@outer
def coreFunc02() :
    for idx in range(0, 10000) :
        print(idx)
# decorator = outer(coreFunc01)
# decorator()

# coreFunc01()
# coreFunc02()

# error - 함수의 인자에 문제가 발생한 경우
# @outer
# def coreFunc03(x, y) :
#     print(x + y)
# coreFunc03()

# *args : tuple , **kwargs : dict
def outer(func) :
    def inner(*args , **kwargs) :
        # print('공통의 업무로직 수행 전')
        print('{} 함수의 수행시간 계산'.format(func.__name__))
        strTime = time.time()
        func(*args , **kwargs)
        endTime = time.time() - strTime
        print('{} 함수의 수행시간 {}'.format(func.__name__ , endTime))
        # print('공통의 업무로직 수행 후')
    return inner

from functools import wraps

def outer1(func) :
    @wraps(func)
    def inner(*args , **kwargs) :
        print('*****************  outer1')
        print("{} 함수가 실행됩니다.".format(func.__name__))
        return func(*args , **kwargs)
    return inner

@outer
@outer1
def coreFunc03(x, y) :
    print(x + y)

coreFunc03(10, 20)
# coreFunc01()

'''
3. generator 
메모리 용량이 적을 때 루핑을 효율적으로 컨트롤할 때 사용하는 기법
yield 구문 이용해서 한번 호출할 때마다 하나의 값만 리턴받는 것
'''

def generatorFunc(dataList) :
    for tmp in dataList :
       yield tmp * 2

generatorList = generatorFunc([1,2,3,4,5,6,7,8,9,10])
print(generatorList)
print('generatorList type - ' , type(generatorList))
print('generatorList dir - '  , dir(generatorList))
print(next(generatorList))
print(next(generatorList))
print(next(generatorList))

# for tmp in generatorList :
#     print(tmp)

# dumyList = [tmp * 2 for tmp in [1,2,3,4,5,6,7,8,9,10]]
# print('dumyList type -' , type(dumyList))

dumyList = ( tmp * 2 for tmp in [1,2,3,4,5,6,7,8,9,10] )
castingList = list(dumyList)

# print('dumyList type -' , type(dumyList))
# print(next(dumyList))
# print(next(dumyList))




