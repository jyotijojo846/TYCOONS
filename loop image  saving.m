counter = 1;
FDetect = vision.CascadeObjectDetector;
vidDevice = imaq.VideoDevice('winvideo', 1, 'YUY2_640x480', ... % Acquire input video stream
                    'ROI', [1 1 640 480], ...
                    'ReturnedColorSpace', 'rgb');
vidInfo = imaqhwinfo(vidDevice);
nFrame = 0
while(nFrame<1)
rgbFrame = step(vidDevice); % Acquire single frame
rgbFrame = flipdim(rgbFrame,2);
BB = step(FDetect,rgbFrame);

 figure,
 imshow(rgbFrame);

 hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
for i = 1:size(BB,1)
 J= imcrop(rgbFrame,BB(i,:));
   figure(3),subplot(2,2,i);imshow(J);
   savename = strcat('sahil' ,num2str(counter), '.jpg'); %this is where and what your image will be saved
imwrite(J, savename);
counter = counter +1;
end
title('Face Detection');
nFrame=nFrame+1;
end
clear vidDevice ;
clc ;