clc;clear;

%�˴�picʹ��uint8��û��mat2gray�������
I = imread('old/che1.tif');
% I=imresize(I,[400,400]);
sz = size(I);


%�ֿ�  4����
pho=zeros(sz(2)/2,sz(1)/2,4);
t=1;
for i=0:1
    for j=0:1
        pho(:,:,t)=I(sz(2)/2*i+1:sz(2)/2*(i+1), sz(1)/2*j+1:sz(1)/2*(j+1));
        t=t+1;
    end
end

a1=pho(:,:,1);
a2=pho(:,:,2);
a3=pho(:,:,3);
a4=pho(:,:,4);

% subplot(2,2,1),imshow(a1,[]);
% subplot(2,2,2),imshow(a2,[]);
% subplot(2,2,3),imshow(a3,[]);
% subplot(2,2,4),imshow(a4,[]);

%%

global pos;
pos=zeros(10,2,2);  % ��������ƥ��ĵ��
Y=zeros(sz(1),sz(2));  %���ܸ����ֵİ�ɫֵ

%%---------------------------------------------------------------
% num= match(a1,a4);
% x1=sum(pos(:,1,1))/num;
% y1=sum(pos(:,2,1))/num;
% x2=sum(pos(:,1,2))/num;
% y2=sum(pos(:,2,2))/num;
% fprintf('*****match sum is %d*****',num);
% PS=fenge(a1,[x1,y1] );
% PT=fenge(a4,[x2,y2] );  
% figure;
%   subplot(1,2,1);imshow(PS,[]);
%   subplot(1,2,2);imshow(PT,[]);
% 
% 
% % num= match(a3,a4);
% % x1=sum(pos(:,1,1))/num;
% % y1=sum(pos(:,2,1))/num;
% % x2=sum(pos(:,1,2))/num;
% % y2=sum(pos(:,2,2))/num;
% % fprintf('*****match sum is %d*****',num);
% % PS1=fenge(a3,[x1,y1] );
% % PT=fenge(a4,[x2,y2] );  
% % figure;
% % subplot(1,2,1);imshow(PS1,[]);
% % subplot(1,2,2);imshow(PT,[]);
%   
%  Y(1:sz(1)/2, 1:sz(2)/2 ) =PS;
% % Y(sz(1)/2+1:sz(1), 1:sz(2)/2 ) =PS1;   %3
% % Y(1:sz(1)/2, sz(2)/2+1:sz(2) ) =PS1;   %2
% Y(sz(1)/2+1:sz(1), sz(2)/2+1:sz(2) ) =PT;
% %I=mat2gray(I);
% %imshow(I);
% %I=imadd(I,Y);
% 
%  figure;imshow(Y);title('ʶ��Ч��ͼ');

%%---------------------------------------------------------------
% 
  [num,list_trait]=match_pro(I);
% 
% % ���ؾ���õ�������
% list_cluster=cluster_data(list_trait);
% [i,j,k ]= size(list_cluster(:,:,:));
% shengz_pos=zeros(k,2);  %ÿ���ص�����
% 
% % ����ÿ���ص����ĵ�
% for i=1:k
%     [r,c]=find(list_cluster(:,:,i) );
%     ul = unique(r);
%     num=size(ul,1);  %�ôصĸ���
%     fprintf('cluter class %d has %d \n',i,num);
%     x= sum (list_cluster(:,1,i) )/num;
%     y= sum (list_cluster(:,2,i) )/num;
%     shengz_pos(i,:)=[x,y];      
% 
% end
% 
% 
% I=mat2gray(I);
%   
%    
% for i=1:k
%     fprintf('shengzhang dian is');    shengz_pos(i,:)     
%      a=shengz_pos(i,:);    
%     
%     Y=fenge(I,[floor(a(1)), floor(a(2))] );
%     I=imadd(I,Y);
%     
%    I(floor(a(1)), floor(a(2))  )=0;  figure;imshow(I);title('ʶ��Ч��ͼ');
%      
% end
%  figure;imshow(I);title('ʶ��Ч��ͼ');

