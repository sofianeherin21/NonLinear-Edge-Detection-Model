view=videoinput('winvideo',1);

for i=1:5
    img=getsnapshot(view);
    %img2= im2bw(img);
    img_gray=rgb2gray(img);
    
    img4=edgeDetectMean(img_gray);
    
    imshow(img4);
    title('Mean');
    
    pause(0.1);
end
for i=1:5
    img=getsnapshot(view);
    %img2= im2bw(img);
    img_gray=rgb2gray(img);
    img2=edgeDetectSum(img_gray);
    
    
    imshow(img2);
    title('Sum');
    pause(0.1);
end
for i=1:5
    img=getsnapshot(view);
    %img2= im2bw(img);
    img_gray=rgb2gray(img);
   
    img3=edgeDetectMax(img_gray);
    
    imshow(img3);
    title('Max');
    pause(0.1);
end