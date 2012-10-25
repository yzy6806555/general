function list_cluster=cluster_data(data)
        %data format :特征向量索引值对应的x,y坐标
      %使用层次聚类 
    %num=2;  %最终形成的类个数   
    X2=zscore(data); %标准化数据
    Y2=pdist(X2); %计算距离
    Z2=linkage(Y2,'weighted');
   % C1=cophenet(Z2,Y2); %0.94698
    C2=inconsistent(Z2);

    %dendrogram(Z2);
    %T=cluster(Z2,'cutoff',5,'criterion','distance');  %剪枝  'maxclust',num,','criterion','distance'
    T=cluster(Z2,'maxclust',2);
    %T
    fprintf('---------------cluster data size is -----------%d\n',size(data,1));
    
    ul = unique(T);
    num=size(ul,1);
    fprintf('+++++++++++++++++the cluster sum is   %d++++++++++\n',num);
    
    %找到各个类内的个数  如果不满足阈值，类内元素太少，删除之 
    list_cluster=zeros(1,2,num);   %当前num下的x，y坐标值  
    
    %T(i)为当前坐标点分配的组标志
    for i=1:size(data,1)

        index= size( list_cluster(:,1,T(i,1)) , 1) ;
        list_cluster(index+1,:,T(i,1))=data(i,:);       
    end


return;