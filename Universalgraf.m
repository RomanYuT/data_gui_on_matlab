% universal plot

%---------- reading data
dat1=xlsread('hard example.xlsx',4,'M3:N13');
%dat2 = load ('C:\Users\Ramzes 1\Documents\octava\coms data\ferrdata.txt'); %
%dat3=[
%     ];
%   [~,index] =sortrows(dat3,1); dat3=dat3(index,:); % sort along 1st colomn
 %dat1=sortrows(dat3,1);  

%-------plotting
 left=9;
bottom=49;
width=1350;
height=636;
f1=figure('position', [left bottom width height],'HandleVisibility', 'callback','Color','w');
  hax1=axes('Parent',f1);
     xlabel(hax1,' gamma            ','fontsize',30);
    %ylabel('B, Tl','fontsize',20)
    ylabel(hax1,'Fv','fontsize',30)
    set(hax1,'fontsize',30,'GridLineStyle','-','YMinorGrid','on','XMinorGrid','on','XGrid','on','YGrid','on')
    title(hax1,['Fv(gamma)' ],'fontsize',20);
            hold(hax1)

%  ylim([0 2.2 ])
%  xlim([0 65 ])
plot(dat1(:,2)/1,dat1(:,1),'dg-','MarkerSize',9,'LineWidth',2.5)
% plot(BH(:,2)/1000,BH(:,1),'dg-','MarkerSize',9,'LineWidth',2.5,  'color',[0 0 0])

 %legend(cellfun(@num2str, num2cell([2:10]), 'UniformOutput', false),'location', 'northwest','fontsize',16);
 %text(bxm3(8,1),bxm3(8,2),...
%'<---------------------r 4,8m','EdgeColor','red','fontsize',20);