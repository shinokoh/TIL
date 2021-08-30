
'''
class 클래스이름 :
    변수(선언위치 , 소유의 주체도 다르다)
    생성자()
    함수()
'''
class Person :

    # 인스턴스 소유가 아닌 클래스 소유의 변수로 본다
    # 모든 인스턴스가 공유하는 변수
    cls_var = 3.5

    # initializer
    # magic function
    def __init__(self , name , age , gender):
        # 인스턴스 소유의 변수
        self.name = name
        self.age  = age
        self.gender = gender

    # 인스턴스 소유의 함수
    def doing(self):
        print('일하고 있습니다~~')

    # 인스턴스 소유의 함수
    def perInfo(self):
        return '이름 {} , 나이 {} , 성별 {}'.format(self.name, self.age, self.gender)

    def printClsVar(self):
        print('cls_var value : ' , Person.cls_var)


    @classmethod
    def classFunc(cls):
        print('이 영역은 클래스 소유의 함수로 인스턴스 소유의 변수 및 함수를 사용할 수 없습니다.~')


class Employee :
    raise_rate = 1.1
    def __init__(self , userName , userSalary):
        self.userName   = userName
        self.userSalary = userSalary

    def incrementSalary(self):
        self.userSalary = self.userSalary * Employee.raise_rate

    def getSalary(self):
        return '{} 님의 급여는 {} 입니다'.format(self.userName , self.userSalary)

    @classmethod
    def changeRate(cls , ratio):
        cls.raise_rate = ratio
        print('인상률 {} 가 적용 되었습니다.'.format(ratio))

    def instanceRate(self , ratio):
        Employee.raise_rate = ratio
        print('인상률 {} 가 적용 되었습니다.'.format(ratio))

# oop
# 은닉화, 상속, 다형성, 추상화

class Car(object) :
    def __init__(self , name , door , cc):
        self.name = name
        self.door = door
        self.cc   = cc
    def carInfo(self):
        if self.cc >= 3000 :
            self.type = '대형차'
        elif self.cc >= 2000 :
            self.type = '중형차'
        else :
            self.type = '소형차'
        self.display()

    def __repr__(self):
        return '%s 는 %d cc이고 문짝은 %d 개 입니다' % (self.name , self.cc , self.door)

    def display(self):
        print('%s 는 %d cc이고(%s) 문짝은 %d 개 입니다' % (self.name , self.cc , self.type , self.door))


# [실습]
# 1. Account class 작성 : 인스턴스 변수 - account, balance, interestRate
# 2. accountInfo() - 계좌의 정보를 출력한다(account, balance, interestRate)
# 3. deposit(amount) - 계좌 잔액에 매개변수로 들어온 amount를 누적한다.
# 4. printInterestRate() - 현재 잔액에 이자율을 계산하여 소수점 자리 2자리까지 출력한다.
# 5. withDraw(amount) - 매개변수로 들어온 금액만큼을 출금하여 잔액을 변경한다.
# 단) 잔고가 부족할 경우 '잔액이 부족하여 출금할 수 없습니다' 출력한다.

class Account :
    def __init__(self, account, balance, interestRate):
        self.account = account
        self.balance = balance
        self.interestRate = interestRate
    def accountInfo(self):
        print("계좌번호 : {0} , 현재 잔액 : {1}".format(self.account, self.balance))
    def deposit(self, amount):
        self.balance += amount
    def printInterestRate(self):
        interest  = (self.balance) + self.balance * self.interestRate
        print( "%.2f" % (interest) )
    def withDraw(self, amount):
        if (self.balance < amount) :
            print("잔액이 부족하여 출금할 수 없습니다.")
        else:
            self.balance -= amount












