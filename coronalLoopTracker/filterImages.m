%code to display all
%
%
close all;

addpath('C:\Users\afiqAUT\Desktop\Astrophysics is the Bomb\ridersOnTheSolarStorm\machineMen\imageLabel\thingsToProcess\'); %added dir to path
imgFiles = dir('C:\Users\afiqAUT\Desktop\Astrophysics is the Bomb\ridersOnTheSolarStorm\machineMen\imageLabel\thingsToProcess\*.jpg'); %this takes in a directory     

%write a loop to run all test images through
lenTIms = length(imgFiles);%for extended purposes

for q=1:lenTIms %take in all images, run through scanner, produce scanned 
                %do inside here
                
    imgLoader = imread(imgFiles(q).name);
    
    bBoxesAll = detect(acfDetector, imgLoader);
    annotation = acfDetector.ModelName;
    allAnnotImg = insertObjectAnnotation(imgLoader ,'rectangle',bBoxesAll,annotation);

    [bBoxesTop, scores] = detect(acfDetector, imgLoader, 'Threshold', 1);
    [val , ind] = maxk(scores,15);  %filter out top 15

    imgShowStrongest = insertObjectAnnotation(imgLoader, 'rectangle', bBoxesTop(ind,:), annotation);

    %figure;
    %title('top8')
    %mshow(imgShowStrongest);
    
    %TODO: change output file DIR
    imwrite(imgShowStrongest, imgFiles(q).name) %this wont save into   
    
    %figure();
    %imshow(allAnnotImg);
    
    %for plotting
    %figure;
    %imshow(imgLoader);
end


%{

bBoxesAll = detect(acfDetector,tImg02);
annotation = acfDetector.ModelName;
allAnnotImg = insertObjectAnnotation(tImg02,'rectangle',bBoxesAll,annotation);

figure();
imshow(allAnnotImg);

%display Top 8
[bBoxesTop, scores] = detect(acfDetector, tImg02, 'Threshold', 1);
[val , ind] = maxk(scores,15);  %filter out top 15

imgShowStrongest = insertObjectAnnotation(tImg02, 'rectangle', bBoxesTop(ind,:), annotation);

figure;
title('top8')
imshow(imgShowStrongest)

%imwrite(allAnnotImg,'savedSunAllTracked.png')
%imwrite(imgShowStrongest,'savedSunTopTracked.png')

%}