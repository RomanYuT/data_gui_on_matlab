%function grafnld(src, evt)

global hF hbo isobr istyp hEd2 hEd1 hEd3 hBut5 hgranld numobr dat razmn vitn lbydn nlistn 
global legnld Imem hBut3 haxnld currlnd hgranld2 hgranld3 hgranld4 hgranld5 hplot2 hplot3 hplot1 hplot4 hplot5 haxnld2 haxnld3 haxnld4 haxnld5 ...
    nrazld allhf Bld
%persistent koe hplot1
koe=[];

tic
%aa=waitbar (0.9,'ras4et grafikov'); % можно выключить если чо
mu0=pi*4e-7;
Bosn=0.0652/55; %!!!!!----- Основной коэфиц для связи тока блока и поля внешнего
d=12.9e-3;
d0=0.041;
 d2=0.012;
 dsol1=0.013;
dsol2=0.0275;
d6=0.01615;
%РіРІРѕР·РґРё:
d7=0.006;
d8=0.004;

%razmn = struct('area',{'m3:n13'
%'u3:v12'
%'i3:j13'
%'m3:n13'
%'q3:r10'
%'u3:v13'
%'q3:r10'
%'a3:b9'
%});
%nlistn=[4 4 5 5 4 6 6 7];
%vitn=[4 4 20 20 4 20 20 4];

%% create figures, axes

if get(hEd3 ,'Value')==0|(hgranld==0)||~any(allchild(0)==hgranld)
    left=9;
    bottom=49;
    width=1350;
    height=636;
    hgranld=figure('position', [left bottom width height],'HandleVisibility', 'callback','Color','w');
    haxnld=axes('Parent',hgranld);
    allhf=[allhf    hgranld];
    
       hgranld2=figure('position', [left bottom width height],'HandleVisibility', 'callback','Color','w'); 
        haxnld2=axes('Parent',hgranld2);
    x2=xlabel(haxnld2,'  L/d            ','fontsize',30);
    %ylabel('B, Tl','fontsize',20)
    ylabel(haxnld2,'В, Тл','fontsize',30)
    set(haxnld2,'fontsize',30)
    hold on
allhf=[allhf    hgranld2];

        hgranld3=figure('position', [left bottom width height],'HandleVisibility', 'callback','Color','w');
        haxnld3=axes('Parent',hgranld3);
    x3=xlabel(haxnld3,'  L/d            ','fontsize',30);
    %ylabel('B, Tl','fontsize',20)
    ylabel(haxnld3,'\mu','fontsize',30)
    set(haxnld3,'fontsize',30)
    title(haxnld3,['мю тела для разных токов' ],'fontsize',20);
    hold on
allhf=[allhf    hgranld3];

    %--------advanced results: plot of Mn(alfa) hin(alfa)
    hgranld4=figure('position', [left bottom width height],'HandleVisibility', 'callback','Color','w');
        haxnld4=axes('Parent',hgranld4);
    x4=xlabel(haxnld4,'  L/d            ','fontsize',30);
    %ylabel('B, Tl','fontsize',20)
    ylabel(haxnld4,'M, кА/м','fontsize',30)
    set(haxnld4,'fontsize',30)
    title(haxnld4,['Mn баллист для разных токов' ],'fontsize',20);
    hold on
    allhf=[allhf    hgranld4];
    
hgranld5=figure('position', [left bottom width height],'HandleVisibility', 'callback','Color','w');
        haxnld5=axes('Parent',hgranld5);
    x5=xlabel(haxnld5,'  L/d            ','fontsize',30);
    %ylabel('B, Tl','fontsize',20)
    ylabel(haxnld5,'\chi','fontsize',30)
    set(haxnld5,'fontsize',30)
    title(haxnld5,['hin тела для разных токов' ],'fontsize',20);
    hold on
allhf=[allhf    hgranld5];

    %--------
    

    %plot(HfromI/1000,B,'sk-','MarkerSize',9,'LineWidth',1.5)
    %hgranld=1;
end

if ~(exist('hplot2'))
    hplot2=[];
        hplot3=[];
        hplot1=[];

end

%% calculating 
for nt=find(istyp);
mattok1(1:length(aldat(nt).data))=0;
I=str2num(get(hEd2,'String'));
Bn{nt}=[];
Hinner=[];
Hinnern{nt}=[];
%Hinner{length(aldat(nt).data)}=[];  как это делается для всего массива??
mumat=[];
    Mn=[];
    hin=[];
    
for n=1:length(aldat(nt).data) %numobr, length(aldat(3).data)  
  if isobrb{nt}(n)|(n==1)
    
    %dat=cell(size(is isbr))
    
%dat{n}=xlsread('hard example.xlsx',nlistn(n),razmn(n).area);
  
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 if any(nt==[5:6])
    B{n}=1e6*(aldat(nt).data(n).datob(:,2)*4e-6)/(aldat(nt).data(n).vit*pi*aldat(nt).data(n).diam^2)/aldat(nt).data(n).kobm; %!!!! коэфициент внешней обмотки 1.05, исправ степень 4е-6!!
     elseif ~any(nt==[9 10])
         B{n}=(aldat(nt).data(n).datob(:,2)*4e-6)/(aldat(nt).data(n).vit*pi*aldat(nt).data(n).diam^2)/aldat(nt).data(n).kobm; 
 else
      B{n}=aldat(nt).data(n).datob(:,2);
 end
 HfromI{n}=Bosn*aldat(nt).data(n).datob(:,1)/mu0;

if (I==1 | I==2)&( length(find(aldat(nt).data(n).datob(:,1)==I))==0);
    %B{n}=[(B{n}(2)-B{n}(1))/(HfromI{n}(2)-HfromI{n}(1))*Bosn*I/mu0;  B{n}()]; %polyval(polyfit())

B{n}(1);
(B{n}(2)-B{n}(1))/(HfromI{n}(2)-HfromI{n}(1))*Bosn*I/mu0;
B{n}(1)+(B{n}(2)-B{n}(1))/(HfromI{n}(2)-HfromI{n}(1))*(Bosn*I/mu0-HfromI{n}(1));

B{n}=[B{n}(1)+(B{n}(2)-B{n}(1))/(HfromI{n}(2)-HfromI{n}(1))*(Bosn*I/mu0-HfromI{n}(1));  B{n}()]; 
mattok1(n)=1;
HfromI{n}=[Bosn*I/mu0;  HfromI{n}()];
else
  if ~isempty(find(aldat(nt).data(n).datob(:,1)>=I-0.5&aldat(nt).data(n).datob(:,1)<=I+0.5))
      [nouse mattok1(n)]=min(abs((aldat(nt).data(n).datob(:,1)-I)./I)); %number of nearest current in data  nt's type of n's obraz
        %mattok1(n)=find(aldat(nt).data(n).datob(:,1)>=I-0.5&aldat(nt).data(n).datob(:,1)<=I+0.5); % 
        %присваивает номер заданного заранее в начале цикла тока в данных образца n типа nt
  else
      if n==1
          invar1=aldat(nt).data(n).datob(:,1)-I;
        [I1 numi1]=min(-invar1(find((aldat(nt).data(n).datob(:,1)-I)<0)));
        numi2=numi1+1; %min((dat{n}(:,1)-I)(find((dat{n}(:,1)-I)>0)))
        Btime=B{1}(numi1)+(B{1}(numi2)-B{1}(numi1))/(HfromI{1}(numi2)-HfromI{1}(numi1))*(Bosn*I/mu0-HfromI{1}(numi1));
        B{1}=[B{1}(1:numi1); Btime; B{1}(numi2:end)];
        mattok1(1)=numi1+1;
        HfromI{1}=[HfromI{1}(1:numi1); Bosn*I/mu0;  HfromI{1}(numi2:end)];
       end
   end
  
%mattok1(n)=find(dat{n}(:,1)==I);
end

mu{n}=B{n}./(mu0*HfromI{n});
if any(nt==[1 2 5 10])
    % model solid prut
    modelfun1 = @(b,x) ((-b(1)*exp(-(x-b(5))/b(3))+b(2)+b(4)*x).*(-exp(-((x-b(6))/10000).^2)*0.12+1));  % .*(x-1000) 
    beta01 = [64649155071.8434 2.03631545616880 2300 1.27e-6 -55546 10000]; 
else
        % poli ball
    beta01 =[2.23104693820941 0.724101844658621 72569.2087124151 1.35750937824049e-06 -79702.1345948576];
    modelfun1 = @(b,x) ((-b(1)*exp(-(x-b(5))/b(3))+b(2)+b(4)*x));
end

for nroot=1:length(B{n})
Hinner{n}(nroot)=fzero(@(x) B{n}(nroot)-modelfun1(beta01,x),[0,60000]);
end
mumat{n}=B{n}./(mu0*Hinner{n}');



%dat{n}(:,1);
%mattok1(n)=find(dat{n}(:,1)==I);

%plot(HfromI{n}/1000,B{n},[mark(n) '--'],'MarkerSize',9,'LineWidth',3.5,'color',...
%[(1-(n-1)/3)*(n<4) (3-abs(n-4))/3 ((n-4)/3)*(n>4)])
%
%[(1-(n-1)/3)*(n<4) (3-abs(n-4))/3 ((n-4)/3)*(n>4)]
end
end

%------ create ld, nraz, Bn{nt}, Hn
ld=[aldat(nt).data.lbyd]; % lbydn';
 size(ld);
 nraz=zeros(1,length(mattok1));
 
 %dlmwrite ('aa.txt', 98)
for m=find(mattok1)%size(ld)(2) % цикл по всем подходящим образцам
%(mattok(ni,m)-1)
  if mattok1(m)~=0
    if isempty(mattok1(m))
      nraz(m)=[];
      Bn{nt}(m)=[];
      else 
%       nraz(m)= 1./(mu{m}(mattok1(m))-1)-1./(mu{1}(mattok1(1))-1);

        % formula N1
      %nraz(m)= (mumat{m}(mattok1(m))-mu{m}(mattok1(m)))./((mumat{m}(mattok1(m))-1)*mu{m}(mattok1(m)));
      
      % formula N2
      numcurr=find(I==bhpredprut(:,1)/943); nraz(m)= (bhpredprut(numcurr,2)-B{m}(mattok1(m)))./(B{m}(mattok1(m))*(bhpredprut(numcurr,2)/(mu0*HfromI{m}(mattok1(m)))-1));
      
      Bn{nt}(m)=B{m}(mattok1(m));
      Hn=HfromI{m}(mattok1(m));
      Hinnern{nt}(m)=Hinner{m}(mattok1(m)) ;
    end
  end
% 1/(mu9(k9)-1)-1/(muv(k6)-1)
% 1/(mu10(k10)-1)-1/(muv(k6)-1)
%  1/(mu7(k7)-1)-1/(muv(k6)-1)
%  1];

end
%-----------

ld(find(mattok1==0))=[]; % delete elements, where there are this current
sqrt(ld);
nraz(mattok1==0)=[];
Bn{nt}(Bn{nt}==0)=[];
Hn(Hn==0)=[];
Hinnern{nt}(Hinnern{nt}==0)=[];
mun=Bn{nt}./(mu0*Hn);
%Mn=(mun-1)*Hn;
Mn=Bn{nt}./mu0-Hinnern{nt};
%hin=(mun-1);
hin=Mn./Hn;
nrmorenull=find(nraz>0);




%end of type's loop 
end


%find(dat{n}(:,1)==5)

%Ipp=str2num(get(hEd2,'String'))

% rr=get(hBut5,'String');
%class(rr);
%get(hBut5);
%class(I);
%get(hEd1,'Value');
%rr=get(hEd1,'String');
%rrd=get(hEd2,'String')
%class('rrd')




% toki 10 20 40 57,5 A
% mattok=[
% 7 6 7 7 4 2 2 2
% 9 8 9 9 6 4 4 3
% 10 9 10 10 7 9 6 5
% 11 10 11 11 8 11 8 7];

% listi=[10 20 40 57.5];
% ni=I;

%find(listi==I)


%ld0=[43
% 32
% 25
% 19
% 10.7
% 8
% 3
% 1
% ];
 
 
 toc
 

% semilogy(ld,nraz,'sg-','MarkerSize',9,'LineWidth',2.5)
% hold on
% semilogy(ld(2:3:5),nraz(2:3:5),'sk--','MarkerSize',9,'LineWidth',1.5)


%dlmwrite ('aa.txt', 125)
%plot(ld,nraz,'sg-','MarkerSize',9,'LineWidth',2.5)
%nraz(find(isobr==0))=[];


%!!!!------ след строчка вызывает зависание, мож проверять рав-ство нуля у-оси
% if nraz==0; nraz=nraz(2:end); ld=ld(2:end); end
%colormap(jet);


nrazld{length(nrazld)+1}=[ld;nraz];
figure(hgranld)
hplot1=[hplot1 semilogy(haxnld,(ld(nrmorenull)).^1,nraz(nrmorenull),'s-','MarkerSize',9,'LineWidth',2.5,'color',... %sqrt(ld)
[rem(I*1,21)/21 rem(I*1+5,21)/21 rem(I*1+7,21)/21],'Parent',haxnld)];
 set(hplot1(end),'Marker',mark(fix(rem(I,8)+1))...
      );   % 'linestyle',mark2{fix(rem(I,4)+1)}
%grid on
grid minor
hold on
 x1=xlabel(haxnld,'   L/d           ','fontsize',30); %^{0.5} 
    %ylabel('B, Tl','fontsize',20)
    ylabel(haxnld,'N','fontsize',30)
    set(haxnld,'fontsize',20,'GridLineStyle','-','YMinorGrid','on','XMinorGrid','on','XGrid','on','YGrid','on')
        %hold on
      %  xlim([0 max(ld(2)).^0.5]);

      Bld{length(Bld)+1}=[ld;Bn{1}];
figure(hgranld2)
hplot2=[hplot2 plot(haxnld2,ld,Bn{find(istyp)},'-o','MarkerSize',9,'LineWidth',3.5,'color',...  % !!!!!!!!!!!!!Bn{find(istyp)} работает тока с одним типом
        [rem(I*2,11)/11 rem(I*2+5,11)/11 rem(I*2+7,11)/11])];
    set(hplot2(end),'Marker',mark(fix(rem(I,8)+1)),...
       'linestyle',mark2{fix(rem(I,4)+1)}); 
  title(haxnld2,['B(L/D)  для разных токов' ],'fontsize',20);
  set(haxnld2,'XMinorGrid','on','GridLineStyle','-','XGrid','on','YGrid','on') 
        set(haxnld2,'YMinorGrid','on') 
    hold on

  figure(hgranld3)
    hplot3=[hplot3 plot(haxnld3,ld,mun,'-o','MarkerSize',9,'LineWidth',3.5,'color',...
        [rem(I*3,11)/11 rem(I*3+5,11)/11 rem(I*3+7,11)/11])];
     set(hplot3(end),'Marker',mark(fix(rem(I,8)+1)),...
       'linestyle',mark2{fix(rem(I,4)+1)});  
        set(haxnld3,'XMinorGrid','on','GridLineStyle','-','XGrid','on','YGrid','on') 
        set(haxnld3,'YMinorGrid','on') 
    hold on
     %[rem(I*3,7)/7 rem(I*3+5,7)/7 rem(I*3+7,7)/7];
     
         %--------advanced results: plot of Mn(alfa) hin(alfa)
  figure(hgranld4)
    hplot4=[hplot4 plot(haxnld4,ld,Mn/1000,'-o','MarkerSize',9,'LineWidth',3.5,'color',...
        [rem(I*3,11)/11 rem(I*3+5,11)/11 rem(I*3+7,11)/11])];
     set(hplot4(end),'Marker',mark(fix(rem(I,8)+1)),...
       'linestyle',mark2{fix(rem(I,4)+1)}); 
        set(haxnld4,'XMinorGrid','on','GridLineStyle','-','XGrid','on','YGrid','on') 
        set(haxnld4,'YMinorGrid','on') 
    hold on
     [rem(I*3,7)/7 rem(I*3+5,7)/7 rem(I*3+7,7)/7];
     
       figure(hgranld5)
    hplot5=[hplot5 plot(haxnld5,ld,hin,'-o','MarkerSize',9,'LineWidth',3.5,'color',...
        [rem(I*3,11)/11 rem(I*3+5,11)/11 rem(I*3+7,11)/11])];
     set(hplot5(end),'Marker',mark(fix(rem(I,8)+1)),...
       'linestyle',mark2{fix(rem(I,4)+1)});
        set(haxnld5,'XMinorGrid','on','GridLineStyle','-','XGrid','on','YGrid','on') 
        set(haxnld5,'YMinorGrid','on') 
    hold on
     %[rem(I*3,7)/7 rem(I*3+5,7)/7 rem(I*3+7,7)/7];
     
     %---------------------

%legnld = guidata(hBut3);
Imem;
%  Imem=I;
if 1 %get(hEd3 ,'Value')==1
    if ~(isempty(Imem)); 
     %      legnld{length(legnld)}=['I=' num2str(Imem)];
        legnld{length(legnld)+1}=['I=' num2str(I)];
    else
         Imem=I;
         legnld{1}=['I=' num2str(Imem)];
    end
hl2=legend(haxnld2,hplot2,legnld,'location', 'northwest','Parent',hgranld2);
hl3=legend(haxnld3,hplot3,legnld,'location', 'northwest');

hl4=legend(haxnld4,hplot4,legnld,'location', 'northwest');
hl5=legend(haxnld5,hplot5,legnld,'location', 'northwest');

figure(hgranld)
hl=legend(haxnld,hplot1 ,legnld,'location', 'northeast','Parent',hgranld);
%legnld{length(legnld)+1}=[];
set(hl,'fontsize',15)
set(hl2,'fontsize',15)
set(hl3,'fontsize',15)
set(hl4,'fontsize',15)
set(hl5,'fontsize',15)    
%  elseif get(hEd3 ,'Value')==1&(length(legnld)==1)
%  legnld{1}=['I=' num2str(Imem)];
%  legnld{length(legnld)+1}=['I=' num2str(I)];
% hl=legend(legnld,'location', 'southwest');
 elseif get(hEd3 ,'Value')==0
 Imem=I;
end

guidata(hBut3,nraz);
nrazi=guidata(hBut3);

figure(hgranld)

if get(hEd3 ,'Value')==0
    currlnd=I;
    title(['N(L/D), TOK I=' num2str(currlnd)],'fontsize',20);
else
    currlnd=[currlnd I];
    title(['N(L/D), TOK I=' num2str(currlnd)],'fontsize',12);
end


%dlmwrite ('aa.txt', 133)

%koef=sum(sqrt(ld).*log(nraz))/sum(sqrt(ld).^2);

%% проведение средней прямой
%deleting negativ demagnet factor
 nrmorenull=find(nraz>0);
%ld(nraz(2:end)<0)=[];

%nraz(nraz<0)=[];
%--------- approximation line
% p=polyfit(sqrt(ld(nrmorenull)),log(nraz(nrmorenull)),1);
% nrazmed=polyval(p, [sqrt(ld) 0]);
% semilogy([sqrt(ld) 0],exp(nrazmed),'.k:','MarkerSize',9,'LineWidth',1.0,'Parent',haxnld)

% grid on
% grid minor

%figure
%plot(sqrt(ld),log(nraz))

%dlmwrite ('aa.txt', 138)
%plot([sqrt(ld) 0],-nrazmed,'sk-','MarkerSize',9,'LineWidth',1.5)
%!!!errorbar  semilogyerr

%---расчет коэфициента к в зависимости N(alfa)
%koe(length(koe)+1)=sum(sqrt(ld(2:end)).*log(nraz(2:end)))/sum(sqrt(ld(2:end)).^2);
%figure; plot((Bosn*[1 2 5 10 20 40]/mu0/1000), log(-(koe(1:end-1))),'o-','LineWidth',2.0);
%set(gca,'fontsize',30)

%function [B mattok1 HfromI]=datalnd(aldat(nt).data)
