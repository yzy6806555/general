

function loc1 = just_match(image)

    global pos;

    [im1, des1, loc1] = sift(image);
    % image: 是具有double format格式的图像矩阵
    % loc1--------------------是K-by-4 矩阵, 其中的每一行具有四个数值，表示关键点位置信息     %(row, column, scale, orientation).
    % des1------------------K-by-128　的矩阵x, 其中每行是针对找到的Ｋ个关键特征点的描述子

    showkeys(im1, loc1);
  
 return; 
  
  