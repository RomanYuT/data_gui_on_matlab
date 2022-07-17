function grafmu

global hF hbo isobr numobr nlistn razmn dat vitn legn isobrb istyp aldat


kwm=1.0; %  коэфиц умножения для веберметра
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

 left=9;
bottom=49;
width=1350;
height=636;
hgramu=figure('position', [left bottom width height],'Color','w');
 haxmu=axes('Parent',hgramu);

%plot(HfromI/1000,B,'sk-','MarkerSize',9,'LineWidth',1.5)
hold on
    set(haxmu,'fontsize',30,'GridLineStyle','-','YMinorGrid','on','XMinorGrid','on','XGrid','on','YGrid','on')

xlabel('                 H, kA/m ','fontsize',30);
%ylabel('B, Tl','fontsize',20)
ylabel('mu, 1','fontsize',30)

title('mu(H), balist katushka ','fontsize',30);
set(gca,'fontsize',30)


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
%'19 balist  L/D=1'};  
%
%razmn = struct('area',{'M3:N13'
%'u3:v12'
%'i3:j13'
%'m3:n13'
%'Q3:R10'
%'u3:v13'
%'q3:r10'
%'a3:b9'
%});

legmu={};

for nt=find(istyp);
    for n=find(isobrb{nt})
        if isobrb{nt}(n)
                 %dat=cell(size(is isbr))
            %dat{n}=xlsread('hard example.xlsx',nlistn(n),razmn(n).area);

              B{nt,n}=(aldat(nt).data(n).datob(:,2)*4e-6)/(aldat(nt).data(n).vit*pi*aldat(nt).data(n).diam^2);
            HfromI{nt,n}=Bosn*aldat(nt).data(n).datob(:,1)/mu0;
            mu{nt,n}=B{nt,n}./(mu0*HfromI{nt,n});

            %[(1-(n-1)/(numobr-1))*(n<4) (4-abs(n-4))/(numobr-1) ((n-4)/(numobr-1))*(n>4)];
            plot(HfromI{nt,n}/1000,mu{nt,n},[mark(rem(n,length(mark))+1) '-'],'MarkerSize',6,'LineWidth',1.5,'color',...
                [rem(n*1.3,7)/7 rem(n*1+4,7)/7 rem(n*1+3,7)/7]);
            %[(1-n*2/(numobr))*(n<numobr/2) (numobr-2*abs(n-numobr/2))/(numobr)        ((n-numobr/2)*2/(numobr))*(n>numobr/2)]);
             legmu={legmu{:} aldat(nt).data(n).leg};

        end
    end
end

%legn(find(cellfun('isempty',B)))=[];
hl=legend(legmu,'location', 'northeast','fontsize',20);
%hl=legend(legn,'location', 'southeast');
%set(hl,'fontsize',20)
 %set(hl,'position',[0.816115   0.713144   0.15   0.26095])
