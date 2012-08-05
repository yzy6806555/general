#!encoding=utf-8

# ���������ɫ
class Subject(object):
# ����һ���µĹ۲��߶���
# @param Observer
    def attach(Observer):
        pass
# ɾ��һ����ע����Ĺ۲��߶���
# @param Observer
    def detach(Observer):
        pass
# ֪ͨ����ע����Ĺ۲��߶���
    def notifyObservers():
        pass
        
        
# ���������ɫ
class ConcreteSubject(Subject):

    def __init__(self):
        self.observers = []
# ����һ���µĹ۲��߶���
# @param Observer
    def attach(self, Observer):
        self.observers.append(Observer)
        return self.observers
# ɾ��һ����ע����Ĺ۲��߶���
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
# ֪ͨ����ע����Ĺ۲��߶���
    def notifyObservers(self):
        if self.observers == []:
            return False
        for observer in self.observers:
            observer.update()
        return True
        
        
# ����۲��߽�ɫ
class Observer(object):
# ���·���
    def update():
        pass

class ConcreteObserver(Observer):
# �۲��ߵ�����
    def __init__(self, name):
        self.name = name
# ���·���
    def update(self):
        print "Observer:" + self.name + " has notified. \n"

# �ͻ���
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