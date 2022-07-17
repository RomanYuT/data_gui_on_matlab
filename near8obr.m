% кривые магн поля близи 8обр

[Desc, flag] = pkg ("describe", "io");
if all(flag{:}(1)!= 'L')
 
pkg load io
end

 left=9;
bottom=49;
width=1350;
height=636;
hf=figure('position', [left bottom width height])
 grid minor  on
hold on
set(gca,'fontsize',30)


if ~exist('by10');
 by10 = load ('8obr B(y) 10a.txt');
end

if ~exist('by20');
 by20 = load ('8obr B(y) 20a.txt');
end

if ~exist('by30');
 by30 = load ('8obr B(y) 30a.txt');
end

if ~exist('by40');
 by40 = load ('8obr B(y) 40a.txt');
end

if ~exist('by50');
 by50 = load ('8obr B(y) 50a.txt');
end

   plot(by10(:,1),by10(:,2),'x-k')
plot(by20(:,1),by20(:,2),'x-b')
plot(by30(:,1),by30(:,2),'x-g')
plot(by40(:,1),by40(:,2),'x-r')
plot(by50(:,1),by50(:,2),'x-m')