function maingraf
%-------------------global---------------------
% other functions saiex prodata changdata grafnld grafbh grafbh vihodgraf
clear legnld;
clear all
tic
global hF hbo isobr numobr hcheb hgranld razm nlist dat vit lbyd leg curr
global hchebbal hchebmag isbalist
global hEd1  hEd3 hEd4 hEd5 hEd2 hTextl hAxes 
global hButl hBut2 hBut3 hBut4 hBut5 hBut6
persistent legnld %hEd2

%можно убрать:
% [Desc, flag] = pkg ('describe', 'io');
% if all(flag{:}(1)~= 'L')
%  pkg load io
% end

%isstudent    проверка на прогу - матлаб или октав, 1 или 0 !!


msymb='m';
% изменить потом путь на более короткий
pathxls='C:/Users/Ramzes 1/Documents/octava/hard example.xlsx';

 
 curr=[1 2 5 10 20 30 40 50 57.5];
celcurr=cellstr(num2str(curr));
%-- изменить потом путь на более короткий
razmbal = struct('area',{'m3:n13'
'j3'
'i3:j13'
'm3:n13'
'q3:r10'
'u3:v13'
'q3:r10'
'a3:b9'
'i3'
'm3'
'r3'
'a3'
});
lbydbal=[43
 32
 25
 19
 10.7
 8
 3
 1
 1.8
 5.5
 1.8
 5.5];
nlistbal=[4 8 5 5 4 6 6 7 7 7 7 8];
vitbal=[4 18 20 20 4 20 20 4 5 20 5 20];

legbal={'6 balist L/D=43'
'8 balist  L/D=32'
'9 balist  L/D=25'
'10 balist  L/D=19'
'7 balist L/D=11 '
'17 balist  L/D=8'
  '18 balist  L/D=3'
'19 balist  L/D=1'
'20 balist  L/D=1,8'
'21 balist  L/D=5,5'
'20 magnitom  L/D=1,8'
'21 magnitom  L/D=5,5'};
legnld{1}=[];


% ------------------- данные магнитом метода
razmmag = struct('area',{'q3:r10'
'a3'
'e3'
'a3'
'i3'
'm3'
'e3'
});
lbydmag=[32
 25
 19
 10.7
 8
 3
 1
 ];
nlistmag=[5 6 6 5 6 6 7];
vitmag=[20 20 20 20 20 20 4];

legmag={'8 magnitom  L/D=32'
'9 magnitom  L/D=25'
'10 magnitom  L/D=19'
'7 magnitom L/D=11 '
'17 magnitom  L/D=8'
  '18 magnitom  L/D=3'
'19 magnitom  L/D=1'
};

%--------------------------

razm=[razmbal; razmmag];
 lbyd=[lbydbal; lbydmag];
nlist=[nlistbal nlistmag];
vit=[vitbal vitmag];
leg=[legbal; legmag];

%сортировка по убыванию альфа
if ~(lbyd==sort(lbyd,'descend'))
  [lbyd obrazord]=sort(lbyd,'descend')
  razm=razm(obrazord);
  nlist=nlist(obrazord);
  vit=vit(obrazord);
  leg=leg(obrazord);
end

 numobr=length(razm);  %8;
isobr(1:numobr)=1;
isbalist(1:numobr)=1;
hcheb(1:numobr)=0;
hgranld=0;

 %загрузка всех данных с екселя 
nakopit(length(unique(nlist)))=0;
datali{length(unique(nlist))}=[];
dat{numobr}=[];
ndifli=0;
for n=1:numobr
  if isempty(find(nakopit==nlist(n)))
  ndifli=length(find(nakopit))+1;
  datali{ndifli}= xlsread(pathxls,nlist(n));
    nakopit(ndifli)=nlist(n);
  else 
  ndifli=find(nakopit==nlist(n));
  end
  datobr=datali{ndifli}(str2num(razm(n).area(2))-2:end,...
  double(razm(n).area(1))-96:double(razm(n).area(1))-94);
  % datobr(min(find((find(isnan(datobr(:,1))))!=1)):end,:)=[];
  notnan=(find(isnan(datobr(:,1))));
 
  datobr(min(notnan(find(isnan(datobr(:,1)))~=1)):end,:)=[];
  datobr((find(isnan(datobr(:,1)))),:)=[];
  dat{n}= datobr(:,1:3);
end
datali{ndifli};
%}

hF = figure('Name', 'Proga of gragik''s builting ',...
'Color',[0.94,0.94,0.94],'Position',[200,50,900,650],'Resize','off',...
'HandleVisibility', 'callback', 'NumberTitle','off');

uicontrol(hF,'Style','text','Position',[10,600,120,40],'BackgroundColor',[0,0.9,0],...
'String','proga grafikov');

p = uipanel ('title', 'pieces for drawing', 'position',...
 [33/900 425/650 (790-40)/900 120/650 ]); % 'Parent',hF,  ,'units', "pixels")

 % chekboxes of obr
 nbal=1; nmag=1;
  for n=1:numobr;
  if isempty(findstr (leg{n}, 'mag'))
hcheb(n)=uicontrol(hF,'Style','checkbox','Position',...
[40+(nbal-1)*60,430+50*(isempty(findstr (leg{n}, 'mag'))),60,40],...
 'BackgroundColor',[0,0.9,0],'string',...
 [num2str(lbyd(n)) msymb(find(findstr (leg{n}, 'mag')))],'Callback', 'changdata');
 nbal=nbal+1;
 
 else 
 hcheb(n)=uicontrol(hF,'Style','checkbox','Position',...
[40+(nmag-1)*60,430+50*(isempty(findstr (leg{n}, 'mag'))),50,40],...
 'BackgroundColor',[0,0.9,0],'string',...
 [num2str(lbyd(n)) msymb(find(findstr (leg{n}, 'mag')))],'Callback', 'changdata');
 nmag=nmag+1;
 isbalist(n)=0;
  end
end

% p2 = uipanel ('title', '22 pieces for drawing',...
%  'Units', 'pixels','position',[32+( max(nbal,nmag)-1)*60,322 60 520 ]);
hchebbal=uicontrol(hF,'Style','checkbox','Position',...
[40+( max(nbal,nmag)-1)*60,430+50,60,40],...
 'BackgroundColor',[0,0.9,0],'string',...
 'all bal','Callback', 'changdata');
hchebmag= uicontrol(hF,'Style','checkbox','Position',...
[40+(max(nbal,nmag)-1)*60,430,60,40],...
 'BackgroundColor',[0,0.9,0],'string',...
 'all mag','Callback', 'changdata');

 
 %-------------
hEd1=uicontrol(hF,'Style','edit','Position',[40,400,260,20],...
'BackgroundColor',[1,0.9,1],'String','1   1   1   1   1   1   1  1',...
'HorizontalAlignment', 'left');
 %
hEd2=uicontrol(hF,'Style','edit','Position',[40,350,260,20],...
'BackgroundColor',[1,0.9,1],'String','1',...
'HorizontalAlignment', 'left');

hBut5=uicontrol(hF,'Style','popupmenu','String',...
celcurr,'Position',[40,300,90,20],'Callback',...
'setcur');
%get(hEd1)

hBut4=uicontrol(hF,'Style','listbox','String',...
{'obr 6','obr 8','obr 9','obr 10','obr 7','obr 17','obr 18','obr 19'},...
'Position',[800,400,70,230],'BackgroundColor',[1,1,1],'Callback', 'prodata');


hBut3=uicontrol(hF,'Style','pushbutton','String','grafik N(l/d)','Position',...
[150,300,150,30],'BackgroundColor',[1,1,1],'Callback','grafnld');

hEd3=uicontrol(hF,'Style','checkbox','Position',[310,330,90,90],...
 'BackgroundColor',[0,0.9,0],'string','single grafik','Value',0);

hBut2=uicontrol(hF,'Style','pushbutton','String','grafik B(H)','Position',...
[10,10,90,30],'BackgroundColor',[1,1,1],'Callback','grafbh');

hBut6=uicontrol(hF,'Style','pushbutton','String',...
'grafik mu(H)','Position',[110,10,90,30],'Callback','grafmu');

hBut1=uicontrol(hF,'Style','pushbutton','String','exit','Position',...
[800,10,70,30],'BackgroundColor',[0,1,0],'Callback','vihodgraf');

%vals = get(hbo,'Value');
    
 end
 
% isobr = get(hcheb,'Value');

%function setcur
%
%set(hEd2,'String','nov tok');
%endfunction