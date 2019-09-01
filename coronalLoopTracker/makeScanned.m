close all;

%import files from directory
%addpath('C:\Users\afiqAUT\Desktop\Astrophysics is the Bomb\ridersOnTheSolarStorm\20130121'); %added dir to path
imageFiles = dir('C:\Users\afiqAUT\Desktop\Astrophysics is the Bomb\ridersOnTheSolarStorm\20130121\*.jpg');      
nfiles = length(imageFiles);    % Number of files is an integer

%put inside an array
%That shit is epic
str = [""]; %This declares 

for k=1:nfiles
    str(k)= char(imageFiles(k).name);%loads all the things into a string array
end

%displays images
for p=1:5 %display the first 5 variables
    imageLoader = imread(str(p));
    figure;
    imshow(imageLoader);
end
%Run this for me



