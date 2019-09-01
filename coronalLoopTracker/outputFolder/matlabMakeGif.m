close all;

imageFiles = dir('C:\Users\afiqAUT\Desktop\Astrophysics is the Bomb\ridersOnTheSolarStorm\machineMen\imageLabel\outputFolder\*.jpg'); %this takes in a directory     
arrLen = length(imageFiles);%number of images

video = VideoWriter('rocknroll.mp4','Motion JPEG AVI'); %create the video object
open(video);

for ii=1:arrLen %where N is the number of images
  I = imread(imageFiles(ii).name); %read the next image
  writeVideo(video,I); %write the image to file
end

close(video);
clc;