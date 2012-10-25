function list_cluster=cluster_data(data)
        %data format :������������ֵ��Ӧ��x,y����
      %ʹ�ò�ξ��� 
    %num=2;  %�����γɵ������   
    X2=zscore(data); %��׼������
    Y2=pdist(X2); %�������
    Z2=linkage(Y2,'weighted');
   % C1=cophenet(Z2,Y2); %0.94698
    C2=inconsistent(Z2);

    %dendrogram(Z2);
    %T=cluster(Z2,'cutoff',5,'criterion','distance');  %��֦  'maxclust',num,','criterion','distance'
    T=cluster(Z2,'maxclust',2);
    %T
    fprintf('---------------cluster data size is -----------%d\n',size(data,1));
    
    ul = unique(T);
    num=size(ul,1);
    fprintf('+++++++++++++++++the cluster sum is   %d++++++++++\n',num);
    
    %�ҵ��������ڵĸ���  �����������ֵ������Ԫ��̫�٣�ɾ��֮ 
    list_cluster=zeros(1,2,num);   %��ǰnum�µ�x��y����ֵ  
    
    %T(i)Ϊ��ǰ������������־
    for i=1:size(data,1)

        index= size( list_cluster(:,1,T(i,1)) , 1) ;
        list_cluster(index+1,:,T(i,1))=data(i,:);       
    end


return;