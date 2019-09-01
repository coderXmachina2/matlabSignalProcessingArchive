close all;

%load all images into an array
%myFolder = 'C:\Users\afiqAUT\Desktop\Astrophysics is the Bomb\sdodata\Raid_3\userdata\production\userarchives\20190805080349\img 21012013 - 22012013\machineMen\imageLabel\clusterDump';
%addpath('C:\Users\afiqAUT\Desktop\Astrophysics is the Bomb\ridersOnTheSolarStorm\machineMen\imageLabel\outputFolder'); %added dir to path

tImg04 = imread(str(97)); %any image of the Sun in EUV

bBoxesAll = detect(acfDetector,tImg04);
annotation = acfDetector.ModelName;
allAnnotImg = insertObjectAnnotation(tImg04,'rectangle',bBoxesAll,annotation);

figure();
imshow(allAnnotImg);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[bBoxesTop, scores] = detect(acfDetector, tImg04, 'Threshold',1);
[val , ind] = maxk(scores,15);  %filter out top 16

imgShowStrongest = insertObjectAnnotation(tImg04, 'rectangle', bBoxesTop(ind,:), annotation);
nomInit = '0';

%for p=1:3
%    imgLoader = str(p);
    
%    nomLoader = '0' + char(p) + '.png';
%    figure;
%    imwrite(imgShowStrongest, imgLoader);
%end

%figure;
%title('top8')
%imshow(imgShowStrongest)
imwrite(imgShowStrongest, 'seq097.png'); %