%code to display all

bBoxesAll = detect(acfDetector,tImg03);
annotation = acfDetector.ModelName;
allAnnotImg = insertObjectAnnotation(tImg03,'rectangle',bBoxesAll,annotation);

figure();
imshow(allAnnotImg);

%display Top 8

[bBoxesTop, scores] = detect(acfDetector, tImg03, 'Threshold',1);
[val , ind] = maxk(scores,15);  %filter out top 15

imgShowStrongest = insertObjectAnnotation(tImg03, 'rectangle', bBoxesTop(ind,:), annotation);

figure;
title('top8')
imshow(imgShowStrongest)
