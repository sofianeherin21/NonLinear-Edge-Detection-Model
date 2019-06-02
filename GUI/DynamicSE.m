function varargout = DynamicSE(varargin)
% DYNAMICSE MATLAB code for DynamicSE.fig
%      DYNAMICSE, by itself, creates a new DYNAMICSE or raises the existing
%      singleton*.
%
%      H = DYNAMICSE returns the handle to a new DYNAMICSE or the handle to
%      the existing singleton*.
%
%      DYNAMICSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DYNAMICSE.M with the given input arguments.
%
%      DYNAMICSE('Property','Value',...) creates a new DYNAMICSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DynamicSE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DynamicSE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DynamicSE

% Last Modified by GUIDE v2.5 11-Apr-2019 06:12:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DynamicSE_OpeningFcn, ...
                   'gui_OutputFcn',  @DynamicSE_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DynamicSE is made visible.
function DynamicSE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DynamicSE (see VARARGIN)

% Choose default command line output for DynamicSE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DynamicSE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DynamicSE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function [ I3 ] = edgeDetectMean( I )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
se= [ 1 1 1;
      1 1 1;
      1 1 1;
      ];

  SE=strel('diamond',2);
  I=imclose(I,SE);
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
          sum=0;
          sum=sum+se(1,1)+se(1,2)+se(1,3)+se(2,1)+se(2,2)+se(2,3)+se(3,1)+se(3,2)+se(3,3);
         
          mean=sum/6;
          
          I3(i,j)=mean;
          
    end
end
SE1=strel('diamond',1);
  
I3=imdilate(I3,SE1);

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



% --- Executes on button press in Mean.
function Mean_Callback(hObject, eventdata, handles)
% hObject    handle to Mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);

for i=1:5
    img=getsnapshot(view);
    %img2= im2bw(img);
    img_gray=rgb2gray(img);
    
    img4=edgeDetectMean(img_gray);
    
    axes(handles.axes5);
    imshow(img4);
    title(handles.axes5,'Mean');
    
    
    pause(0.1);
end


% --- Executes on button press in Sum.
function Sum_Callback(hObject, eventdata, handles)
% hObject    handle to Sum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);

for i=1:5
    img=getsnapshot(view);
    %img2= im2bw(img);
    img_gray=rgb2gray(img);
    
    img4=edgeDetectSum(img_gray);
    
    axes(handles.axes5);
    imshow(img4);
    title(handles.axes5,'Sum');
    
    pause(0.1);
end


% --- Executes on button press in Max.
function Max_Callback(hObject, eventdata, handles)
% hObject    handle to Max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);

for i=1:5
    img=getsnapshot(view);
    %img2= im2bw(img);
    img_gray=rgb2gray(img);
    
    img4=edgeDetectMax(img_gray);
    
    axes(handles.axes5);
    imshow(img4);
    title(handles.axes5,'Max');
    
    pause(0.1);
end


% --- Executes on button press in compare.
function compare_Callback(hObject, eventdata, handles)
% hObject    handle to compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

view=videoinput('winvideo',1);
for i=1:5
    img=getsnapshot(view);
    %img2= im2bw(img);
    img_gray=rgb2gray(img);
    
    img4=edgeDetectMean(img_gray);
    axes(handles.axes4);
    imshow(img4);
    title(handles.axes4,'Mean');
    img5= edgeDetectSum(img_gray);
    axes(handles.axes5);
    imshow(img5);
    title(handles.axes5,'Sum');
    img6= edgeDetectMax(img_gray);
    axes(handles.axes6);
    imshow(img6);
    title(handles.axes6,'Max');
    
    pause(0.1);
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
