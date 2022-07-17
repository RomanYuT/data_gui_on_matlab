%пример 3д графика доверит интервала с http://matlab.exponenta.ru/statist/book2/12/nlpredci.php
function prim
A=1;

 B=-2;

 C=-1.5;

 D=2.6;

 E=2;

 X1=[1 1 10 10 1 5.5 10 5.5 5.5];

 X2=[2 20 20 2 11 20 11 2 11 ];

 Y = A.* X1.^2+B.*X2.^2+C.*X1+D.*X2+E;

 XX1=normrnd(0,1,length(X1),1);

 XX2=unifrnd(-0.1,0.1, length(X2),1);

 YY=normrnd(0,2, length(Y),1);

 X1= X1+ XX1';

 X2= X2+ XX2';

 Y= Y+ YY';

%1.3. Начальные значения коэффициентов

 beta0=[0.1 1 0 1 1];
[beta,r,J] = nlinfit([X1' X2'],Y',@polynom,beta0);
XX1=min(X1):(max(X1)- min(X1))/20: max(X1);

 XX2=min(X2):(max(X2)- min(X2))/20: max(X2);

 inputs=[ XX1' XX2'];
 [Yr, delta]= nlpredci(@polynom,inputs,beta,r,J);
 YN=Yr-delta;
 YV=Yr+delta;
 
 [X_1 X_2]=meshgrid([1:0.5:10],[2:0.5:20]);

 z= beta(1).*X_1.^2+ beta(2).*X_2.^2+ beta(3).*X_1+ beta(4).*X_2+ beta(5);
 
   left=9;
    bottom=49;
    width=1350;
    height=636;
ff4=figure('position', [left bottom width height]);
 plot3(XX1,XX2,YN,'ro', XX1,XX2,YV,'g+',X_1,X_2,z)
 hold on
 surf(X_1,X_2,z)
 xp1=[];
 xp2=[];
 zp=[];
 cc=[];
 for k=1:length(XX1)-1
     xp1=[xp1, [XX1(k) XX1(k) XX1(k+1) XX1(k+1)]'];
         xp2=[xp2, [XX2(k) XX2(k) XX2(k+1) XX2(k+1)]'];
         zp=[zp, [YN(k) YV(k) YV(k+1) YN(k+1)]'];
         cc=[cc,'k'];
 end
colormap('default')
 fill3(xp1,xp2,zp,cc)

 grid on

function yhat = polynom (beta,x)

% разделение вектора коэффициентов beta по отдельным переменным , , , , 

A = beta(1);

B = beta(2);

C = beta(3);

D = beta(4);

E = beta(5);

% разделение матрицы независимых переменных х по отдельным векторам х1, х2,

x1 = x(:,1);

x2 = x(:,2);

% выражение для регрессионной модели

yhat = A.* x1.^2+B.* x2.^2+C.* x1+D.* x2+E;
end

end