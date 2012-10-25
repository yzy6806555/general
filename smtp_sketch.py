import threading
from PIL import ImageGrab

def doSketch():
        print "stech the screen==============="
        im=ImageGrab.grab()
        im.save('d:/tmp.png')

             
import stmp_mutil

import time  
import thread  

# def threadPoc(no,avg2): 
    # count=2
    # while count:   
        # print 'Thread :(%d) Time:%s\n'%(no,time.ctime())   
        # doSketch()
        # stmp_mutil.sendMail()          
        # print 'sleep ======='
        # count=count-1
        # time.sleep(interval) 
        
# def test():    
    # t=thread.start_new_thread(threadPoc,(100,10))   
    # print 'now input somthing-==========-'
    # t.join()
        
# if __name__=='__main__':   
    # test()  

        
        
import threading as thread        
        
class threadPoc(thread.Thread):
    def __init__(self,count):
        thread.Thread.__init__(self)    
        self.count = count
    def run(self):
        print 'send mail thread  run'
        while self.count :
            doSketch()
            stmp_mutil.sendMail() 
            self.count =self.count -1
            time.sleep(5)       
            print 'sleep ======='    
        
if __name__=='__main__':           
    t1 = threadPoc(10)
    t1.start() 
    #do other things----------
    t1.join()           
            
        
        