clc;
clear all;
close all;

[FileSpeech FiLEPath]=uigetfile('pwd\*.bmp','select Image');

imPath=[FiLEPath FileSpeech];
[im,cmap]=imread(imPath);

im=padarray(im,[100 100]);

clous=rgb2gray(im);
[out]= edge(double(clous),'canny',0.1);
[out2]= edge(double(clous),'canny',0.1);


[X,Y]=find(out>0);
XMn=mean(X);

YMn=mean(Y);

cnt=1;
for ang=0:-1:-180
    
   [outR]=imrotate(out,ang,'crop');
%   
    [ArrayBuff]=  outR(ceil(XMn),1:end);
    [ValIndx]=find(ArrayBuff>0);
    if length(ValIndx)>0
        dist1=max(abs(YMn-ValIndx));
        BuffDist(cnt)=dist1;
    else
        BuffDist(cnt)=0;
    end
    cnt=cnt+1;
%   imshow(outR);
% imshow(ArrayBuff);
end
[maxAng]=find(BuffDist==max(BuffDist(:)));
% [outR]=imrotate(imD,ceil(-mean(maxAng(1))),'crop');
% 
if maxAng>90
   maxAng=188-maxAng; 
end
% maxAng=15;
[outEdge]=imrotate(out,ceil(-mean(maxAng(1))),'crop');
%

BBox=zeros(size(outEdge));
[X2,X1,Y2,Y1]=findOutExtreme(outEdge);
BBox(X1:X2,Y1)=255;
BBox(X1:X2,Y2)=255;
BBox(X1,Y1:Y2)=255;
BBox(X2,Y1:Y2)=255;


%

BBox=imrotate(BBox,maxAng(1),'crop');

imX=im(101:end-100,101:end-100,:);
subplot(1,2,1),imshow(imX);
[Indx]=find(BBox>0);
imDGray=im(:,:,1);

imDGray(Indx)=255;
im(:,:,1)=imDGray;


subplot(1,2,2),imshow(im);
