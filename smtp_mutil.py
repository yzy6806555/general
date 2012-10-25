#!/usr/bin/env python
# -*- coding: UTF-8 -*-
 
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
 
# python 2.3.*: email.Utils email.Encoders
from email.utils import COMMASPACE,formatdate
from email import encoders
import mimetypes  
import os
 
#server['name'], server['user'], server['passwd']
def send_mail(server, fro, to, subject, text, files=[]): 
   
    assert type(server) == dict 
    assert type(to) == list 
    assert type(files) == list 
 
    msg = MIMEMultipart() 
    msg['From'] = fro 
    msg['Subject'] = subject 
    msg['To'] = ', '.join(to) 
    msg['Date'] = formatdate(localtime=True) 
    msg.attach(MIMEText(text,'plain','gbk'))  #utf-8���䲻��������ʾ��Ĭ����gbk
 
    # for file in files: 
        # part = MIMEBase('application', 'octet-stream') #'octet-stream': binary data 
        # part.set_payload(open(file, 'rb').read()) 
        # encoders.encode_base64(part) 
        # part.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(file)) 
        # msg.attach(part) 
        
    #��Ӷ����Ƹ���  
    for fileName in files:
        ctype, encoding = mimetypes.guess_type(fileName)  
        if ctype is None or encoding is not None:  
            ctype = 'application/octet-stream'  
        maintype, subtype = ctype.split('/', 1)  
        print maintype, subtype
        part = MIMEBase('application', 'octet-stream') #'octet-stream': binary data 
        part.set_payload(open(fileName, 'rb').read()) 
        encoders.encode_base64(part) 
        part.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(fileName)) 
        msg.attach(part) 
        
    import smtplib 
    
    try:
        smtp = smtplib.SMTP(server['name']) 
        smtp.login(server['user'], server['passwd'])
        print 'login sucess------'
    except Exception,e:
        print 'login failure====='
    try:
        smtp.sendmail(msg['From'], msg['To'], msg.as_string()) 
        print 'send a mail....'
    except Exception,e:
        print 'send failure--------'
        
    smtp.close()
    
    
server={}    
server['name']='smtp.126.com'
server['user']='yzy6806555'
server['passwd']='*****'

fro='yzy6806555@126.com'
to=['122242027@qq.com'] #510663432
subject='¼ȡ֪ͨ'
text='���\r\n ��ϲ�㱻��У¼ȡΪ2013�����������ʿ����\r\n�й�ţ�ƴ�ѧ'
files=['d:/tmp.png']

def setServer(name,usr,passwd):
    server['name']=name
    server['usr']=usr
    server['passwd']=passwd
    
def setFromTo(fro,to):
    fro=fro
    to=to

def setSbuject(sub):
    subject=sub
    
def setText(text):
    text=text
    
def addAttachment(a):
    files=a

def sendMail():
    print 'ready to send_mail==========='
    send_mail(server, fro, to, subject, text, files)






