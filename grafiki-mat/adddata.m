function adddata
%adddata
global aldat isobr numobr nlistn razmn dat vitn lbydn legn ...
    pathxls isobrb hcheb2 hchebg2 istyp numtlibo allhf
%ishchb созданы ли окна галочек данного типа
%isobrb есть ли галочка для  этого образца данного типа
% hcheb2 указатель на галочки отдельных образцов
% hchebg2 указатель на галочки типов


% -----------временная строчка!!!!!!
%typeobr={'prut D=16mm, balist katushka' 'prut D=16mm, magnitom katushka'};
typeobr={aldat(:).type};
%------------
ishchb(length(aldat))=0;
%     uimenu(f,'Label','Quit','Callback','exit',... 
%            'Separator','on','Accelerator','Q');

hF2 = figure('Name', 'состояние данных ',...
'Color',[0.94,0.94,0.94],'Position',[20,50,900,600],'Resize','on',...
'HandleVisibility', 'callback', 'NumberTitle','off');
allhf=[allhf    hF2];

p2 = uipanel (hF2,'units', 'pixels','title', 'данные образца', 'position',...
 [500 200 250 400 ]);

p3 = uipanel (hF2,'units', 'pixels','title', 'выбор образцов', 'position',...
 [10 2 880 190 ]);

hlib1=uicontrol(hF2,'Style','Listbox',...
	'String',typeobr,...
 	'Position',[40 340 200 250], 'BackgroundColor',[1,1,1],'Callback',@libo1,'value',numtlibo);

hlib2=uicontrol(hF2,'Style','Listbox',...
	'String',{aldat(numtlibo).data.leg},...
 	'Position',[250 340 200 250], 'BackgroundColor',[1,1,1],'Callback',@libo2);



hBut9=uicontrol(hF2,'Style','pushbutton','String','добавить образец','Position',...
[760,570,110,30],'Callback',@addobr);

hBut10=uicontrol(hF2,'Style','pushbutton','String','добавить тип обр','Position',...
[760,530,110,30],'Callback',@addtypeobr);

hBut11=uicontrol(hF2,'Style','pushbutton','String','выбрать образцы','Position',...
[760,490,110,30],'Callback',@checkobr);

hBut12=uicontrol(hF2,'Style','pushbutton','String',{'копировать данные'; 'c экселя'},'Position',...
[760,400,110,80],'Callback',@copexel);

hBut13=uicontrol(hF2,'Style','pushbutton','String',{'модель c экселя'},'Position',...
[760,370,110,30],'Callback',@copmodelexel);

heightp2=400-15;
heighted=20;
heighttex=20;
ned=1;
hEd85=uicontrol(p2,'Style','edit','Position',[10,heightp2- (heighttex*ned+heighted*ned+5*ned),200,25],...
 'BackgroundColor',[1,1,1]);
uicontrol(p2,'Style','text','Position',[10,heightp2- (heighttex*ned+heighted*(ned-1)+5*ned),200,20],'BackgroundColor',[0,0.9,0],...
'String','тип образца');
ned=ned+1;

hEd4=uicontrol(p2,'Style','edit','Position',[10,heightp2- (heighttex*2+heighted*2+5*ned),200,25],...
 'BackgroundColor',[1,1,1]);
uicontrol(p2,'Style','text','Position',[10,heightp2- (heighttex*2+heighted*1+5*ned),200,20],'BackgroundColor',[0,0.9,0],...
'String','название, номер обр,особые пометки');
ned=ned+1;

hEd5=uicontrol(p2,'Style','edit','Position',[10,heightp2- (heighttex*3+heighted*3+5*ned),200,25],...
 'BackgroundColor',[1,1,1]);
uicontrol(p2,'Style','text','Position',[10,heightp2- (heighttex*ned+heighted*(ned-1)+5*ned),200,20],'BackgroundColor',[0,0.9,0],...
'String','адрес в экселе');
ned=ned+1;

hEd6=uicontrol(p2,'Style','edit','Position',[10,heightp2- (heighttex*4+heighted*4+5*ned),200,25],...
 'BackgroundColor',[1,1,1],'String','L/D сюда пиши');
uicontrol(p2,'Style','text','Position',[10,heightp2- (heighttex*ned+heighted*(ned-1)+5*ned),200,20],'BackgroundColor',[0,0.9,0],...
'String','L/D');
ned=ned+1;

hEd65=uicontrol(p2,'Style','edit','Position',[10,heightp2- (heighttex*5+heighted*5+5*ned),200,25],...
 'BackgroundColor',[1,1,1]);
uicontrol(p2,'Style','text','Position',[10,heightp2- (heighttex*ned+heighted*(ned-1)+5*ned),200,20],'BackgroundColor',[0,0.9,0],...
'String','номер листа');
ned=ned+1;

hEd7=uicontrol(p2,'Style','edit','Position',[10,heightp2- (heighttex*6+heighted*6+5*ned),200,25],...
 'BackgroundColor',[1,1,1]);
uicontrol(p2,'Style','text','Position',[10,heightp2- (heighttex*ned+heighted*(ned-1)+5*ned),200,20],'BackgroundColor',[0,0.9,0],...
'String','число витков');
ned=ned+1;

hEd8=uicontrol(p2,'Style','edit','Position',[10,heightp2- (heighttex*7+heighted*7+5*ned),200,25],...
 'BackgroundColor',[1,1,1]);
uicontrol(p2,'Style','text','Position',[10,heightp2- (heighttex*ned+heighted*(ned-1)+5*ned),200,20],'BackgroundColor',[0,0.9,0],...
'String','диаметр витков, мм');
ned=ned+1;

hEd9=uicontrol(p2,'Style','edit','Position',[10,heightp2- (heighttex*8+heighted*8+5*ned),200,25],...
 'BackgroundColor',[1,1,1]);
uicontrol(p2,'Style','text','Position',[10,heightp2- (heighttex*ned+heighted*(ned-1)+5*ned),200,20],'BackgroundColor',[0,0.9,0],...
'String','коэфициент обмотки');
hedal=[hEd5 hEd6 hEd65 hEd7 hEd4 hEd8 hEd9];


%%
%

function libo1(src,evt)
ntyp=get(hlib1,'value');
numtlibo=ntyp;
set(hlib2,'String',{aldat(ntyp).data.leg},'value',1);

nobr=get(hlib2,'value');

fielald=struct2cell(aldat(ntyp).data);
set(hedal,{'String'},fielald([1:6 8],nobr))
set(hEd85,'String',aldat(ntyp).type)
set(findobj(get(p3,'Children'),'Visible','on'),'Visible','off');
if ishchb(ntyp)
      set([hchebg2(ntyp) hcheb2{ntyp}],'Visible','on');
end

% мож добавить еще выбор образцов здесь
end

%

function libo2(src,evt)
%set(hlib2,'String',aldat(ntyp).data.leg);
ntyp=get(hlib1,'value');
nobr=get(hlib2,'value');
fielald=struct2cell(aldat(ntyp).data); %поля из aldat
set(hedal,{'String'},fielald([1:6 9],nobr))
set(hEd85,'String',aldat(ntyp).type)
end

%
function addobr(src,evt)
%aldat=[aldat ];
ntyp=get(hlib1,'value'); %
if ~any(strcmp({aldat(:).type},get(hEd85,'String'))) %проверяет есть ли уже в структуре aldat такой тип, если нет доавляет его в нее
    aldat(length(aldat)+1).type=get(hEd85,'String');
    isobrb{length(aldat)}=[];
    ntyp=length(aldat);
    aldat(length(aldat)).data = struct('area',[],'lbyd',[],'nlist',[],'vit',[],'leg','','diam',[],'datob',[],'path','','kobm',[]);
        isobrb{length(aldat)}=[];
        typeobr={aldat(:).type};
        set(hlib1,'String',typeobr)
        set(hlib2,'String',{aldat(end).data.leg}) %,'value',aldat(end).data.leg
        istyp(length(aldat))=0;
        ntyp=length(aldat);
         save('grafsetting.mat','istyp','-append');

end
    %ntyp=find(strcmp({aldat(:).type},get(hEd85,'value')));
    ncompar= find(cell2mat(cellfun(@(pp) ~isempty(pp), strfind({aldat(ntyp).data.leg},get(hEd4,'String')),'UniformOutput',0)));%  find(strcmp({aldat(ntyp).data.leg},get(hEd4,'String')),1);
    % - узнает номер образца с легендой содержащей название образца из поля
    leald=length(aldat(ntyp).data);
if ~isempty(ncompar)  %find(strfind({aldat(ntyp).data.leg},get(hEd4,'String')))
elseif strcmp(aldat(ntyp).data(1).leg,'') %проверяет что нет легенды у первого элемента, т.е. он единственный и пустой. 
    aldat(ntyp).data(leald).area=get(hEd5,'String'); 
    aldat(ntyp).data(leald).lbyd=str2num(get(hEd6,'String')); 
    aldat(ntyp).data(leald).nlist=str2num(get(hEd65,'String')); 
    aldat(ntyp).data(leald).vit=str2num(get(hEd7,'String')); 

    aldat(ntyp).data(leald).leg=[get(hEd4,'String'),', ', get(hEd85,'String') ', L/D=' num2str(aldat(ntyp).data(leald).lbyd)] ; 
    aldat(ntyp).data(leald).diam=str2num(get(hEd8,'String'));
        aldat(ntyp).data(leald).kobm=str2num(get(hEd9,'String'));
           isobrb{ntyp}(leald)=1;
           set(hlib2,'String',{aldat(ntyp).data.leg})
     
else
    aldat(ntyp).data(leald+1).area=get(hEd5,'String'); 
    aldat(ntyp).data(leald+1).lbyd=str2num(get(hEd6,'String')); 
    aldat(ntyp).data(leald+1).nlist=str2num(get(hEd65,'String')); 
    aldat(ntyp).data(leald+1).vit=str2num(get(hEd7,'String')); 

    aldat(ntyp).data(leald+1).leg=[get(hEd4,'String'),', ', get(hEd85,'String') ', L/D=' num2str(aldat(ntyp).data(leald+1).lbyd)] ; 
    aldat(ntyp).data(leald+1).diam=str2num(get(hEd8,'String'));
    aldat(ntyp).data(leald+1).kobm=str2num(get(hEd9,'String'));    
           isobrb{ntyp}(leald+1)=1;
%     if 
    
set(hlib2,'String',{aldat(ntyp).data.leg})

end
  save('grafsetting.mat','isobrb','-append');
           save('grafvars.mat','aldat','-append');


end


function copexel(src,evt)
    ntyp=get(hlib1,'value');
    nobr=get(hlib2,'value');

       indnewob=find(cellfun('isempty',{aldat(ntyp).data.datob})&~cellfun('isempty',{aldat(ntyp).data.area}));   % пока не придумал как с этим оператором сделать isempty(find(nakopit==nlistn(n))
       
              numobr=length(indnewob); 
      %        5==6
if isempty(indnewob)  %если есть пустые элементы данных из экселя
    indnewob=nobr;  %!!! сделать предупреждение о заполненных данных
end
    nakopit(length(unique([aldat(ntyp).data(indnewob).nlist])))=0;
    datali{length(unique([aldat(ntyp).data(indnewob).nlist]))}=[];
 %aldat(ntyp).data.datob{numobr}=[];
    %ndifli=0;
    for n=indnewob
      if isempty(find(nakopit==aldat(ntyp).data(n).nlist))
          ndifli=length(find(nakopit))+1;
          if  isempty(aldat(ntyp).data(n).path)  %!!исправить проверку  strcmp(
                            datali{ndifli}= xlsread('C:/Users/Ramzes 1/Documents/octava/hard example2.xlsx',aldat(ntyp).data(n).nlist);

          else
              datali{ndifli}= xlsread(pathxls,aldat(ntyp).data(n).nlist);
          end
            nakopit(ndifli)=aldat(ntyp).data(n).nlist;
      else 
         ndifli=find(nakopit==aldat(ntyp).data(n).nlist);
      end
      if length(aldat(ntyp).data(n).area)==2
          datobr=datali{ndifli}(str2num(aldat(ntyp).data(n).area(2))-2:end,...
          double(aldat(ntyp).data(n).area(1))-96:double(aldat(ntyp).data(n).area(1))-93);
      else
          ncolonexel=(double(aldat(ntyp).data(n).area(1))-96)*26+ double(aldat(ntyp).data(n).area(2))-96;
          datobr=datali{ndifli}(str2num(aldat(ntyp).data(n).area(3))-2:end,...
           ncolonexel:ncolonexel+3);
      end
      % datobr(min(find((find(isnan(datobr(:,1))))!=1)):end,:)=[];
      datdop=datobr(1:5,4); %берет 5 первых ячеек, т.к. ниже пока не ввожу дополнительных данных из 4 столбца образца
      % ввод доп данных
      if ~isnan(datdop(3)); aldat(ntyp).data(n).lbyd=datdop(3); end;
      % if нет альфы в легенде - добавить   
      if  findstr(aldat(ntyp).data(n).leg,'=')==length(aldat(ntyp).data(n).leg);  aldat(ntyp).data(n).leg=[aldat(ntyp).data(n).leg num2str(aldat(ntyp).data(n).lbyd)]; end
      if ~isnan(datdop(4)); aldat(ntyp).data(n).vit=datdop(4); end;
      if ~isnan(datdop(2)); aldat(ntyp).data(n).diam=datdop(2)/1000; end;
      %------
      notnan=(find(isnan(datobr(:,1))));

      datobr(min(notnan(find(isnan(datobr(:,1)))~=1)):end,:)=[]; %удаляет пустые области начиная с первой пустой ячейки в токе кроме первой ячейки
      datobr((find(isnan(datobr(:,1)))),:)=[]; %удаляет теперь первую ячейку если пуста
       aldat(ntyp).data(n).datob= datobr(:,1:3);
       
    end

 [~,index] = sortrows([aldat(ntyp).data.lbyd].'); aldat(ntyp).data = aldat(ntyp).data(index(end:-1:1)); clear index;
%datali{ndifli};
        save('grafvars.mat','aldat','-append');
   

%aldat(length(aldat)+1).type=get(hEd85,'value');
    
end

function copmodelexel(src,evt)
    ntyp=get(hlib1,'value');
    aldat(ntyp).data(1).area=get(hEd5,'String'); 
    %nakopit(length(unique([aldat(ntyp).data(indnewob).nlist])))=0;
    %datali{length(unique([aldat(ntyp).data(indnewob).nlist]))}=[];
 %aldat(ntyp).data.datob{numobr}=[];
    %ndifli=0;
   % for n=indnewob
%       if isempty(find(nakopit==aldat(ntyp).data(n).nlist))
          ndifli=1;
          if  isempty(aldat(ntyp).data(1).path)  %!!исправить проверку  strcmp(
                            datali= xlsread('C:/Users/Ramzes 1/Documents/octava/hard example2.xlsx', str2num(get(hEd65,'String'))); %пока, если не вставил путь, то берет со 2го дока

          else
              datali= xlsread(pathxls,str2num(get(hEd65,'String')));
          end
%             nakopit(ndifli)=aldat(ntyp).data(n).nlist;
%       else 
%          ndifli=find(nakopit==aldat(ntyp).data(n).nlist);
%       end
      if length(aldat(ntyp).data(1).area)==2   % if adress have one letter 
          datobr=datali(str2num(aldat(ntyp).data(1).area(2))-2:end,...
          double(aldat(ntyp).data(1).area(1))-96:end);
      else % if adress have two letter 
          ncolonexel=(double(aldat(ntyp).data(1).area(1))-96)*26+ double(aldat(ntyp).data(1).area(2))-96;
          datobr=datali(str2num(aldat(ntyp).data(1).area(3))-2:end,...
           ncolonexel:end);
      end
      % datobr(min(find((find(isnan(datobr(:,1))))!=1)):end,:)=[];
     % datdop=datobr(1:5,4); %берет 5 первых ячеек, т.к. ниже пока не ввожу дополнительных данных из 4 столбца образца
      % ввод доп данных
      % if нет альфы в легенде - добавить   
      %------
      notnanvert=(find(isnan(datobr(2:end,1)))); % numbers of nan's cells
      notnanhoriz=(find(isnan(datobr(1,2:end))));

      datobr(min(notnanvert):end,:)=[]; %удаляет пустые области начиная с первой пустой ячейки в токе кроме первой ячейки datobr(min(notnanvert(find(isnan(datobr(:,1)))~=1)):end,:)=[]; 
datobr(:,min(notnanhoriz):end)=[];
%datobr((find(isnan(datobr(:,1)))),:)=[]; %удаляет теперь первую ячейку если пуста
for nobr=1:size(datobr,2)-1
       aldat(ntyp).data(nobr).datob= [datobr(2:end,1) datobr(2:end,nobr+1)];
       aldat(ntyp).data(nobr).lbyd=datobr(1,nobr+1);
        if  findstr(aldat(ntyp).data(nobr).leg,'=')==length(aldat(ntyp).data(nobr).leg);
            aldat(ntyp).data(nobr).leg=[aldat(ntyp).data(nobr).leg num2str(aldat(ntyp).data(nobr).lbyd)];
        else 
            aldat(ntyp).data(nobr).leg=['L/D=' num2str(aldat(ntyp).data(nobr).lbyd)] ; 
        end
      aldat(ntyp).data(nobr).vit=1; 
           aldat(ntyp).data(nobr).kobm=1;
            aldat(ntyp).data(nobr).diam=str2num(get(hEd8,'String'));
end
       
  
    %end

 [~,index] = sortrows([aldat(ntyp).data.lbyd].'); aldat(ntyp).data = aldat(ntyp).data(index(end:-1:1)); clear index;
%datali{ndifli};
        save('grafvars.mat','aldat','-append');
   istyp(length(aldat))=0;
isobrb{length(aldat)}(1:length(aldat(ntyp).data))=1;
  save('grafsetting.mat','isobrb','istyp','-append');


%aldat(length(aldat)+1).type=get(hEd85,'value');
    
end

function addtypeobr(src,evt)
     ntyp=get(hlib1,'value');
     numtlibo=ntyp;
     aldat(length(aldat)+1) = struct('type',[],'data',[]);
aldat(length(aldat)).type=get(hEd85,'string');
aldat(length(aldat)).data = struct('area',[],'lbyd',[],'nlist',[],'vit',[],'leg','','diam',[],'datob',[],'path','','kobm',[]);
isobrb{length(aldat)}=[];
typeobr={aldat(:).type};
set(hlib1,'String',typeobr)
istyp(length(aldat))=0;
 save('grafsetting.mat','istyp','-append');
         save('grafvars.mat','aldat','-append');

 ishchb(ntyp)=0;
 set(hlib1,'value',length(aldat)); %check!!
 set(hlib2,'String',{aldat(end).data.leg},'value',1);

end

    function checkobr(src,evt)
            ntyp=get(hlib1,'value');
        numobr=length(aldat(ntyp).data);
     if ishchb(ntyp)==0; % if handle of chek box don't exist then make it
         ishchb(ntyp)=1;
        nbal=1; nmag=1;
numcolonchb=18;
          for n=1:numobr;
         % if isempty(findstr (aldat(ntyp).data.leg{n}, 'mag'))
        hcheb2{ntyp}(n)=uicontrol(p3,'Style','checkbox','Position',...
        [10+(rem(n+1,numcolonchb)-1*(fix((n+1)/numcolonchb)==0))*50,135-fix((n+1)/numcolonchb)*45,50,40],...
         'BackgroundColor',[0,0.9,0],'string',...
         [num2str(aldat(ntyp).data(n).lbyd)],'Callback', 'changdata','Value',isobrb{ntyp}(n));% isobr(n)

         %n=n+1;

         %else 
        %  hcheb(n)=uicontrol(hF,'Style','checkbox','Position',...
        % [40+(nmag-1)*60,430+50*(isempty(findstr (aldat(ntyp).data.leg{n}, 'mag'))),50,40],...
        %  'BackgroundColor',[0,0.9,0],'string',...
        %  [num2str(aldat(ntyp).data.lbydn(n)) msymb(find(findstr (aldat(ntyp).data.leg{n}, 'mag')))],'Callback', 'changdata2','Value',isobr(n));
        %  nmag=nmag+1;
        %  isbalist(n)=0;
        %   end
          end
        hchebg2(ntyp)=uicontrol(p3,'Style','checkbox','Position',...
        [5,135,50,40],...
         'BackgroundColor',[0.5,0.9,0],'string',...
         'все','Callback', 'changdata','Value',1);  
     elseif strcmp(get(hchebg2(ntyp),'Visible'),'on');
                          set([hchebg2(ntyp) hcheb2{ntyp}],'Visible','off'); %повторная кнопка скрывает галки
     else
         set([hchebg2(ntyp) hcheb2{ntyp}],'Visible','on'); %многоповторная кнопка показывает галки, если не видны
             end
        end
%}
end