clc;
close all;
clear all;

x=xlsread('Data.xlsx');
Correlation_matrix=corrcoef(x);

MAX=max(x);
MIN=min(x);
M=mean(x);
n=size(x,1);

%Ќормирование 
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


xlswrite('C:\Users\eliza\Desktop\5 семестр\интелектувльные системы\lab3\Data.xlsx',X,'Ќормированные данные');
xlswrite('C:\Users\eliza\Desktop\5 семестр\интелектувльные системы\lab3\Data.xlsx',Correlation_matrix,'ћатрица коррел€ции');

distance = pdist(X);

% метод ближайшего соседа
Method1 = linkage(distance,'single');
Dendrogram1 = dendrogram(Method1,0);
title('ћетод ближайшего соседа')
figure

% метод дальнего соседа
Method2 = linkage(distance,'complete');
Dendrogram2 = dendrogram(Method2,0);
title('ћетод дальнего соседа')
figure

% метод средней св€зи
Method3 = linkage(distance,'average');
Dendrogram3 = dendrogram(Method3,0);
title('ћетод средней св€зи')
figure


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
for j=1:1:36
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
R4=[X(:, 1), X(:, 2),X(:, 3), idx6];
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







