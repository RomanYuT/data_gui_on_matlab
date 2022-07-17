clear


%важно ввести вначале:
%pkg load io
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

%шприц для феропирмеси
d40=0.0047;
%труба для засыпки
d50=0.04;
d51=0.0398;
d52=0.0424;
d80=0.01958;

legnld{1}='nulev str';
nleg=1;

left=9;
bottom=49;
width=1350;
height=636;
hf=figure('position', [left bottom width height])
%plot(HfromI/1000,B,'sk-','MarkerSize',9,'LineWidth',1.5)
hold on
grid minor
%set(hf,'fontsize',20)
ylabel('B ��','fontsize',20)  %M, kA/m
xlabel('                 H, kA/m ','fontsize',20);
set(gca,'fontsize',30)


%%------ 50 образ с корот катушкой 1 вит.
%nleg=nleg+1;
%legnld{nleg}='50 obr 1 vit alf~19';
%dat50=xlsread('hard example.xlsx',8,'f3:g6');
%%nvit=4;
%
%  B50=(dat50(:,2)*4e-6)/(1*pi*d51^2);
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI50=Bosn*dat50(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI50]/1000,[0; B50],'sg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])


%}
%------ 51 образ с корот катушкой 2 вит. внутри
%nleg=nleg+1;
%legnld{nleg}='51 obr 1 tonk vit alf=4,12';
%dat51=xlsread('hard example.xlsx',8,'o3:p11');
%%nvit=4;
%
%  B51=(dat51(:,2)*4e-6)/(2*pi*d51^2);
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI51=Bosn*dat51(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI51]/1000,[0; B51],'og-','MarkerSize',9,'LineWidth',2.5,'color',[60/255 190/255 0])
%%plot([0; HfromI51(end)]/1000,[0; B51(end)],'ok-','MarkerSize',9,'LineWidth',1.5)


%------ 51 образ с корот катушкой 2 вит снаружи.
nleg=nleg+1;
legnld{nleg}='51 obr 2 tolst vit alf=4,12';
dat512=xlsread('hard example.xlsx',9,'a3:b19');
%nvit=4;

  B512=(dat512(:,2)*4e-6)/(2*pi*d51^2)/1.05;
 % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
HfromI512=Bosn*dat512(:,1)/mu0;
mu512=B512./(mu0*HfromI512);
M512=(mu512-1).*HfromI512;
%plot([0; HfromI512]/1000,[0; M512]/1000,'og--','MarkerSize',9,'LineWidth',2.5,'color',[6/255 190/255 170/255])
%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
plot([0; HfromI512]/1000,[0; B512],'og-','MarkerSize',9,'LineWidth',2.5,'color',[6/255 190/255 170/255])
%plot([0; HfromI512(end)]/1000,[0; B512(end)],'ok-','MarkerSize',9,'LineWidth',1.5)
%-----------

%figure; 
%plot(dat51(1:end-1,1),dat512([1 3 6 9 10 12 14 16],2)./dat51(1:end-1,2),'o-','color','r')
%grid minor  on;
%
%------ 52 образ с корот катушкой 2 вит снаружи.
nleg=nleg+1;
legnld{nleg}='52 obr 2 tonk nar vit alf=2';
dat52=xlsread('hard example.xlsx',9,'f3:g19');
%nvit=4;

  B52=(dat52(:,2)*4e-6)/(2*pi*d51^2)/1.05;
 % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
HfromI52=Bosn*dat52(:,1)/mu0;
mu52=B52./(mu0*HfromI52);
M52=(mu52-1).*HfromI52;
%plot([0; HfromI52]/1000,[0; M52]/1000,'og--','MarkerSize',9,'LineWidth',2.5,'color',[206/255 19/255 170/255])
%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
plot([0; HfromI52]/1000,[0; B52],'og--','MarkerSize',9,'LineWidth',2.5,'color',[206/255 19/255 170/255])
%plot([0; HfromI52(end)]/1000,[0; B52(end)],'ok-','MarkerSize',9,'LineWidth',1.5)

%plot(HfromI512(end-7:end)/1000,(B512(end-7:end)-B52(end-7:end)),'ok-','MarkerSize',9,'LineWidth',1.5)
%-----

%------ 52 образ с корот катушкой 2 вит внутри. alf=1,98
%nleg=nleg+1;
%legnld{nleg}='52 obr 2 tonk vnut vit alf=2';
%dat522=xlsread('hard example.xlsx',11,'f3:g11');
%%nvit=4;
%
%  B522=(dat522(:,2)*4e-6)/(2*pi*d51^2);
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI522=Bosn*dat522(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI522]/1000,[0; B522],'sg-','MarkerSize',9,'LineWidth',2.5,'color',[6/255 19/255 170/255])
%%plot([0; HfromI52(end)]/1000,[0; B52(end)],'ok-','MarkerSize',9,'LineWidth',1.5)

%plot(HfromI512(end-7:end)/1000,(B512(end-7:end)-B52(end-7:end)),'ok-','MarkerSize',9,'LineWidth',1.5)
%------------
%figure; 
%plot(dat522(1:end-1,1),dat52([1:5 7 9 11],2)./dat522(1:end-1,2),'o-','color','r')
%grid minor  on;
%
%------ 52 образ с корот катушкой 1 вит толст провода снаружи. alf=2,06
%dat522=xlsread('hard example.xlsx',9,'k3:l8');
%%nvit=4;
%
%  B522=(dat522(:,2)*4e-6)/(1*pi*d52^2);
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI522=Bosn*dat522(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI522]/1000,[0; B522],'og--','MarkerSize',9,'LineWidth',2.5,'color',[246/255 19/255 170/255])
%%plot([0; HfromI522(end)]/1000,[0; B522(end)],'ok-','MarkerSize',9,'LineWidth',1.5)




%------ 53 образ с корот катушкой 2 вит снаружи.
%nleg=nleg+1;
%legnld{nleg}='53 obr 2 tonk nar vit alf=1,01';
%dat53=xlsread('hard example.xlsx',9,'p5:q12');
%nvit=2;
%
%  B53=(dat53(:,2)*4e-6)/(2*pi*d51^2)/1.05;
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI53=Bosn*dat53(:,1)/mu0;
%mu53=B53./(mu0*HfromI53);
%M53=(mu53-1).*HfromI53;
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI53]/1000,[0; B53],'.g--','MarkerSize',9,'LineWidth',2.5,'color',[46/255 49/255 170/255])
%%plot([0; HfromI53(end)]/1000,[0; B53(end)],'ok-','MarkerSize',9,'LineWidth',1.5)
%------
%

%------ 53 образ с корот катушкой 2 вит внутри. alf=1,02
nleg=nleg+1;
legnld{nleg}='53 obr 2 tonk vnutr vit alf=1,01';
dat532=xlsread('hard example.xlsx',11,'a3:b11');
%nvit=2;

  B532=(dat532(:,2)*4e-6)/(2*pi*d51^2);
 % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
HfromI532=Bosn*dat532(:,1)/mu0;
mu532=B532./(mu0*HfromI532);
M532=(mu532-1).*HfromI532;
%plot([0; HfromI532]/1000,[0; M532]/1000,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[46/255 49/255 170/255])
%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
plot([0; HfromI532]/1000,[0; B532],'xg-','MarkerSize',9,'LineWidth',2.5,'color',[46/255 49/255 170/255])
%plot([0; HfromI53(end)]/1000,[0; B53(end)],'ok-','MarkerSize',9,'LineWidth',1.5)
%------
%figure; 
%plot(dat532(5:8,1),dat53([1 3 5 7],2)./dat532(5:8,2),'o-','color','r')
%grid minor  on;

%------ 54 образ с корот катушкой 10 вит .
%nleg=nleg+1;
%legnld{nleg}='54 obr 10 tonk vit alf=10,1';
%dat54=xlsread('hard example.xlsx',11,'p3:q26');
%%nvit=2;
%
%  B54=(dat54(:,2)*4e-6)/(10*pi*d51^2)/1.05;
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI54=Bosn*dat54(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI54]/1000,[0; B54],'xg-','MarkerSize',9,'LineWidth',2.5,'color',[46/255 49/255 170/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%%------ 50 образ с корот катушкой 10 вит .  alf=19,4
%nleg=nleg+1;
%legnld{nleg}='50 obr 10 vit alf=19,9';
%dat502=xlsread('hard example.xlsx',12,'a3:b13');
%%nvit=2;
%
%  B502=(dat502(:,2)*4e-6)/(10*pi*d51^2)/1.05;
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI502=Bosn*dat502(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI502]/1000,[0; B502],'og-.','MarkerSize',9,'LineWidth',2.5,'color',[246/255 49/255 170/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%%------

%------ 55 образ с корот катушкой 10 вит снаружи  alf=16
%dat55=xlsread('hard example.xlsx',12,'f3:g13');
%%nvit=2;
%
%  B55=(dat55(:,2)*4e-6)/(10*pi*d51^2)/1.05;
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI55=Bosn*dat55(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI55]/1000,[0; B55],'vg-','MarkerSize',9,'LineWidth',2.5,'color',[246/255 249/255 17/255])
%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%%------ 55 образ с корот катушкой 10 вит снаружи без подставки  alf=16
%dat552=xlsread('hard example.xlsx',12,'k3:l8');
%%nvit=2;
%
%  B552=(dat552(:,2)*4e-6)/(10*pi*d51^2)/1.05;
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI552=Bosn*dat552(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI552]/1000,[0; B552],'sg-','MarkerSize',9,'LineWidth',2.5,'color',[6/255 249/255 17/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%%------

%------ 55 образ с корот катушкой 10 вит снар с подставкой L=134  alf=16
%dat553=xlsread('hard example.xlsx',12,'p3:q7');
%%nvit=2;
%
%  B553=(dat553(:,2)*4e-6)/(10*pi*d51^2)/1.05;
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI553=Bosn*dat553(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI553]/1000,[0; B553],'vg--','MarkerSize',9,'LineWidth',2.5,'color',[246/255 9/255 17/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%------ 55 образ с корот катушкой 10 вит внутри с L=72 и симметр катушкой.
%nleg=nleg+1;
%legnld{nleg}='55 obr 10 vit tonk L=72 alf=16';
%dat554=xlsread('hard example.xlsx',13,'a3:b7');
%%nvit=2;
%
%  B554=(dat554(:,2)*4e-6)/(10*pi*d51^2)/1.05;
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI554=Bosn*dat554(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI554]/1000,[0; B554],'pg--','MarkerSize',9,'LineWidth',2,'color',[24/255 9/255 17/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%%------ 50 образ с корот катушкой 10 вит с L=72 и катуш на сер уст!alf=19,3
%nleg=nleg+1;
%legnld{nleg}='50 obr 10 vit tonk alf=19,3';
%dat503=xlsread('hard example.xlsx',13,'f3:g7');
%%nvit=2;
%
%  B503=(dat503(:,2)*4e-6)/(10*pi*d51^2)/1.05;
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI503=Bosn*dat503(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI503]/1000,[0; B503],'vg-','MarkerSize',9,'LineWidth',2.,'color',[246/255 9/255 17/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%%------

%------ 50 образ с корот катушкой 10 вит ТОНК ПРОВОДА  с L=0 и катуш на сер уст!alf=20,1
%nleg=nleg+1;
%legnld{nleg}='50 obr 10 vit alf=19,7';
%dat504=xlsread('hard example.xlsx',13,'k3:l13');
%%nvit=2;
%
%  B504=(dat504(:,2)*4e-6)/(10*pi*d51^2)/1.05;
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI504=Bosn*dat504(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI504]/1000,[0; B504],'sg-','MarkerSize',9,'LineWidth',1.,'color',[46/255 9/255 17/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------
%
%%------ 56 образ с корот катушкой 10 вит ТОНК ПРОВОДА  с подставкой L.
%nleg=nleg+1;
%legnld{nleg}='56 obr 10 vit tonk alf=17,6';
%dat56=xlsread('hard example.xlsx',14,'a3:b7');
%%nvit=2;
%
%  B56=(dat56(:,2)*4e-6)/(10*pi*d51^2)/1.05;
% % B62=(dat6(:,2)*4e-6)/(nvit*pi*(d6+0.0001)^2); 
%HfromI56=Bosn*dat56(:,1)/mu0;
%
%%plot(HfromI61/1000,B62,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[210/255 190/255 0])
%plot([0; HfromI56]/1000,[0; B56],'>g-','MarkerSize',9,'LineWidth',1.,'color',[46/255 209/255 17/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%%------
%
%------ 57 образ с корот катушкой 10 вит ТОНК ПРОВОДА  с подставкой L=132 и коорд(на трубе) катуш 257
nleg=nleg+1;
legnld{nleg}='57 obr 10 vit L=0 hs=389 alf=12,9';
dat57=xlsread('hard example.xlsx',14,'f3:g7');
%nvit=2;

B57=(dat57(:,2)*4e-6)/(10*pi*d51^2)/1.05;
HfromI57=Bosn*dat57(:,1)/mu0;
mu57=B57./(mu0*HfromI57);
M57=(mu57-1).*HfromI57;
%plot([0; HfromI57]/1000,[0; M57]/1000,'<g-','MarkerSize',9,'LineWidth',2.5,'color',[46/255 49/255 17/255])
plot([0; HfromI57]/1000,[0; B57],'<r-','MarkerSize',9,'LineWidth',1.,'color',[46/255 49/255 17/255])
%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%
%%------ 58 образ с корот катушкой 10 вит ТОНК ПРОВОДА с подставкой L=132,коорд катуш 257
%nleg=nleg+1;
%legnld{nleg}='58 obr 10 vit L=0 hs=389 alf=13,1';
%dat58=xlsread('hard example.xlsx',14,'k3:l7');
%%nvit=2;
%
%B58=(dat58(:,2)*4e-6)/(10*pi*d51^2)/1.05;
%HfromI58=Bosn*dat58(:,1)/mu0;
%
%colgr=gallery ("integerdata", [1, 255], [1 3],nleg)/256
%plot([0; HfromI58]/1000,[0; B58],'og--','MarkerSize',9,'LineWidth',1.,'color',colgr)
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'ok--','MarkerSize',9,'LineWidth',1.5)
%%------

%------ 59 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
%nleg=nleg+1;
%legnld{nleg}='59 obr 10 vit alf=13,9';
%dat59=xlsread('hard example.xlsx',14,'p3:q7');
%%nvit=2;
%
%B59=(dat59(:,2)*4e-6)/(10*pi*d51^2)/1.05;
%HfromI59=Bosn*dat59(:,1)/mu0;
%
%plot([0; HfromI59]/1000,[0; B59],'sk-','MarkerSize',9,'LineWidth',1.,'color',[76/255 139/255 17/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------
%
%%------ 60 образ с корот катушкой 10 вит ТОНК ПРОВОДА выше чем обычно hs=257 
%nleg=nleg+1;
%legnld{nleg}='60 obr 10 vit hs=257 alf=10,3';
%dat60=xlsread('hard example.xlsx',14,'u3:v7');
%%nvit=2;
%
%B60=(dat60(:,2)*4e-6)/(10*pi*d51^2)/1.05;
%HfromI60=Bosn*dat60(:,1)/mu0;
%
%plot([0; HfromI60]/1000,[0; B60],'vg--','MarkerSize',9,'LineWidth',1.,'color',[106/255 169/255 17/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'vk--','MarkerSize',9,'LineWidth',1.5)
%%------
%}
%------ 60 образ с корот катушкой 10 вит ТОНК ПРОВОДА 
%nleg=nleg+1;
%legnld{nleg}='60 obr 10 vit hs=199 alf=10,2';
%dat601=xlsread('hard example.xlsx',15,'a3:b7');
%%nvit=2;
%
%B601=(dat601(:,2)*4e-6)/(10*pi*d51^2)/1.05;
%HfromI601=Bosn*dat601(:,1)/mu0;
%
%plot([0; HfromI601]/1000,[0; B601],'+g-','MarkerSize',9,'LineWidth',1.,'color',[136/255 199/255 17/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'+k-','MarkerSize',9,'LineWidth',1.5)
%------
%

%------ 61 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
nleg=nleg+1;
legnld{nleg}='61 obr 10 vit alf=9,4';
dat61=xlsread('hard example.xlsx',15,'f3:g7');
%nvit=2;

B61=(dat61(:,2)*4e-6)/(10*pi*d51^2)/1.05;
HfromI61=Bosn*dat61(:,1)/mu0;
mu61=B61./(mu0*HfromI61);
M61=(mu61-1).*HfromI61;

%plot([0; HfromI61]/1000,[0; M61]/1000,'xg-','MarkerSize',9,'LineWidth',2.5,'color',[166/255 229/255 17/255])
plot([0; HfromI61]/1000,[0; B61],'xg-','MarkerSize',9,'LineWidth',1.,'color',[166/255 229/255 17/255])
%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%------ 62 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
%nleg=nleg+1;
%legnld{nleg}='62 obr 10 vit hs=140 alf=7,66';
%dat62=xlsread('hard example.xlsx',15,'k3:l7');
%%nvit=2;
%
%B62=(dat62(:,2)*4e-6)/(10*pi*d51^2)/1.05;
%HfromI62=Bosn*dat62(:,1)/mu0;
%
%plot([0; HfromI62]/1000,[0; B62],'pg--','MarkerSize',9,'LineWidth',1.,'color',[196/255 24/255 17/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%------ 63 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
nleg=nleg+1;
legnld{nleg}='63 obr 10 vit alf=6,78';
dat63=xlsread('hard example.xlsx',15,'p3:q7');
%nvit=2;

B63=(dat63(:,2)*4e-6)/(10*pi*d51^2)/1.05;
HfromI63=Bosn*dat63(:,1)/mu0;
mu63=B63./(mu0*HfromI63);
M63=(mu63-1).*HfromI63;
%plot([0; HfromI63]/1000,[0; M63]/1000,'.g-','MarkerSize',9,'LineWidth',2.5,'color',[246/255 9/255 11/255])
plot([0; HfromI63]/1000,[0; B63],'.g-','MarkerSize',9,'LineWidth',1.,'color',[246/255 9/255 11/255])
%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%

%------ 64 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
%nleg=nleg+1;
%legnld{nleg}='64 obr 10 vit alf=20,3';
%dat64=xlsread('hard example2.xlsx',1,'a3:b7');
%%nvit=2;
%
%B64=(dat64(:,2)*4e-6)/(10*pi*d51^2)/1.05;
%HfromI64=Bosn*dat64(:,1)/mu0;
%
%plot([0; HfromI64]/1000,[0; B64],'<g-','MarkerSize',9,'LineWidth',1.,'color',[206/255 19/255 211/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------
%}
%------ 65 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
nleg=nleg+1;
legnld{nleg}='65 obr 10 vit alf=18,8';
dat65=xlsread('hard example2.xlsx',1,'f3:g7');
%nvit=2;

B65=(dat65(:,2)*4e-6)/(10*pi*d51^2)/1.05;
HfromI65=Bosn*dat65(:,1)/mu0;
mu65=B65./(mu0*HfromI65);
M65=(mu65-1).*HfromI65;
%plot([0; HfromI65]/1000,[0; M65]/1000,'>g-','MarkerSize',9,'LineWidth',2.5,'color',[206/255 19/255 211/255])
plot([0; HfromI65]/1000,[0; B65],'>g-','MarkerSize',9,'LineWidth',1.,'color',[206/255 19/255 211/255])
%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------


%------ 66 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
%nleg=nleg+1;
%legnld{nleg}='66 obr 10 vit alf=15,9';
%dat66=xlsread('hard example2.xlsx',1,'k3:l7');
%%nvit=2;
%
%B66=(dat66(:,2)*4e-6)/(10*pi*d51^2)/1.05;
%HfromI66=Bosn*dat66(:,1)/mu0;
%
%plot([0; HfromI66]/1000,[0; B66],'pg-','MarkerSize',9,'LineWidth',1.,'color',[246/255 9/255 11/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%}
%------ 67 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
nleg=nleg+1;
legnld{nleg}='67 obr 10 vit alf=16';
dat67=xlsread('hard example2.xlsx',1,'p3:q7');
%nvit=2;

B67=(dat67(:,2)*4e-6)/(10*pi*d51^2)/1.05;
HfromI67=Bosn*dat67(:,1)/mu0;
mu67=B67./(mu0*HfromI67);
M67=(mu67-1).*HfromI67;
%plot([0; HfromI67]/1000,[0; M67]/1000,'dg--','MarkerSize',9,'LineWidth',2.5,'color',[246/255 9/255 11/255])
plot([0; HfromI67]/1000,[0; B67],'dg--','MarkerSize',9,'LineWidth',1.,'color',[246/255 9/255 11/255])
%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------
%

%------ 80 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
%nleg=nleg+1;
%legnld{nleg}='80 obr 10 vit alf=1,84';
%dat80=xlsread('hard example2.xlsx',2,'a3:b7');
%%nvit=2;
%
%B80=(dat80(:,2)*4e-6)/(10*pi*d80^2)/1.05;
%HfromI80=Bosn*dat80(:,1)/mu0;
%
%plot([0; HfromI80]/1000,[0; B80],'do--','MarkerSize',9,'LineWidth',1.,'color',[29/255 129/255 111/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%------ 81 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
%nleg=nleg+1;
%legnld{nleg}='81 obr 10 vit alf=1,84';
%dat81=xlsread('hard example2.xlsx',2,'f3:g7');
%%nvit=2;
%
%B81=(dat81(:,2)*4e-6)/(10*pi*d80^2)/1.05;
%HfromI81=Bosn*dat81(:,1)/mu0;
%
%plot([0; HfromI81]/1000,[0; B81],'+--','MarkerSize',9,'LineWidth',1.,'color',[59/255 199/255 111/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%------ 82 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
%nleg=nleg+1;
%legnld{nleg}='82 obr 10 vit alf=1,84';
%dat82=xlsread('hard example2.xlsx',2,'k3:l7');
%%nvit=2;
%
%B82=(dat82(:,2)*4e-6)/(10*pi*d80^2)/1.05;
%HfromI82=Bosn*dat82(:,1)/mu0;
%
%plot([0; HfromI82]/1000,[0; B82],'x-','MarkerSize',9,'LineWidth',1.,'color',[29/255 109/255 191/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%------ 83 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
%nleg=nleg+1;
%legnld{nleg}='83 obr 10 vit alf=1,84';
%dat83=xlsread('hard example2.xlsx',2,'p3:q7');
%%nvit=2;
%
%B83=(dat83(:,2)*4e-6)/(10*pi*d80^2)/1.05;
%HfromI83=Bosn*dat83(:,1)/mu0;
%
%plot([0; HfromI83]/1000,[0; B83],'s--','MarkerSize',9,'LineWidth',1.,'color',[229/255 129/255 111/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%------ 84 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
%nleg=nleg+1;
%legnld{nleg}='84 obr 10 vit alf=1,';
%dat84=xlsread('hard example2.xlsx',4,'a3:b7');
%%nvit=2;
%
%B84=(dat84(:,2)*4e-6)/(10*pi*d80^2)/1.05;
%HfromI84=Bosn*dat84(:,1)/mu0;
%
%plot([0; HfromI84]/1000,[0; B84],'p-','MarkerSize',9,'LineWidth',1.,'color',[129/255 129/255 111/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%------ 87 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
%nleg=nleg+1;
%legnld{nleg}='87 obr 10 vit alf=1,';
%dat87=xlsread('hard example2.xlsx',4,'p3:q7');
%%nvit=2;
%
%B87=(dat87(:,2)*4e-6)/(10*pi*d80^2)/1.05;
%HfromI87=Bosn*dat87(:,1)/mu0;
%
%plot([0; HfromI87]/1000,[0; B87],'p-','MarkerSize',9,'LineWidth',1.,'color',[229/255 29/255 111/255])
%%plot([0; HfromI54(end)]/1000,[0; B54(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

%------ 93 образ с корот катушкой 10 вит ТОНК ПРОВОДА  
nleg=nleg+1;
legnld{nleg}='93 obr 3 vit alf=0,15';
dat93=xlsread('hard example2.xlsx',6,'a3:b8');
%nvit=2;

B93=(dat93(:,2)*4e-6)/(3*pi*d80^2)/1.05;
HfromI93=Bosn*dat93(:,1)/mu0;

plot([0; HfromI93]/1000,[0; B93],'p-','MarkerSize',9,'LineWidth',1.,'color',[9/255 29/255 111/255])
%plot([0; HfromI93(end)]/1000,[0; B93(end)],'sk-','MarkerSize',9,'LineWidth',1.5)
%------

hl=legend(legnld(2:end),'location', 'northwest');
set(hl,'fontsize',20)

%
%\\\\\\\\\\\\
figure('position', [left bottom width height]); hold on
%p2=polyfit(HfromI61,mu6,7);
%plot(HfromI61/1000,mu6,'sr--','MarkerSize',9,'LineWidth',2.5)
% plot([HfromI61(1)/1000:1:HfromI61(end)/1000],polyval(p2,[HfromI61(1):1000:HfromI61(end)]),'.k--','MarkerSize',9,'LineWidth',2.5)

%plot([HfromI6(1)/1000:1:HfromI6(end)/1000],polyval(p2,[HfromI6(1):1000:HfromI6(end)]),'.k--','MarkerSize',9,'LineWidth',2.5)

set(gca,'fontsize',30)
grid minor 
%{
plot([1 2 4 6.78 9.4 12.9 16 19.4],...
[B53(end) B52(end-1) B512(end-1) B63(end) B61(end) B57(end) B67(end) B65(end)],'o-','MarkerSize',9,'LineWidth',2.5)
plot([1 2 4 6.78 9.4 12.9 16 19.4],...
[B53(end-2) B52(end-3) B512(end-3) B63(end-1) B61(end-1) B57(end-1) B67(end-1) B65(end-1)],'o-','MarkerSize',9,'LineWidth',2.5)
plot([1 2 4 6.78 9.4 12.9 16 19.4],...
[B53(end-4) B52(end-5) B512(end-5) B63(end-2) B61(end-2) B57(end-2) B67(end-2) B65(end-2)],'+-','MarkerSize',9,'LineWidth',2.5)
plot([1 2 4 6.78 9.4 12.9 16 19.4],...
[B53(end-6) B52(end-7) B512(end-7) B63(end-3) B61(end-3) B57(end-3) B67(end-3) B65(end-3)],'o-','MarkerSize',9,'LineWidth',2.5)
plot([2 4 6.78 9.4 12.9 16 19.4],...
[             B52(end-9) B512(end-11) B63(end-4) B61(end-4) B57(end-4) B67(end-4) B65(end-4)],'v-','MarkerSize',9,'LineWidth',2.5)
%---
plot([7.66 10.2 13.9 15.9 20.3],...
[B62(end) B601(end) B59(end) B66(end) B64(end)],'p--','MarkerSize',9,'LineWidth',2.5)
plot([7.66 10.2 13.9 15.9 20.3],...
[B62(end-1) B601(end-1) B59(end-1) B66(end-1) B64(end-1)],'s--','MarkerSize',9,'LineWidth',2.5)
plot([7.66 10.2 13.9 15.9 20.3],...
[B62(end-2) B601(end-2) B59(end-2) B66(end-2) B64(end-2)],'d--','MarkerSize',9,'LineWidth',2.5)
plot([7.66 10.2 13.9 15.9 20.3],...
[B62(end-3) B601(end-3) B59(end-3) B66(end-3) B64(end-3)],'v--','MarkerSize',9,'LineWidth',2.5)
plot([7.66 10.2 13.9 15.9 20.3],...
[B62(end-4) B601(end-4) B59(end-4) B66(end-4) B64(end-4)],'<--','MarkerSize',9,'LineWidth',2.5)
%--
plot([1 2 4 ],...
[B53(end-1) B52(end-2) B512(end-2)],'>-r','MarkerSize',9,'LineWidth',1.5)
plot([1 2 4 ],...
[B53(end-3) B52(end-4) B512(end-4)],'+-r','MarkerSize',9,'LineWidth',1.5)
plot([1 2 4 ],...
[B53(end-5) B52(end-6) B512(end-6)],'o-r','MarkerSize',9,'LineWidth',1.5)
plot([2 4 ],...
[B52(end-8) B512(end-8)],'.--r','MarkerSize',9,'LineWidth',1.5)
plot([2 4 ],...
[B52(end-10) B512(end-14)],'x--r','MarkerSize',9,'LineWidth',1.5)
plot([2 4 ],...
[B52(end-11) B512(end-16)],'*--r','MarkerSize',9,'LineWidth',1.5)
%--
plot([1.84 1.84 1.84 1.84 1.84],...
B80,'>r','MarkerSize',9,'LineWidth',2.5)
%}
%-------------- мю(альфа)
plot([1 2 4 6.78 9.4 12.9 16 19.4],...
[mu53(end) mu52(end-1) mu512(end-1) mu63(end) mu61(end) mu57(end) mu67(end) mu65(end)]-1,'o-','MarkerSize',9,'LineWidth',1)
plot([1 2 4 6.78 9.4 12.9 16 19.4],...
[mu53(end-2) mu52(end-3) mu512(end-3) mu63(end-1) mu61(end-1) mu57(end-1) mu67(end-1) mu65(end-1)]-1,'s--','MarkerSize',9,'LineWidth',1)
plot([1 2 4 6.78 9.4 12.9 16 19.4],...
[mu53(end-4) mu52(end-5) mu512(end-5) mu63(end-2) mu61(end-2) mu57(end-2) mu67(end-2) mu65(end-2)]-1,'+-.','MarkerSize',9,'LineWidth',1)
plot([1 2 4 6.78 9.4 12.9 16 19.4],...
[mu53(end-6) mu52(end-7) mu512(end-7) mu63(end-3) mu61(end-3) mu57(end-3) mu67(end-3) mu65(end-3)]-1,'o:','MarkerSize',9,'LineWidth',1)
plot([2 4 6.78 9.4 12.9 16 19.4],...
[             mu52(end-9) mu512(end-11) mu63(end-4) mu61(end-4) mu57(end-4) mu67(end-4) mu65(end-4)]-1,'v-','MarkerSize',9,'LineWidth',1)
%{
%---
plot([7.66 10.2 13.9 15.9 20.3],...
[B62(end) B601(end) B59(end) B66(end) B64(end)],'p--','MarkerSize',9,'LineWidth',2.5)
plot([7.66 10.2 13.9 15.9 20.3],...
[B62(end-1) B601(end-1) B59(end-1) B66(end-1) B64(end-1)],'s--','MarkerSize',9,'LineWidth',2.5)
plot([7.66 10.2 13.9 15.9 20.3],...
[B62(end-2) B601(end-2) B59(end-2) B66(end-2) B64(end-2)],'d--','MarkerSize',9,'LineWidth',2.5)
plot([7.66 10.2 13.9 15.9 20.3],...
[B62(end-3) B601(end-3) B59(end-3) B66(end-3) B64(end-3)],'v--','MarkerSize',9,'LineWidth',2.5)
plot([7.66 10.2 13.9 15.9 20.3],...
[B62(end-4) B601(end-4) B59(end-4) B66(end-4) B64(end-4)],'<--','MarkerSize',9,'LineWidth',2.5)
%--
plot([1 2 4 ],...
[B53(end-1) B52(end-2) B512(end-2)],'>-r','MarkerSize',9,'LineWidth',1.5)
plot([1 2 4 ],...
[B53(end-3) B52(end-4) B512(end-4)],'+-r','MarkerSize',9,'LineWidth',1.5)
plot([1 2 4 ],...
[B53(end-5) B52(end-6) B512(end-6)],'o-r','MarkerSize',9,'LineWidth',1.5)
plot([2 4 ],...
[B52(end-8) B512(end-8)],'.--r','MarkerSize',9,'LineWidth',1.5)
plot([2 4 ],...
[B52(end-10) B512(end-14)],'x--r','MarkerSize',9,'LineWidth',1.5)
plot([2 4 ],...
[B52(end-11) B512(end-16)],'*--r','MarkerSize',9,'LineWidth',1.5)
%--
plot([1.84 1.84 1.84 1.84 1.84],...
B80,'>r','MarkerSize',9,'LineWidth',2.5)
%}

xlim([0 21])

ylabel('hi','fontsize',20)
xlabel('         L/D=alfa, 1','fontsize',20);
hl=legend('50A','40A','30A','20A','10A','location', 'northwest');
%

%{
%\\\\\\\\
figure('position', [left bottom width height]); hold on
%p2=polyfit(HfromI61,mu6,7);
%plot(HfromI61/1000,mu6,'sr--','MarkerSize',9,'LineWidth',2.5)
% plot([HfromI61(1)/1000:1:HfromI61(end)/1000],polyval(p2,[HfromI61(1):1000:HfromI61(end)]),'.k--','MarkerSize',9,'LineWidth',2.5)

%plot([HfromI6(1)/1000:1:HfromI6(end)/1000],polyval(p2,[HfromI6(1):1000:HfromI6(end)]),'.k--','MarkerSize',9,'LineWidth',2.5)

set(gca,'fontsize',30)
grid minor  on
plot([1.8 0.9],...
[B83(1) B87(1)],'o-','MarkerSize',9,'LineWidth',2.5)
plot([1.8 0.9],...
[B83(2) B87(2)],'o-','MarkerSize',9,'LineWidth',2.5)
plot([1.8 0.9],...
[B83(3) B87(3)],'o-','MarkerSize',9,'LineWidth',2.5)
plot([1.8 0.9],...
[B83(4) B87(4)],'o-','MarkerSize',9,'LineWidth',2.5)
plot([1.8 0.9],...
[B83(5) B87(5)],'o-','MarkerSize',9,'LineWidth',2.5)
hl=legend('50A','40A','30A','20A','10A',"location", 'northwest');
set(hl,'fontsize',20)
%} 
%---