function [ I3 ] = edgeDetectMax( I )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
se= [ 1 1 1;
      1 1 1;
      1 1 1;
      ];
  
[row, col]=size(I);
I2=double(I);
I3=I;

for i= 2:row-1
    for j= 2:col-1
        s=double(I(i,j));
        se= [abs(I2(i-1,j-1)-s) abs(I2(i-1,j)-s) abs(I2(i-1,j+1)-s);
              abs(I2(i,j-1)-s)  abs(I2(i,j)-s) abs(I2(i,j+1)-s);
              abs(I2(i+1,j-1)-s) abs(I2(i+1,j)-s) abs(I2(i+1,j+1)-s)
              ];  
          
          m=max(max(se));
          I3(i,j)=m;
          
    end

end

