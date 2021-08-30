# 은닉화, 상속, 다형성, 추상화

# encapsulation
# information - hiding (정보은닉)

class MyDate(object) :
    def setYear(self , year):
        if(year < 0 ) :
            self.__year = 2021
        else :
            self.__year = year

    def getYear(self):
        return self.__year

# inheritance 상속
# is a ~
# 부모는 추상적으로 범위가 넓어져야합니다
# 자식은 구체적 좁혀져야한다

class Sup(object) :

    def sayEcho(self , name):
        return name+" 님 , 안녕하세요~~"

class Sub(Sup) :

    # 함수 재지정(overriding)
    def sayEcho(self , name):
        return name+" 님 , 안녕!!"


class Parent(object) :
    def __init__(self , name , job):
        self.name = name
        self.job  = job
    def display(self):
        return 'name {} , job {}'.format(self.name , self.job)

class Child01(Parent) :
    def __init__(self , name , job , age ):
        super().__init__(name, job)
        self.age  = age
    def display(self):
        return super().display() + ' , age {}'.format(self.age)

class PersonVO(object):
    def __init__(self, name, age, address):
        self.name    = name
        self.age     = age
        self.address = address
    def perInfo(self):
        return  self.name + str(self.age) + self.address
class StudentVO(PersonVO):
    def __init__(self, name, age, address, stuid):
        super().__init__(name, age, address)
        self.stuid  = stuid
    def stuInfo(self):
        return super().perInfo() + " , " + self.stuid
class TeacherVO(PersonVO):
    def __init__(self, name, age, address, subject):
        super().__init__(name, age, address)
        self.subject  = subject
    def teaInfo(self):
        return super().perInfo() + " , " + self.subject




