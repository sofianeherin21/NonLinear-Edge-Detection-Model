function [ I4 ] = edgeDetectMean( I )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
se= [ 1 1 1;
      1 1 1;
      1 1 1;
      ];
  
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
          for k=1:3
              for l=1:3
                  sum=sum+se(k,l);
              end
          end
          m=max(max(se));
          mean=sum/6;
          
          I3(i,j)=sum;
          I4(i,j)=m;
          I5(i,j)=mean;
    end
end


end

