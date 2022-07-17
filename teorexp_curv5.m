%кривые установки димы в сравнении с моделями с фф с книжной кривой мю

 
 function tecu5(isr,kgrd,ispol,normextr,bxext)
 
 %isr ���� �� ������� � ������� �����, kgrd - ���� ���� ����������� � ����� ������
 % ispol ���� �� ������� ������� �������� �� ��������� 0-30��, bxext - external data
 % normextr - normalize in xextr
 global bxm4 bxm8 bxm16 bexp4 bexp8 bexp16  left bottom width height nmed I
 
 [Desc, flag] = pkg ("describe", "io");
if all(flag{:}(1)!= 'L') %т.е. если не равен loaded
 pkg load io
end
 
 I=16;
 b='10';  %'b=3.5', 'b=6', 'b=8', 'b=10', 'b=11.5', 'b=13', 'b=15.3'
 left=9;
bottom=49;
width=1350;
height=636;
fbx=figure('position', [9 49 1350 636]); axesbx=axes('Parent',fbx);
 grid minor  on
hold on
set(gca,'fontsize',30)
ylabel('B, T','fontsize',30)
xlabel(' x, mm','fontsize',30);

%----- subprogram data import from "модельные данные установки фарадея.xls"

%---
%{
if ~exist('bxallda')
 bxm4 = load ('C:\Users\Ramzes 1\Documents\modelcoms\manyparam\B(x) 19.txt'); %B(x) 19
bxm8 = load ('C:\Users\Ramzes 1\Documents\modelcoms\manyparam\B(x) 20.txt');
bxm16 = load ('C:\Users\Ramzes 1\Documents\modelcoms\5-3\16A mu2 v53 B(y)4.txt'); %coms dat
bxm30 = load ('C:\Users\Ramzes 1\Documents\modelcoms\manyparam\B(x) 25.txt');
end
%}

%bxm16(:,1)=bxm16(:,1)-0.5;% временная строка!!!!!!!
%
%if ~exist('bxm16')
%'da exi'




 
 %{
 bexp16b(1,:,:)=bexp16b3=xlsread('potok magnet.xlsx',5,'m3:n33'); 
 bexp16b(2,:,:)=bexp16b6=xlsread('potok magnet.xlsx',5,'p3:q33'); 
 bexp16b8=xlsread('potok magnet.xlsx',6,'p4:s34'); %v4:y34 a4:d34
  bexp16b(4,:,:)=bexp16b10=xlsread('potok magnet.xlsx',5,'g3:h33'); %m3:n33 p3:q33 s3:t33
  bexp16b11=xlsread('potok magnet.xlsx',6,'v4:y34');
  bexp16b13=xlsread('potok magnet.xlsx',7,'a4:d34');
bexp16b(7,:,:)=bexp16b15=xlsread('potok magnet.xlsx',5,'s3:t33'); 
bexp16b(6,:,:)=bexp16b13(:,[1 end]);

%save bexp16b.txt bexp16b
load bexp16b.txt
figure('position', [9 49 1350 636]); hold on; grid minor  on
for m=1:7
       plot(bexp16b(m,:,1),bexp16b(m,:,2),'--k','LineWidth',2.5,'MarkerSize',9,...
       'color',[rem(m*1.3,7)/7 rem(m*1+4,7)/7 rem(m*1+3,7)/7])%1.1453 1.1139
end
hl=legend('b=3.5', 'b=6', 'b=8', 'b=10', 'b=11.5', 'b=13', 'b=15.3'); %,'fontsize',20
set(hl,'fontsize',20)


 %}
  
%size(bexp8)(2);
 switch (I)
  case 4
  bexp4=xlsread('potok magnet.xlsx',5,'a3:b33');
  bexp4=bexp4(:,[1 size(bexp4)(2)]);
  bxallda=xlsread('C:\Users\Ramzes 1\Documents\octava\coms data\modeldatafarad.xlsx',2,'a3:e33');
  bxm4=bxallda(:,1:2);
  case 8
  bexp8=xlsread('potok magnet.xlsx',5,'d3:e33');
  bexp8=bexp8(:,[1 size(bexp8)(2)]);
  bxallda=xlsread('C:\Users\Ramzes 1\Documents\octava\coms data\modeldatafarad.xlsx',2,'a3:e33');
  bxm8=bxallda(:,[1 3]);
  case 16
    bxallda=xlsread('C:\Users\Ramzes 1\Documents\octava\coms data\modeldatafarad.xlsx',2,'g3:n33');
    switch (b)
      case '3,5'
        bexp16=xlsread('potok magnet.xlsx',5,'m3:n33');
        bxm16=bxallda(:,[1 2]);
      case '6'
        bexp16=xlsread('potok magnet.xlsx',5,'p3:q33');
        bxm16=bxallda(:,[1 3]);
      case '8'
        bexp16=xlsread('potok magnet.xlsx',6,'p4:s34');
        bxm16=bxallda(:,[1 4]);
      case '10'
        bexp16=xlsread('potok magnet.xlsx',5,'g3:h33');
        bxm16=bxallda(:,[1 5]);
      case '11,5'
        bexp16=xlsread('potok magnet.xlsx',6,'v4:y34');
        bxm16=bxallda(:,[1 6]);
      case '13'
        bexp16=xlsread('potok magnet.xlsx',7,'a4:d34');
        bxm16=bxallda(:,[1 7]);
      case '15,3'
        bexp16=xlsread('potok magnet.xlsx',5,'s3:t33');
        bxm16=bxallda(:,[1 8]);
      endswitch
  %bexp16=xlsread('potok magnet.xlsx',5,'g3:h33'); %m3:n33 p3:q33 s3:t33
  bexp16=bexp16(:,[1 size(bexp16)(2)]);

  case 30
  bexp30=xlsread('potok magnet.xlsx',5,'j3:k33');
  bexp30=bexp30(:,[1 size(bexp30)(2)]);
  bxallda=xlsread('C:\Users\Ramzes 1\Documents\octava\coms data\modeldatafarad.xlsx',2,'a3:e33');
  bxm30=bxallda(:,[1 5]);
  endswitch

%
if I==4
%plot(bexp4(:,1),bexp4(:,2)/1000,'x-r','LineWidth',1.5)
%    plot(bxm4(:,1)*1000-200,bxm4(:,2)*1,'o--r','LineWidth',1.5) %2.1168
    bmod=bxm4;
bexp=bexp4;
elseif I==8 
% plot(bexp8(:,1),bexp8(:,2)/1000,'x-b','LineWidth',1.5)
%    plot(bxm8(:,1)*1000-200,bxm8(:,2)*1,'o--b','LineWidth',1.5) %1.6554
    bmod=bxm8;
bexp=bexp8;
 elseif I==16
% plot(bexp16(:,1),bexp16(:,2)/1000,'o-k','LineWidth',2.5,'MarkerSize',8)
%%   plot(bxm16(:,1)*1000-200,bxm16(:,2)* 1,'--k','LineWidth',2.5,'MarkerSize',13)%1.1453  2.5097
%%    plot(bxm16(:,1)*1000-200,bxm16(:,2)* 2.5097,':k','LineWidth',2.9,'MarkerSize',13)%1.1453 2.27
%     plot(bxm16(:,1)*1000,bxm16(:,2)* 1,'--k','LineWidth',2.9,'MarkerSize',13)%1.1453 1.1139
%    plot(bxm16(:,1)*1000,bxm16(:,2)* 1.1139,':k','LineWidth',2.9,'MarkerSize',13)%1.1453
   bmod=bxm16;
    bexp=bexp16;
elseif  I==30
%plot(bexp30(:,1),bexp30(:,2)/1000,'x-m','LineWidth',1.5)
%   plot(bxm30(:,1)*1000-200,bxm30(:,2)*1,'o--m','LineWidth',1.5)%1.1453
   bmod=bxm30;
    bexp=bexp30;
end 



ispol=0;
if (nargin == 1)
  xmin2ex=poligrad(bmod,bexp,isr,0,0,b);
elseif (nargin == 2)
 
  xmin2ex=poligrad(bmod,bexp,isr,5,0,b);
elseif (nargin == 3)|(nargin == 4)
  %ispol=1;
  xmin2ex= poligrad(bmod,bexp,isr,5,ispol,b);
else
  xmin2ex=poligrad(bmod,bexp,0,0,0,b);
end 

if  normextr
  [vv nxmin]=min(abs(bexp(:,1)/1000-xmin2ex)); kpopr=bexp(nxmin,2)/1000/bmod(nxmin,2) %popr koeificient in xmin1
  else 
    kpopr=max(bexp)(2)/1000/max(bmod)(2)  %popr koeificient in maximum
  %[vv nxmin]=min(abs(bexp(:,1)/1000-0.013546)); kpopr=bexp(nxmin,2)/1000/bmod(nxmin,2) %popr koeificient in xmin1
end
%------!!!! менять команды для сдвига
%nmed=length(bmod)/2
nmed=1
%------!!!! менять команды для сдвига
 plot(axesbx,bexp(:,1),bexp(:,2)/1000,'o-k','LineWidth',2.5,'MarkerSize',9)
%   plot(bmod(:,1)*1000-200,bmod(:,2)* 1,'--k','LineWidth',2.5,'MarkerSize',9)%1.1453  2.5097
%    plot(bmod(:,1)*1000-200,bmod(:,2)* kpopr,':k','LineWidth',2.5,'MarkerSize',9)%1.1453 2.27
     plot(axesbx,bmod(:,1)*1000,bmod(:,2)*1,':k','LineWidth',3,'MarkerSize',9)%1.1453 1.1139
    plot(axesbx,bmod(:,1)*1000,bmod(:,2)* kpopr,'--k','LineWidth',3,'MarkerSize',9)%1.1453 kpopr
 %   legend(axesbx,'experiment','normir model',"location", 'northeast');
xlim([0 30])

endfunction

function xmin2ex=poligrad(bmod,bexp,isr,iskgrd,ispol,b);
 global  left bottom width height nmed I
kpopr=max(bexp)(2)/1000/max(bmod)(2);
%kpopr=0.67922;

%------!!!! менять команды для сдвига
%deltan=15*nmed/100+nmed;
deltan=31;
%------!!!! менять команды для сдвига
%p1=polyfit(bmod(nmed:deltan,1)-0.2,bmod(nmed:deltan,2),4);
p1=polyfit(bmod(nmed:deltan,1),bmod(nmed:deltan,2),4);

 
  % exper polinom and derivative
  p2=polyfit(bexp(:,1)/1000,bexp(:,2)/1000,4);
  if ispol
    %------!!!! менять команды для сдвига
% plot(bmod(nmed:deltan,1)*1000-200,polyval(p1,bmod(nmed:deltan,1)-0.2)*kpopr,'.k--s','MarkerSize',9,'LineWidth',.5)
%plot(bmod(nmed:deltan,1)*1000,polyval(p1,bmod(nmed:deltan,1))*kpopr,'.r--v','MarkerSize',9,'LineWidth',1)
plot([bmod(nmed:deltan,1); [bmod(end,1):bmod(end,1)/10:2*bmod(end,1)]']*1000,...
polyval(p1,[bmod(nmed:deltan,1); [bmod(end,1):bmod(end,1)/10:2*bmod(end,1)]'])*kpopr,'.r--v','MarkerSize',9,'LineWidth',1)

%plot(bexp(:,1),polyval(p2,bexp(:,1)/1000),'.r--o','MarkerSize',9,'LineWidth',1)
plot([bexp(:,1); [bexp(end,1):bexp(end,1)/10:2*bexp(end,1)]'],polyval(p2,[bexp(:,1);...
 [bexp(end,1):bexp(end,1)/10:2*bexp(end,1)]']/1000),'.r--o','MarkerSize',9,'LineWidth',1)
end
 
fgrad=figure('position', [left bottom width height]);
 axesgrad=axes('Parent',fgrad);
grid minor  on
hold on
set(gca,'fontsize',30)
ylabel('gradB, T/m','fontsize',30)
xlabel(' x, mm','fontsize',30);

%kpopr= 1.0016; %temporary
if iskgrd
kgrd=kpopr; 


else
kgrd=1
end 

%exper
 dp2=polyder(p2);
  plot(axesgrad,[0.0:0.0005:0.03]*1000,polyval(dp2,[0.0:0.0005:0.03]),'k-','MarkerSize',9,'LineWidth',2.5)

%model
 dp1=polyder(p1);
  plot(axesgrad,[0.0:0.0005:0.03]*1000,polyval(dp1,[0.0:0.0005:0.03])*1,'k:','MarkerSize',9,'LineWidth',4)
  plot(axesgrad,[0.0:0.0005:0.03]*1000,polyval(dp1,[0.0:0.0005:0.03])*kgrd,'k--','MarkerSize',9,'LineWidth',3)

 % legend('experiment','normir model',"location", 'northeast');
%save dp1.txt dp1  
%save dp2.txt dp2  

%save 'dataust\data16b15,3mu2.txt' bmod bexp dp1 dp2 % 3,5mm bmu 16A
xmin1m=fminbnd (inline (polyout(dp1,'x'), "x"),0,bexp(end,1)/1000);
  xmin2ex=fminbnd (inline (polyout(dp2,'x'), "x"),0,bexp(end,1)/1000);
  ispol
%_________ output data  
deltaB=((polyval(p2,xmin2ex)-polyval(p1,xmin2ex)*kpopr))*1000; %погреш В при хпер-экспер в мТл
 epsdeltaB=abs((polyval(p2,xmin2ex)-polyval(p1,xmin2ex)*kpopr)/polyval(p2,xmin2ex))*100; %отн погр в %
 deltagradb=(polyval(dp2,xmin2ex)-polyval(dp1,xmin2ex)*kpopr); %погрешн 
 epsgradb=abs((polyval(dp2,xmin2ex)-polyval(dp1,xmin2ex)*kpopr)/polyval(dp2,xmin2ex))*100; %отн погр в %
 xmin1m;
 xmin2ex; 
 deltaxmin=(xmin2ex-xmin1m)*1000; %погрешн хпер в мм
 epsxmin2ex=abs((xmin2ex-xmin1m)/xmin2ex)*100; %отн погрешн хпер в %
kextr=polyval(p2,xmin2ex)/polyval(p1,xmin2ex);
 
 %-------
%  fdisp (stdout, ["I=" num2str(I) 'A, 10mm']); % perem mu2
% fdisp (stdout, ["koeficient normirovki=" num2str(kpopr) ' ' 'mT']);
%fdisp (stdout, ["deltaB=" num2str(deltaB) ' ' 'mT']);
%fdisp (stdout, ["epsdeltaB=" num2str(epsdeltaB) ' ' '%']);
%fdisp (stdout, ["deltagradb=" num2str(deltagradb) ' ' 'T/m']);
%fdisp (stdout, ["epsgradb=" num2str(epsgradb) ' ' '%']);
%fdisp (stdout, ["deltaxmin=" num2str(deltaxmin) ' ' 'mm']);
%fdisp (stdout, ["epsxmin2ex=" num2str(epsxmin2ex) ' ' '%']);
%fdisp (stdout, ["xmin1m=" num2str(xmin1m) ' ' 'm']);
%fdisp (stdout, ["xmin2ex=" num2str(xmin2ex) ' ' 'm']);

%-------
fdisp (stdout, ["I=" num2str(I) 'A, ' b 'mm; '   "koef normirovki=" num2str(kpopr) ' ' 'mT;'  ...
  ]); % perem mu2
 %fdisp (stdout, ["koeficient normirovki=" num2str(kpopr) ' ' 'mT']);
fdisp (stdout, ["deltaB=" num2str(deltaB) ' ' 'mT; ' "epsdeltaB=" num2str(epsdeltaB) ' ' '%; ' ...
 "deltagradb=" num2str(deltagradb) ' ' 'T/m; ' "epsgradb=" num2str(epsgradb) ' ' '%']);
%fdisp (stdout, ["epsdeltaB=" num2str(epsdeltaB) ' ' '%;' "deltagradb=" num2str(deltagradb) ' ' 'T/m;' ...
%"epsgradb=" num2str(epsgradb) ' ' '%']);

%fdisp (stdout, ["deltagradb=" num2str(deltagradb) ' ' 'T/m']);
%fdisp (stdout, ["epsgradb=" num2str(epsgradb) ' ' '%']);
fdisp (stdout, ["deltaxmin=" num2str(deltaxmin) ' ' 'mm; ' "epsxmin2ex=" num2str(epsxmin2ex) ' ' '%; ' ...
"xmin1m=" num2str(xmin1m) ' ' 'm; ' "xmin2ex=" num2str(xmin2ex) ' ' 'm; ' 'kextr=' num2str(kextr)]);
%fdisp (stdout, ["epsxmin2ex=" num2str(epsxmin2ex) ' ' '%']);
%fdisp (stdout, ["xmin1m=" num2str(xmin1m) ' ' 'm']);
%fdisp (stdout, ["xmin2ex=" num2str(xmin2ex) ' ' 'm']);

  
 xleft1=fzero(@(x) polyval(dp1,x)-polyval(dp1,xmin1m)*0.95,[0,xmin1m]);
xright1=fzero(@(x) polyval(dp1,x)-polyval(dp1,xmin1m)*0.95,[xmin1m,bexp(end,1)/1000]);

xleft2=fzero(@(x) polyval(dp2,x)-polyval(dp2,xmin2ex)*0.95,[0,xmin2ex]);
xright2=fzero(@(x) polyval(dp2,x)-polyval(dp2,xmin2ex)*0.95,[xmin2ex,bexp(end,1)/1000]);


nargin;

if isr
rectangle("Position", [xleft1*1000 min(polyval(dp1,xmin1m),polyval(dp1,xleft1))*kgrd...
 (xright1-xleft1)*1000,abs(polyval(dp1,xmin1m))*0.05*kgrd],"FaceColor", [ 0.5 0.5 0.5])  
  line([xmin1m xmin1m]*1000,[polyval(dp1,xmin1m)*kgrd, 0],'LineWidth',1.5,'color',[229/255 129/255 111/255]);
  

rectangle("Position", [xleft2*1000 min(polyval(dp2,xmin2ex),polyval(dp2,xleft2))...
 (xright2-xleft2)*1000,abs(polyval(dp2,xmin2ex))*0.05],"FaceColor", [ 0.5 0.5 0.5])
 line([xmin2ex xmin2ex]*1000,[polyval(dp2,xmin2ex), 0],'LineWidth',1.5,'color',[229/255 129/255 111/255]);
 %legend('model','experiment',"location", 'northeast');
 end
ylim([floor(min([polyval(dp1,xmin1m)*kgrd,polyval(dp2,xmin2ex), polyval(dp1,xmin1m) ])) 0]);

endfunction

%__________
% print(4,'gra3.jpg','-S1240,680') %!!! сохранение фигур 1,2,3,4 данном разрешении.
% bpostar = load ('16postar.txt');     plot(bpostar(:,1)-0.200,bpostar(:,2),'o-k')
% bpostn = load ('16postn.txt'); plot(bpostn(:,1),bpostn(:,2),'o-g')
%bb1 = load ('16 -1.txt'); plot(bb1(:,1),bb1(:,2),'s-r')
%bb2 = load ('16 -2.txt'); plot(bb2(:,1),bb2(:,2),'v-b')
%bb3 = load ('16 -3.txt'); plot(bb3(:,1),bb3(:,2),'>-m')

%mu1 = load ('C:\Users\Ramzes 1\Documents\octava\coms data\mu(H)1.txt');
%mu3= load ('C:\Users\Ramzes 1\Documents\octava\coms data\mu(H)3.txt');
%
%plot(muboo(:,1).*muboo(:,2)*pi*4e-7,muboo(:,2),'o-b','LineWidth',2.5,'MarkerSize',9)
%load ('muboo.txt');