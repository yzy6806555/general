

function loc1 = just_match(image)

    global pos;

    [im1, des1, loc1] = sift(image);
    % image: �Ǿ���double format��ʽ��ͼ�����
    % loc1--------------------��K-by-4 ����, ���е�ÿһ�о����ĸ���ֵ����ʾ�ؼ���λ����Ϣ     %(row, column, scale, orientation).
    % des1------------------K-by-128���ľ���x, ����ÿ��������ҵ��ģ˸��ؼ��������������

    showkeys(im1, loc1);
  
 return; 
  
  