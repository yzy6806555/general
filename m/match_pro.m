
function [num,list_trait] = match_pro(image)

    % Find SIFT keypoints for each image
    list_trait=zeros(1,2);
    global pos;

    [im1, des1, loc1] = sift(image);

    % image: �Ǿ���double format��ʽ��ͼ�����
    % ��K-by-4 ����, ���е�ÿһ�о����ĸ���ֵ����ʾ�ؼ���λ����Ϣ 
    % [row, column, �߶�scale����˹�߶ȿռ�Ĳ���,����orientation]
    %(row, column, scale, orientation).
     % K-by-128���ľ���x, ����ÿ��������ҵ��ģ˸��ؼ��������������
     

    showkeys(im1, loc1);
    
    distRatio = 0.6;   
    list_dist=zeros(10,3);   %1Ϊֵ,��Ե�2���������ڱ��е�λ��
    des2=des1;
    index=1;
    num=0;
    match_index=zeros(10,2);

    %For each descriptor in the first image, select its match to second image.
    des2t = des2';   
    
    %--------------------sort----------------------------------------ֻ�ܶ�һά����------------
    % Precompute matrix transpose
    % for i = 1 :size(des1,1)
        % for j=1+1:size(des2t,2)
            % if i~=j
               % dotprods = des1(i,:) * des2t(:,j);        % Computes vector of dot products
               % list_dist(index,:)= [acos(dotprods),i,j];
               % index=index+1;
            % end             
        % end
        % [vals,indx] = sort(list_dist);  % Take inverse cosine and sort results
        % vals�����źõ����飬indxΪ�ĺõ�����Ԫ����֮ǰ��������
        % vals(1)/vals(2)
        % ff=size(vals,2)
        % if (vals(1) < distRatio * vals(2))
           % match_index(num+1,:) = i;  %�ҵ����ж�Ӧ��loc1�еĵ������,��Ϊƥ�������
           % match_index(num+2,:) = indx(1);  %�ҵ����ж�Ӧ��loc1�еĵ������,��Ϊƥ�������
           % num=num+2;
           % hasfind(1,hasfind_index)=indx(1);
           % hasfind_index=hasfind_index+1;
           % fprintf('finding==========%d -- %d \n',i,indx(1));
        % end  
        
        % index=1;
    % end
    %-------------------------------------------------------------------------------------------
    
        
    hasfind=zeros(1,10);
    hasfind_index=1;
       
     for i = 1 :size(des1,1)  
        
        if sum(find(hasfind==i))~=0
            continue;
        end
        dotprods = des1(i,:) * des2t();  %Ҫ�ų����Լ��ȵ��Ǹ�    
   
        [vals,indx] = sort(acos(dotprods));  % Take inverse cosine and sort results
%         if i==indx(1)
%             fprintf('--------------%d----------\n',i);
%         else
%             disp('+++++++++++++++++++');
%         end    
        %��С��1�Ǻ��Լ��Ļ��֣��ӵڶ�С��ʼ��Ϊ���
        if (vals(2) < distRatio * vals(3))
           match_index(num+1,:) = i;  %�ҵ����ж�Ӧ��loc1�еĵ������,��Ϊƥ�������
           match_index(num+2,:) = indx(2);  %�ҵ����ж�Ӧ��loc1�еĵ������,��Ϊƥ�������
           num=num+2;
           hasfind(1,hasfind_index)=indx(2);
           hasfind_index=hasfind_index+1;
           fprintf('finding==========%d -- %d \n',i,indx(2));
  
        end  
       
    end
    
    
    fprintf('Found %d matches zuzuzu.\n', num/2);
    
    %չʾ���������ƥ���
    figure('Position', [1 1 size(image,2) size(image,1)]);
    colormap('gray');
    imagesc(image);
    hold on;
    a=zeros(1,4);
    b=zeros(1,4);
    trait_index=1;
    for i=1:2:num
        a=loc1(match_index(i,1), :  );
        b=loc1(match_index(i+1,1), : );
        %��������С���ų�֮�����������۵�Ķ���
        s=[a(2),a(1)];
        t=[b(2),b(1)];
        length= sqrt( (s-t)*(s-t)'  ) ;
     %   if length<5
     %       continue;
     %   end
        %========================
        line( [ a(2),b(2) ],[a(1),b(1)], 'Color', 'c'); 
        list_trait(trait_index,:)=[a(2),a(1)];
        list_trait(trait_index+1,:)=[b(2),b(1)];
        trait_index=trait_index+2;
        fprintf('line---------------x=%f %f ,y= %f %f \n',a(1),a(2),b(1),b(2)  );  
    end
    hold off;
  %  fprintf('delete some xiaotingzi,now has %d matches points \n', trait_index);
    
    
return;

  
  
  
  
  