
%графики B-r

%bxm1 = load ('C:\Users\Ramzes 1\Documents\modelcoms\manyparam\B-r\Bx r0,7.txt'); %coms dat
%bxm2 = load ('C:\Users\Ramzes 1\Documents\modelcoms\manyparam\B-r\Bx r1,5fine.txt'); %coms dat
%bxm3 = load ('C:\Users\Ramzes 1\Documents\modelcoms\manyparam\B-r\Bx r2,4.txt');
%bxm4 = load ('C:\Users\Ramzes 1\Documents\modelcoms\manyparam\B-r\Bx r4,8fine.txt');

bxm1 = load ('C:\Users\Ramzes 1\Documents\modelcoms\manyparam\B(x) 6.txt'); %coms datB(x) 6
bxm2 = load ('C:\Users\Ramzes 1\Documents\modelcoms\manyparam\B(x) 5.txt'); %coms dat
bxm3 = load ('C:\Users\Ramzes 1\Documents\modelcoms\manyparam\B(x) 17.txt');
bxm4 = load ('C:\Users\Ramzes 1\Documents\modelcoms\manyparam\B(x) 18.txt');

 left=9;
bottom=49;
width=1350;
height=636;
figure('position', [left bottom width height])
 grid minor  on
hold on
set(gca,'fontsize',30)
ylabel('B, T','fontsize',30)
xlabel(' x, m','fontsize',30);

 % plot(bxm1(:,1),bxm1(:,2)* 1,'s-k','LineWidth',2.5,'MarkerSize',13)%1.1453  2.5097
%text(bxm1(2,1),bxm1(2,2),...
%'<---------------------r 0,7m','EdgeColor','red','fontsize',20);
%
plot(bxm2(:,1),bxm2(:,2)* 1,'v-r','LineWidth',2.5,'MarkerSize',13)
%text(bxm2(5,1),bxm2(5,2),...
%'<---------------------r 2,4m','EdgeColor','red','fontsize',20);

plot(bxm3(:,1),bxm3(:,2)* 1,'+-b','LineWidth',2.5,'MarkerSize',13)
%text(bxm3(8,1),bxm3(8,2),...
%'<---------------------r 4,8m','EdgeColor','red','fontsize',20);

plot(bxm4(:,1),bxm4(:,2)* 1,'p--m','LineWidth',2.5,'MarkerSize',13)
%text(bxm3(8,1),bxm3(8,2),...
%'<---------------------r 4,8m','EdgeColor','red','fontsize',20);
legend('r=0,2m','r=0,4m','r=2,m',"location", 'northeast');


%}
%----------------------------

