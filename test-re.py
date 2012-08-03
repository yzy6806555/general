import re  
  
def match_func():
    text = "JGood is a handsome boy, he is cool, clever, and so on..."  
    m = re.match(r"(\w+)\s", text)  
    if m:  
        print m.group(0), '/n', m.group(1)  
    else:  
        print 'not match'  


def search_func():
    text = "JGood is a handsome boy, he is cool, clever, and so on..."  
    m = re.search(r'\shan(ds)ome\s', text)  
    if m:  
        print m.group(0), m.group(1)  
    else:  
        print 'not search'  
    

def sub_func():
    text = "JGood is a handsome boy, he is cool, clever, and so on..."  
    print re.sub(r'\s+', '-', text)  
    
    
def split_func():
    text = "JGood is a handsome boy"
    print re.split(r'\s+', text)

def findall_func():
    text = "JGood is a handsome boy, he is cool, clever, and so on..." 
    print re.findall(r'\w+\s', text)



if __name__=='__main__':
    match_func()
    search_func()
    sub_func()
    split_func()
    findall_func()