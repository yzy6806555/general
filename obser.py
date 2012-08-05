#!encoding=utf-8

# 抽象主题角色
class Subject(object):
# 增加一个新的观察者对象
# @param Observer
    def attach(Observer):
        pass
# 删除一个已注册过的观察者对象
# @param Observer
    def detach(Observer):
        pass
# 通知所有注册过的观察者对象
    def notifyObservers():
        pass
        
        
# 具体主题角色
class ConcreteSubject(Subject):

    def __init__(self):
        self.observers = []
# 增加一个新的观察者对象
# @param Observer
    def attach(self, Observer):
        self.observers.append(Observer)
        return self.observers
# 删除一个已注册过的观察者对象
# @param Observer
    def detach(self, Observer):
        index = ''
        try:
            index = self.observers.index(Observer)
            if index == '':
                return False
            else :
                self.observers.remove(Observer)
                return True
        except:
            return False
# 通知所有注册过的观察者对象
    def notifyObservers(self):
        if self.observers == []:
            return False
        for observer in self.observers:
            observer.update()
        return True
        
        
# 抽象观察者角色
class Observer(object):
# 更新方法
    def update():
        pass

class ConcreteObserver(Observer):
# 观察者的名称
    def __init__(self, name):
        self.name = name
# 更新方法
    def update(self):
        print "Observer:" + self.name + " has notified. \n"

# 客户端
class Client(object):

    def main():
        subject = ConcreteSubject()
        observer1 = ConcreteObserver('kakarott')
        subject.attach(observer1)
        print "\n The First notify: \n";
        subject.notifyObservers();

        observer2 = ConcreteObserver('yslion')
        subject.attach(observer2)
        print "\n The Second notify: \n";
        subject.notifyObservers();

        subject.detach(observer1)
        print "\n The Third notify: \n";
        subject.notifyObservers();

Client.main()