%Lab 1
%Generation of Unit Step and Unit Sample Sequence. The fundamental Unit of
%DSP
clf;

%Begin define length
vectorLength = -10:20;
vectorLength2 = -10:7;
vectorLength3 = 1:20;
vectorLength4 = 1:7;

M = 13; %Delayed by M Samples
N = 20;

u = [zeros(1,10) 1 zeros(1,20)];
ud = [zeros(1,M) 1 zeros(1,N - M - 3)];

%Now do Unit Step
s = [ones(1,20)];

%Unit Step Depayed
sd = [ones(1,20 - M)];

%plot unit sample
figure(1)
stem(vectorLength, u)
xlabel('Time index n');
ylabel('Amplitude A');
title('Unit Sample Sequence');
axis([-10 20 0 1.2]);

hold on

stem(vectorLength2, ud,'Color',[.204 .64 .100])

%Delayed Unit Sample
figure(2)
stem(vectorLength2, ud, 'Color',[.204 .64 .100])
xlabel('Time index n');
ylabel('Amplitude');
title('Unit Sample Delayed');
axis([-10 20 0 1.2]);

%Delayed Unit Sample
%Equivalence Principle
figure(3)
stem(vectorLength3, s)
xlabel('Time index n');
ylabel('Amplitude');
title('Unit Step Sequence');
axis([-10 20 0 1.2]);

%Delayed Unit Step
figure(4)
stem(vectorLength4, sd,  'Color',[.103 .62 .100])
xlabel('Time index n');
ylabel('Amplitude');
title('Unit Step Sequence Delayed');
axis([-10 20 0 1.2]);