clc;
close all;
clear all;

x=xlsread('Книга1.xlsx');

MAX=max(x);
MIN=min(x);
M=mean(x);
n=size(x,1)

%Нормирование 
% for i=1:1:n
%     X(i,1)=(x(i,1)-MIN(1))/(MAX(1)-MIN(1));
%     X(i,2)=(x(i,2)-MIN(2))/(MAX(2)-MIN(2));
%     X(i,3)=(x(i,3)-MIN(3))/(MAX(3)-MIN(3));
%     X(i,4)=(x(i,4)-MIN(4))/(MAX(4)-MIN(4));
%     X(i,5)=(x(i,5)-MIN(5))/(MAX(5)-MIN(5));
% end
for i=1:1:n
    X(i,1)=(x(i,1)-M(1))/(MAX(1)-MIN(1));
    X(i,2)=(x(i,2)-M(2))/(MAX(2)-MIN(2));
    X(i,3)=(x(i,3)-M(3))/(MAX(3)-MIN(3));
    X(i,4)=(x(i,4)-M(4))/(MAX(4)-MIN(4));
    X(i,5)=(x(i,5)-M(5))/(MAX(5)-MIN(5));
end

%xlswrite('C:\Users\eliza\Desktop\5 семестр\интелектувльные системы\lab3\Updated_data.xlsx',X,'Нормированные данные');


distance = pdist(X);

% метод ближайшего соседа
Method1 = linkage(distance,'single');
Dendrogram1 = dendrogram(Method1,0);
title('Метод ближайшего соседа')
figure

% метод дальнего соседа
Method2 = linkage(distance,'complete');
Dendrogram2 = dendrogram(Method2,0);
title('Метод дальнего соседа')
figure

% метод средней связи
Method3 = linkage(distance,'average');
Dendrogram3 = dendrogram(Method3,0);
title('Метод средней связи')
figure

%общее рассеивание
for i = 1:n
MX1 = mean(X(:, 1));
MX2 = mean(X(:, 2));
MX3 = mean(X(:, 3));
MX4 = mean(X(:, 4));
MX5 = mean(X(:, 5)); 
Distance_squared(i)=(X(i,1)-MX1)^2+(X(i,2)-MX2)^2+(X(i,3)-MX3)^2+(X(i,4)-MX4)^2+(X(i,5)-MX5)^2 ;
end;
S = sum(Distance_squared);

% метод k-средних
%%2
[idx2,C2,sum2] = kmeans(X,2);
title('2 кластера');
scatter3(C2(1,1),C2(1,2),C2(1,3),'filled','k');
hold on
scatter3(C2(2,1),C2(2,2),C2(2,3),'filled','r');

R2=[X(:,1) X(:,2) X(:,3) idx2];
for j=1:1:n
    if R2(j,4)==1 
        scatter3(R2(j,1),R2(j,2),R2(j,3),'k');
        hold on
    end
    if R2(j,4)==2 
        scatter3(R2(j,1),R2(j,2),R2(j,3),'r');
        hold on
    end
   
end
B2=sum(sum2(:, 1));
T2=1-B2/S

%%3
figure
[idx3,C3,sum3] = kmeans(X,3);
title('3 кластера');
scatter3(C3(1,1),C3(1,2),C3(1,3),'filled','k');
hold on
scatter3(C3(2,1),C3(2,2),C3(2,3),'filled','r');
hold on
scatter3(C3(3,1),C3(3,2),C3(3,3),'filled','b');

R3=[X(:,1) X(:,2) X(:,3) idx3];
for j=1:1:n
    if R3(j,4)==1 
        scatter3(R3(j,1),R3(j,2),R3(j,3),'k');
        hold on
    end
    if R3(j,4)==2 
        scatter3(R3(j,1),R3(j,2),R3(j,3),'r');
        hold on
    end
    if R3(j,4)==3 
        scatter3(R3(j,1),R3(j,2),R3(j,3),'b');
        hold on
    end
end
B3=sum(sum3(:, 1));
T3=1-B3/S

%%4
figure
[idx4,C4,sum4] = kmeans(X,4);
title('4 кластера');
scatter3(C4(1,1),C4(1,2),C4(1,3),'filled','k');
hold on
scatter3(C4(2,1),C4(2,2),C4(2,3),'filled','r');
hold on
scatter3(C4(3,1),C4(3,2),C4(3,3),'filled','b');
hold on
scatter3(C4(4,1),C4(4,2),C4(4,3),'filled','m');
R4=[X(:,1) X(:,2) X(:,3) idx4];
for j=1:1:n
    if R4(j,4)==1 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'k');
        hold on
    end
    if R4(j,4)==2 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'r');
        hold on
    end
    if R4(j,4)==3 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'b');
        hold on
    end
    if R4(j,4)==4 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'m');
        hold on
    end
end
B4=sum(sum4(:, 1));
T4=1-B4/S

%%5
figure
[idx5,C5,sum5,D5] = kmeans(X,5);
title('5 кластеров');
scatter3(C5(1,1),C5(1,2),C5(1,3),'filled','k');
hold on
scatter3(C5(2,1),C5(2,2),C5(2,3),'filled','r');
hold on
scatter3(C5(3,1),C5(3,2),C5(3,3),'filled','b');
hold on
scatter3(C5(4,1),C5(4,2),C5(4,3),'filled','m');
hold on
scatter3(C5(5,1),C5(5,2),C5(5,3),'filled','g');
R5=[X(:,1) X(:,2) X(:,3) idx5];
for j=1:1:n
    if R5(j,4)==1 
        scatter3(R5(j,1),R5(j,2),R5(j,3),'k');
        hold on
    end
    if R5(j,4)==2 
        scatter3(R5(j,1),R5(j,2),R5(j,3),'r');
        hold on
    end
    if R5(j,4)==3 
        scatter3(R5(j,1),R5(j,2),R5(j,3),'b');
        hold on
    end
    if R5(j,4)==4 
        scatter3(R5(j,1),R5(j,2),R5(j,3),'m');
        hold on
    end
    if R5(j,4)==5
        scatter3(R5(j,1),R5(j,2),R5(j,3),'g');
        hold on
    end
end
B5=sum(sum5(:, 1));
T5=1-B5/S

%%6
figure
[idx6,C6,sum6] = kmeans(X,6);
title('6 кластеров');
scatter3(C6(1,1),C6(1,2),C6(1,3),'filled','k');
hold on
scatter3(C6(2,1),C6(2,2),C6(2,3),'filled','r');
hold on
scatter3(C6(3,1),C6(3,2),C6(3,3),'filled','b');
hold on
scatter3(C6(4,1),C6(4,2),C6(4,3),'filled','m');
hold on
scatter3(C6(5,1),C6(5,2),C6(5,3),'filled','g');
hold on
scatter3(C6(6,1),C6(6,2),C6(6,3),'filled','y');
R4=[X(:, 1), X(:, 3),X(:, 5), idx6];
for j=1:1:n
    if R4(j,4)==1 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'k');
        hold on
    end
    if R4(j,4)==2 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'r');
        hold on
    end
    if R4(j,4)==3 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'b');
        hold on
    end
    if R4(j,4)==4 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'m');
        hold on
    end
    if R4(j,4)==5 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'g');
        hold on
    end
    if R4(j,4)==6
        scatter3(R4(j,1),R4(j,2),R4(j,3),'y');
        hold on
    end
end

B6=sum(sum6(:, 1));
T6=1-B6/S

%%8
figure
[idx8,C8,sum8] = kmeans(X,8);
title('8 кластеров');
scatter3(C8(1,1),C8(1,2),C8(1,3),'filled','k');
hold on
scatter3(C8(2,1),C8(2,2),C8(2,3),'filled','r');
hold on
scatter3(C8(3,1),C8(3,2),C8(3,3),'filled','b');
hold on
scatter3(C8(4,1),C8(4,2),C8(4,3),'filled','m');
hold on
scatter3(C8(5,1),C8(5,2),C8(5,3),'filled','g');
hold on
scatter3(C8(6,1),C8(6,2),C8(6,3),'filled','y');
hold on
scatter3(C8(7,1),C8(7,2),C8(7,3),'filled','c');
hold on
scatter3(C8(8,1),C8(8,2),C8(8,3),'filled','*k');
R4=[X(:, 1), X(:, 3),X(:, 5), idx8];
for j=1:1:n
    if R4(j,4)==1 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'k');
        hold on
    end
    if R4(j,4)==2 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'r');
        hold on
    end
    if R4(j,4)==3 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'b');
        hold on
    end
    if R4(j,4)==4 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'m');
        hold on
    end
    if R4(j,4)==5 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'g');
        hold on
    end
    if R4(j,4)==6
        scatter3(R4(j,1),R4(j,2),R4(j,3),'y');
        hold on
    end
    if R4(j,4)==7 
        scatter3(R4(j,1),R4(j,2),R4(j,3),'c');
        hold on
    end
    if R4(j,4)==8
        scatter3(R4(j,1),R4(j,2),R4(j,3),'*k');
        hold on
    end
end

B8=sum(sum8(:, 1));
T8=1-B8/S