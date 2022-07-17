% upgrated programm maingraf 

%-------------------global---------------------
% other functions saiex prodata changdata grafnld grafbh grafbh vihodgraf
clear legnld;
clear all
tic
global hF hbo numobr hcheb hgranld razmn nlistn dat vitn lbydn legn curr
global hchebbal hchebmag legnld aldat pathxls mark mark2 numtlibo
global hEd1  hEd3 hEd2 hTextl hAxes singlgraf  lastcurr  allhf
global hButl hBut2 hBut3 hBut4 hBut5 hBut6
global  isobr isobrb   isbalist istyp iscurr
%persistent legnld %hEd2

%% 
%!!!!!!!!---------------------- все переменные которые можно сохранить
if  ~(exist('grafvars.mat'))   % сохранение в этом случае всех переменных save('grafvars.mat')
numtip=2; % число типов измерений и образцов
% перемен которым надо структуру для кажд типа измерений и образца
% razmbal lbydbal nlistbal vitbal legbal

%можно убрать:
% [Desc, flag] = pkg ('describe', 'io');
% if all(flag{:}(1)~= 'L')
%  pkg load io
% end

%isstudent    проверка на прогу - матлаб или октав, 1 или 0 !!
isobrb{1}(1:10)=1;
isobrb{2}(1:9)=1;
typeobr={'prut D=16mm, balist katushka'
    'prut D=16mm, magnitom katushka'};
istyp(1:length(aldat))=0;

msymb='m';
% изменить потом путь на более короткий
pathxls='C:/Users/Ramzes 1/Documents/octava/hard example.xlsx';

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
 curr=[1 2 5 10 20 30 40 50 57.5 60];
 iscurr(1:length(curr))=1;
celcurr=num2cell(curr);
%-- данные балист фактора 
% пример подбора структуры aldat = struct('type','balist tolst
% prut','data',[]); aldat.data = struct('area',[],'lbyd',[],'nlist',[],'vit',[],'leg',[],'diam',[]...)
aldat = struct('type','balist tolst prut','data',[]);
% aldat.data = struct('area',[],'lbyd',[],'nlist',[],'vit',[],'leg',[],'diam',[],'datob',[]);
razm{1} = struct('area',{'m3:n13'
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
lbyd{1}=[43
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
nlist{1}=[4 8 5 5 4 6 6 7 7 7 7 8];
vit{1}=[4 18 20 20 4 20 20 4 5 20 5 20];

leg{1}={'6 balist L/D=43'
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
legnld{1}=[0];

% aldat.data.area={razm{1}(1:end-2).area}';
% aldat.data.lbyd=lbyd{1}(1:end-2);
% aldat.data.nlist=nlist{1}(1:end-2);
% aldat.data.vit=vit{1}(1:end-2);
% aldat.data.leg=leg{1}(1:end-2);
% aldat.data.diam=0.01615;
aldat.data = struct('area',{razm{1}(1:end-2).area}','lbyd',num2cell(lbyd{1}(1:end-2)),...
    'nlist',num2cell(nlist{1}(1:end-2)'),'vit',num2cell(vit{1}(1:end-2)'),'leg',leg{1}(1:end-2),'diam',0.01615,'datob',cell([10 1]));


% ------------------- данные магнитом метода
razm{2} = struct('area',{'q3:r10'
'a3'
'e3'
'a3'
'i3'
'm3'
'e3'
});
lbyd{2}=[32
 25
 19
 10.7
 8
 3
 1
 ];
nlist{2}=[5 6 6 5 6 6 7];
vit{2}=[20 20 20 20 20 20 4];

leg{2}={'8 magnitom  L/D=32'
'9 magnitom  L/D=25'
'10 magnitom  L/D=19'
'7 magnitom L/D=11 '
'17 magnitom  L/D=8'
  '18 magnitom  L/D=3'
'19 magnitom  L/D=1'
};

% isempty(findstr (legn{n}, 'mag'));
aldat(2).type ='magnitom tolst prut';
% aldat(2).data.area={razm{1}(end-1:end).area, razm{2}.area}';
% aldat(2).data.lbyd=[lbyd{1}(end-1:end); lbyd{2} ];
% aldat(2).data.nlist=[nlist{1}(end-1:end) nlist{2}];
% aldat(2).data.vit=[vit{1}(end-1:end)  vit{2}];
% aldat(2).data.leg=[leg{1}(end-1:end); leg{2}];
% aldat(2).data.diam=0.01615;
% aldat(2).data.datob=[];
aldat(2).data = struct('area',{razm{1}(end-1:end).area, razm{2}.area}','lbyd',num2cell([lbyd{1}(end-1:end); lbyd{2} ]),...
    'nlist',num2cell([nlist{1}(end-1:end) nlist{2}]'),'vit',num2cell([vit{1}(end-1:end)  vit{2}]'),'leg',[leg{1}(end-1:end); leg{2}],'diam',0.01615,'datob',cell([9 1]));
% сортировка данных образцов по альфа=L/d 
[~,index] = sortrows([aldat(1).data.lbyd].'); aldat(1).data = aldat(1).data(index(end:-1:1)); clear index 
[~,index] = sortrows([aldat(2).data.lbyd].'); aldat(2).data = aldat(2).data(index(end:-1:1)); clear index
%--------------------------

razmn=[razm{1}; razm{2}];
 lbydn=[lbyd{1}; lbyd{2}];
nlistn=[nlist{1} nlist{2}];
vitn=[vit{1} vit{2}];
legn=[leg{1}; leg{2}];

%сортировка по убыванию альфа
if ~all(lbydn==sort(lbydn,'descend'))
  [lbydn obrazord]=sort(lbydn,'descend');
  razmn=razmn(obrazord);
  nlistn=nlistn(obrazord);
  vitn=vitn(obrazord);
  legn=legn(obrazord);
end

 numobr=length(razmn);  %8;
isobr(1:numobr)=1;
isbalist(1:numobr)=1;
hcheb(1:numobr)=0;
hgranld=0;

 %загрузка всех данных с екселя 
nakopit(length(unique(nlistn)))=0;
datali{length(unique(nlistn))}=[];
dat{numobr}=[];
ndifli=0;

for n=1:numobr
  if isempty(find(nakopit==nlistn(n)))
  ndifli=length(find(nakopit))+1;
  datali{ndifli}= xlsread(pathxls,nlistn(n));
    nakopit(ndifli)=nlistn(n);
  else 
  ndifli=find(nakopit==nlistn(n));
  end
  datobr=datali{ndifli}(str2num(razmn(n).area(2))-2:end,...
  double(razmn(n).area(1))-96:double(razmn(n).area(1))-94);
  % datobr(min(find((find(isnan(datobr(:,1))))!=1)):end,:)=[];
  notnan=(find(isnan(datobr(:,1))));
 
  datobr(min(notnan(find(isnan(datobr(:,1)))~=1)):end,:)=[];
  datobr((find(isnan(datobr(:,1)))),:)=[];
  dat{n}= datobr(:,1:3);
end
datali{ndifli};
%}
save('grafvars.mat');
% save('grafsetting.mat','numtlibo','-append');
% save('grafvars.mat','curr','-append'); 
else
    load('grafvars.mat')
end
%дописать здесь проверку что isobrb соответствует по размеру aldat(nt).data
%для всех nt
% save('grafsetting.mat');
load('grafsetting.mat');
toc

%%
hF = figure('Name', 'Proga of gragik''s builting ',...
'Color',[0.94,0.94,0.94],'Position',[200,65,900,650],'Resize','off',...
'HandleVisibility', 'callback', 'NumberTitle','off');
allhf=[allhf    hF];
uicontrol(hF,'Style','text','Position',[10,600,120,40],'BackgroundColor',[0,0.9,0],...
'String',{'proga';  'grafikov'});

% p = uipanel ('title', 'pieces for drawing', 'position',...
%  [33/900 425/650 (790-40)/900 120/650 ]); % 'Parent',hF,  ,'units',
%  "pixels")  почему так не работает
p = uipanel ('title', 'pieces for drawing', 'units', 'pixels', 'position',...
 [30 430 (790-170) 120 ],'Parent',hF);

 % chekboxes of obr
  nbal=1; nmag=1;
  for n=1:numobr;
  if isempty(findstr (legn{n}, 'mag'))
hcheb(n)=uicontrol(p,'Style','checkbox','Position',...
[(nbal-1)*60,15+45*(isempty(findstr (legn{n}, 'mag'))),60,40],...
 'BackgroundColor',[0,0.9,0],'string',...
 [num2str(lbydn(n)) msymb(find(findstr (legn{n}, 'mag')))],'Callback', 'changdata','Value',isobr(n));% isobr(n)
 nbal=nbal+1;
 
 else 
 hcheb(n)=uicontrol(p,'Style','checkbox','Position',...
[(nmag-1)*60,15+45*(isempty(findstr (legn{n}, 'mag'))),60,40],...
 'BackgroundColor',[0,0.9,0],'string',...
 [num2str(lbydn(n)) msymb(find(findstr (legn{n}, 'mag')))],'Callback', 'changdata','Value',isobr(n));
 nmag=nmag+1;
 isbalist(n)=0;
  end
  end

ptip = uipanel ('title', 'выбор типов образцов', 'units', 'pixels', 'position',...
 [780-130 20 240 530 ],'Parent',hF);

% p2 = uipanel ('title', '22 pieces for drawing',...
%  'Units', 'pixels','position',[32+( max(nbal,nmag)-1)*60,322 60 520 ]);
hchebg(1)=uicontrol(ptip,'Style','checkbox','Position',...
[10,490-20*(1),110,40],...
 'BackgroundColor',[0,0.9,0],'string',...
 'all bal','Callback', 'changdata','Value',istyp(1));
hchebg(2)= uicontrol(ptip,'Style','checkbox','Position',...
[10,490-45*(1)-20,110,40],...
 'BackgroundColor',[0,0.9,0],'string',...
 'all mag','Callback', 'changdata','Value',istyp(2));

 

for n2=3:length(aldat)  % chekbox of type
    hcbtip(n2)=uicontrol(ptip,'Style','checkbox','Position',...
[20,425-45*(n2-2),200,40],...
 'BackgroundColor',[0,0.9,0],'string',...
 aldat(n2).type,'Callback', 'checktype','Value',istyp(n2));
uicontrol(ptip,'Style','text','Position',[1,430-45*(n2-2),13,20],'BackgroundColor',[0,0.9,0],...
'String',[num2str(n2) ')']);
end
    

 %-------------
hEd1=uicontrol(hF,'Style','edit','Position',[40,400,260,20],...
'BackgroundColor',[1,0.9,1],'String','1   1   1   1   1   1   1  1',...
'HorizontalAlignment', 'left');
 %
hEd2=uicontrol(hF,'Style','edit','Position',[40,350,260,20],...
'BackgroundColor',[1,0.9,1],'String',num2str(curr(lastcurr)),...
'HorizontalAlignment', 'left');

hBut5=uicontrol(hF,'Style','popupmenu','String',...
celcurr,'Position',[40,300,90,20],'Callback',...
'setcur','Value',lastcurr);
%get(hEd1)

hBut4=uicontrol(hF,'Style','listbox','String',...
{'obr 6','obr 8','obr 9','obr 10','obr 7','obr 17','obr 18','obr 19'},...
'Position',[640-70,10,70,200],'BackgroundColor',[1,1,1],'Callback', 'prodata');


hBut3=uicontrol(hF,'Style','pushbutton','String','grafik N(l/d)','Position',...
[150,300,150,30],'BackgroundColor',[1,1,1],'Callback','grafnld');

hEd3=uicontrol(hF,'Style','checkbox','Position',[310,330,90,90],...
 'BackgroundColor',[0,0.9,0],'string','single grafik','Value',singlgraf);

%-------------
pchekcurr = uipanel ('title', 'chek current', 'units', 'pixels', 'position',...
 [30 230 (110+length(curr)*50) 60 ],'Parent',hF);

hBut7=uicontrol(pchekcurr,'Style','pushbutton','String','все токи','Position',...
[5,5,90,28],'Callback','allcur');

 for n=1:length(curr);  %chekbox of all using currents
     hchebcurr(n)=uicontrol(pchekcurr,'Style','checkbox','Position',...
    [110+(n-1)*50,5,50,40],...
     'BackgroundColor',[0,0.9,0],'string',...
     curr(n),'Callback', 'changdata','Value',iscurr(n));% isobr(n)
 end


hBut2=uicontrol(hF,'Style','pushbutton','String','grafik B(H)','Position',...
[10,10,90,30],'BackgroundColor',[1,1,1],'Callback','grafbh');

hBut6=uicontrol(hF,'Style','pushbutton','String',...
'grafik mu(H)','Position',[110,10,90,30],'Callback','grafmu');

hBut1=uicontrol(hF,'Style','pushbutton','String','exit','Position',...
[490,10,70,30],'BackgroundColor',[0,1,0],'Callback','vihodgraf');

hButmain9=uicontrol(hF,'Style','pushbutton','String','restart','Position',...
[490,50,70,30],'BackgroundColor',[0,1,0],'Callback','restart');

hBut8=uicontrol(hF,'Style','pushbutton','String','добавить данные','Position',...
[310,170,90,28],'Callback','adddata');

f = uimenu(hF,'Label','Добавить данные');
    uimenu(f,'Label','новый тип образца','Callback','adddata');
     uimenu(f,'Label','новый образец','Callback','adddata');


%vals = get(hbo,'Value');
    
 %end
 
% isobr = get(hcheb,'Value');

%function setcur
%
%set(hEd2,'String','nov tok');
%endfunction