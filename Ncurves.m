clear
% построение кривых n(l-d)

%важно ввести вначале:
pkg load io
kwm=1.0; %коэфиц умножения для веберметра
mu0=pi*4e-7;
d=12.9e-3;
d0=0.041;
 d2=0.012;
 dsol1=0.013;
dsol2=0.0275;
Bosn=0.0652/55; %!!!!!----- Основной коэфиц для связи тока блока и поля внешнего
d6=0.01615;
%гвозди:
d7=0.006;
d8=0.004;

%10A
%k6= 7;
%k8= 6;
%k9=7 ;
%k10=7 ;
%k7=1 ;

%20A
k6= 9;
k8= 8;
k9=9 ;
k10=9 ;
k7=2 ;

%40A
%k6= 10;
%k8= 9;
%k9=10 ;
%k10=10 ;
%k7=3 ;

%57.5 A
%k6= 11;
%k8= 10;
%k9=11 ;
%k10=11 ;
%k7=4 ;

 left=9;
bottom=49;
width=1350;
height=636;
figure('position', [left bottom width height])



%------ 6 образ 4 вит
dat6=xlsread('hard example.xlsx',4,'M3:N13');
nvit=4;

  B61=(dat6(:,2)*4e-6)/(nvit*pi*d6^2);
HfromI61=Bosn*dat6(:,1)/mu0;
mu6=B61./(mu0*HfromI61);

muv=mu6;


%------ 7 образ с сжатой катушкой
dat7=xlsread('hard example.xlsx',5,'E3:F6');
  
  B71=(dat7(:,2)*4e-6)/(20*pi*d6^2);
  
%  HfromI5=polyval(p, dat15(:,1));
HfromI71=Bosn*dat7(:,1)/mu0;
mu7=B71./(mu0*HfromI71);


%------ 8 образ
dat8=xlsread('hard example.xlsx',4,'U3:V12');
  B81=(dat8(:,2)*4e-6)/(nvit*pi*d6^2);

%  HfromI5=polyval(p, dat15(:,1));
HfromI81=Bosn*dat8(:,1)/mu0;
mu8=B81./(mu0*HfromI81);


%------ 9 образ с сжатой катушкой
dat9=xlsread('hard example.xlsx',5,'i3:j13');
  
  B91=(dat9(:,2)*4e-6)/(20*pi*d6^2);
HfromI91=Bosn*dat9(:,1)/mu0;
mu9=B91./(mu0*HfromI91);

%------ 10 образ сосред катушкой   ??
dat10=xlsread('hard example.xlsx',5,'m3:n13');
  
  B101=(dat10(:,2)*4e-6)/(20*pi*d6^2);
 HfromI101=Bosn*dat10(:,1)/mu0;
mu10=B101./(mu0*HfromI101);



nraz=[0
 1/(mu8(k8)-1)-1/(muv(k6)-1)
 1/(mu9(k9)-1)-1/(muv(k6)-1)
 1/(mu10(k10)-1)-1/(muv(k6)-1)
  1/(mu7(k7)-1)-1/(muv(k6)-1)
  1];
 
 ld=[43
 32
 25
 19
 10.7
 0];

% semilogy(ld,nraz,'sg-','MarkerSize',9,'LineWidth',2.5)
% hold on
% semilogy(ld(2:3:5),nraz(2:3:5),'sk--','MarkerSize',9,'LineWidth',1.5)

plot(ld,nraz,'sg-','MarkerSize',9,'LineWidth',2.5)