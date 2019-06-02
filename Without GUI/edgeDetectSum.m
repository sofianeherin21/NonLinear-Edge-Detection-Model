function [ I3 ] = edgeDetectSum( I )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
se= [ 1 1 1;
      1 1 1;
      1 1 1;
      ];
 SE=strel('diamond',3);
  I=imclose(I,SE); 
[row, col]=size(I);
I2=double(I);
I3=I;
I4=I;
I5=I;
for i= 2:row-1
    for j= 2:col-1
        s=double(I(i,j));
        se= [abs(I2(i-1,j-1)-s) abs(I2(i-1,j)-s) abs(I2(i-1,j+1)-s);
              abs(I2(i,j-1)-s)  abs(I2(i,j)-s) abs(I2(i,j+1)-s);
              abs(I2(i+1,j-1)-s) abs(I2(i+1,j)-s) abs(I2(i+1,j+1)-s)
              ];  
          sum=0;
          sum=sum+se(1,1)+se(1,2)+se(1,3)+se(2,1)+se(2,2)+se(2,3)+se(3,1)+se(3,2)+se(3,3);
          
          
          I3(i,j)=sum;
          
    end


end

