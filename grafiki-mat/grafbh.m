%function grafbh

global hF hbo isobr numobr nlistn razmn dat vitn lbydn legn aldat...
    allhf
%pkg load io
kwm=1.0; %коэфиц умножения для веберметра
mu0=pi*4e-7;
d=12.9e-3;
d0=0.041;
 d2=0.012;
 dsol1=0.013;
dsol2=0.0275;
Bosn=0.0652/55; %!!!!!----- Основной коэфиц для связи тока блока и поля внешнего. В(1А)~0.0012  ;Н(1А)=  943.3548;
d6=0.01615;
%гвозди:
d7=0.006;
d8=0.004;

%ошибки
epsbosn=0.01;
deltaI=1; % разные могут быть для разных интервалов

 left=9;
bottom=49;
width=1350;
height=636;
hbh1=figure('position', [left bottom width height],'HandleVisibility', 'callback','Color','w');
%plot(HfromI/1000,B,'sk-','MarkerSize',9,'LineWidth',1.5)
hold on
grid minor
hax1=gca;
    set(hax1,'fontsize',30,'GridLineStyle','-','YMinorGrid','on','XMinorGrid','on','XGrid','on','YGrid','on')

xlabel('                 H, кА/м ','fontsize',30);
%ylabel('B, Tl','fontsize',20)
ylabel('B, Тл','fontsize',30)

title('B(H), balist katushka ','fontsize',25);

hbh2=figure('position', [left bottom width height],'HandleVisibility', 'callback','Color','w');
%plot(HfromI/1000,B,'sk-','MarkerSize',9,'LineWidth',1.5)
hold on
grid minor
hax2=gca;
set(hax2,'fontsize',30,'GridLineStyle','-','YMinorGrid','on','XMinorGrid','on','XGrid','on','YGrid','on')
xlabel('                 H, кА/м ','fontsize',30);
%ylabel('B, Tl','fontsize',20)
ylabel('M, кА/м','fontsize',30)

title('M(H), balist katushka ','fontsize',25);

   allhf=[allhf    hbh2 hbh1];

mark=['+'  
          'o'  
          '*'  
                    'x'  
          's'  
          'd'  
          '^'  
          'v'  
          '>'  
          '<'  
          'p'  
          'h' 
          '.' ];
mark2={'-'; '--';':';'-.'};
          
%vitn=[4 4 20 20 4 20 20 4];
%
%nlistn=[4 4 5 5 4 6 6 7];

%legn={'6 balist L/D=43'
%'8 balist  L/D=32'
%'9 balist  L/D=25'
%'10 balist  L/D=19'
%'7 magn L/D=11 '
%'17 balist  L/D=8'
%  '18 balist  L/D=3'
%'19 balist  L/D=1'}  ;

%razmn = struct('area',{'m3:n13'
%'u3:v12'
%'i3:j13'
%'m3:n13'
%'q3:r10'
%'u3:v13'
%'q3:r10'
%'a3:b9'
%});
          
%razmn=[ 'M3:N13'
%'i3:j13'
%'m3:n13'
%'Q3:R10'
%'u3:v12'
%'q3:r10'
%'a3:b9'
%];

%razmn={'M3:N13'
%'i3:j13'
%'m3:n13'
%'Q3:R10'
%'u3:v12'
%'q3:r10'
%'a3:b9'
%}

%razmn = struct('area','i3:j13',nlistn...,dat,  B,   HfromI)
B{numobr}=[];
HfromI{numobr}=[];
errdath{numobr}=[];
errdath{numobr}=[];
legbh={};
for nt=find(istyp);
    for n=find(isobrb{nt}) %1:10 %numobr 
      if isobrb{nt}(n)

        %dat=cell(size(is isbr))

    %dat{n}=xlsread('hard example.xlsx',nlistn(n),razmn(n).area);

    %   B{n}=(dat{n}(:,2)*4e-6)/(vitn(n)*pi*d6^2);
    %   HfromI{n}=Bosn*dat{n}(:,1)/mu0;
    if any(nt==[5:6])
      B{nt,n}=1e6*(aldat(nt).data(n).datob(:,2)*4e-6)/(aldat(nt).data(n).vit*pi*aldat(nt).data(n).diam^2)/aldat(nt).data(n).kobm;
    elseif ~any(nt==[9 10])
        B{nt,n}=(aldat(nt).data(n).datob(:,2)*4e-6)/(aldat(nt).data(n).vit*pi*aldat(nt).data(n).diam^2)/aldat(nt).data(n).kobm;
    else
        B{nt,n}=aldat(nt).data(n).datob(:,2);
    end
     HfromI{nt,n}=Bosn*aldat(nt).data(n).datob(:,1)/mu0;
     M{nt,n}=(  B{nt,n}./(mu0*HfromI{nt,n})-1).* HfromI{nt,n};

    %[(1-(n-1)/(numobr-1))*(n<4) (4-abs(n-4))/(numobr-1) ((n-4)/(numobr-1))*(n>4)];
    
%     errdatb{nt,n}=aldat(nt).data(n).datob(:,2)./aldat(nt).data(n).datob(:,3)*0.5*4e-6/(aldat(nt).data(n).vit*pi*aldat(nt).data(n).diam^2);%error-data

%     errdath{nt,n}=(epsbosn+deltaI./aldat(nt).data(n).datob(:,1)).*aldat(nt).data(n).datob(:,1)*Bosn/mu0;
    
    legbh={legbh{:} [aldat(nt).type ', L/D=' num2str(aldat(nt).data(n).lbyd,3)]};  %aldat(nt).data(n).leg  - out legend from aldat
    % plot(HfromI{n}/1000,B{n},[mark(n) '--'],'MarkerSize',9,'LineWidth',3.5,'color',...
    % [(1-n*2/(numobr))*(n<numobr/2) (numobr-2*abs(n-numobr/2))/(numobr) ...
    % ((n-numobr/2)*2/(numobr))*(n>numobr/2)])
    %[(1-n*2/(numobr))*(n<numobr/2) (numobr-2*abs(n-numobr/2))/(numobr) ((n-numobr/2)*2/(numobr))*(n>numobr/2)];
    figure(hbh1)  

    %e=errorbar(HfromI{nt,n}/1000,B{nt,n},errdatb{nt,n},'-'); %  errdath{n}/1000,
    e=plot(HfromI{nt,n}/1000,B{nt,n},'-'); 
    set(e,'color',[rem(n*1.3+nt*5,7)/7 rem(n*1+4+nt*5,7)/7 rem(n*1+3+nt*5,7)/7],'Marker',mark(rem(n+nt*5,13)+1),...
        'LineWidth',2,'MarkerSize',6);    %(1-n*2/(numobr))*(n<numobr/2) (numobr-2*abs(n-numobr/2))/(numobr)  ((n-numobr/2)*2/(numobr))*(n>numobr/2) 
figure(hbh2)
    hpl=plot(HfromI{nt,n}/1000,M{nt,n}/1000,'MarkerSize',5,'LineWidth',3.5,'color',[rem(n*1.3+nt*5,7)/7 rem(n*1+4+nt*5,7)/7 rem(n*1+3+nt*5,7)/7]);
    set(hpl,'Marker',mark(rem(n+nt*5,13)+1),...
        'LineWidth',2,'MarkerSize',8);   %,'linestyle',mark2{rem(n,4)+1}                                                                                                               
    end
    end
end

%xlim([-0.5 56]);
%ylim([0 2.2]);
%set(gca,'fontsize',30)

n;
%сделать чтоб legn бралась тока из файла  maingraf!!
%legn(find(cellfun('isempty',B)))=[];
HfromI(find(cellfun('isempty',B)))=[];
B(find(cellfun('isempty',B)))=[];
hl=legend(hax1,legbh,'location', 'northwest','fontsize',16);
hl=legend(hax2,legbh,'location', 'northwest','fontsize',16);

%set(hl,'fontsize',20)
% set(hl,'position',[0.02   0.65   0.15   0.29095])
clear legn

% for n=1:length(find(isobr)) 
%  pbh(n,1:2)=polyfit(HfromI{n}(1:2),B{n}(1:2),1);
%  
%  end
 %pbh
%{ 
figure;
 plot(lbydn,pbh(:,1),'o-')
 %}
 %dat{9}
%sdfdf=figure

%dffdf
%plot([32 25 19 11 8 3 1], pbh(2:8,1),'.-')  построение угла В(Н) от альфа

%building of advanced plots
% figure(hbh1);   plot(hax1,hb65(:,2)/1000,hb65(:,1),'ko--')
