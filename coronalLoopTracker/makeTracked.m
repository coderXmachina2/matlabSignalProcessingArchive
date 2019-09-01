%this is a script
%Lets try making 3 images
close all;

for p=1:97   
    imLoader = imread(str(p)); %any image of the Sun in EUV

    bBoxesAll = detect(acfDetector,imLoader);
    annotation = acfDetector.ModelName;
    allAnnotImg = insertObjectAnnotation(imLoader,'rectangle',bBoxesAll,annotation);

    [bBoxesTop, scores] = detect(acfDetector, imLoader, 'Threshold', 1);
    [val , ind] = maxk(scores,15);  %filter out top 15

    imgShowStrongest = insertObjectAnnotation(imLoader, 'rectangle', bBoxesTop(ind,:), annotation);
    
    figure();
    %imshow(imgShowStrongest); %show all 4
    imwrite(imgShowStrongest, str(p)) %we're skipping a design step here
    
end

close all;