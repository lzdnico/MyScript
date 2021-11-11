clear
clc
corn_gray = imread('test.jpg');
imshow(corn_gray)
location = []

%标定


%选取像素，计算实际坐标
while 1
    [x,y] = ginput(1)
    if x<0
        break
    end
    location = [location;[x y]]
end
formatOut = 'yyyymmddTHHMMSS';
filename = datestr(now,formatOut)
title = {'X坐标','Y坐标'}
xlswrite(filename,title)
sheet = 1;
xlRange = 'A2';
xlswrite(filename,location,sheet,xlRange)
