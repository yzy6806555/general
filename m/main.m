clc;clear;

%此处pic使用uint8，没有mat2gray，会出错
I = imread('old/che1.tif');
% I=imresize(I,[400,400]);
sz = size(I);


%分块  4部分
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
pos=zeros(10,2,2);  % 包含特征匹配的点对
Y=zeros(sz(1),sz(2));  %接受各部分的白色值

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
%  figure;imshow(Y);title('识别效果图');

%%---------------------------------------------------------------
% 
  [num,list_trait]=match_pro(I);
% 
% % 返回聚类好的坐标组
% list_cluster=cluster_data(list_trait);
% [i,j,k ]= size(list_cluster(:,:,:));
% shengz_pos=zeros(k,2);  %每个簇的中心
% 
% % 生成每个簇的中心点
% for i=1:k
%     [r,c]=find(list_cluster(:,:,i) );
%     ul = unique(r);
%     num=size(ul,1);  %该簇的个数
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
%    I(floor(a(1)), floor(a(2))  )=0;  figure;imshow(I);title('识别效果图');
%      
% end
%  figure;imshow(I);title('识别效果图');

