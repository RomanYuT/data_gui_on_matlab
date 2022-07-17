%{
  %xx=[100:-1:-100]; xnol=10; ynol=sqrt(100^2-xnol^2); v1=sqrt(1000*(ynol/100));
%  yy=ynol+xnol/ynol*(xnol-xx)-10*(xnol-xx).^2/(2*v1^2*(ynol/100)^2); yy2=(sqrt(100^2-xx.^2));
%  plot(xx,yy,xx,yy2,':r')
% ylim([0 100]);
%plot(xx,(xnol^3-100^2*xx)./(100^2-xnol^2)^1.5,xx,-xx./(sqrt(100^2-xx.^2)))

%%--
bxvari16=load ('C:\Users\Ramzes 1\Documents\modelcoms\5-3\мир\data\farbl grafbx all I.txt','-ascii');  
%farbl 2-10 mupr grafbx     farbl grafbx all I      
bxvari16mu1=load ('C:\Users\Ramzes 1\Documents\modelcoms\5-3\мир\data\farbl grafbx all 16 13 mu1.txt','-ascii');
bxvari16mu3=load ('C:\Users\Ramzes 1\Documents\modelcoms\5-3\мир\data\farbl grafbx all 16 13 mu3.txt','-ascii');

%bhprut(:,1)=biprut(:,1)*901;
%  bexp16=xlsread('potok magnet.xlsx',5,'g3:h33'); %m3:n33 p3:q33 s3:t33


 left=9;
bottom=49;
width=1350;
height=636;
figure('position', [9 49 1350 636],'Color','w')
 grid on
 grid minor
hold on
set(gca,'fontsize',30)
set(gca,'fontsize',30,'GridLineStyle','-','YMinorGrid','on','XMinorGrid','on','XGrid','on','YGrid','on')
ylabel('B, mT','fontsize',30)
xlabel(' x, mm','fontsize',30);
    

for nn=5:-1:2
    nn=4;
     plot(bxvari16(:,1),bxvari16(:,4)*1000,'o-','LineWidth',2.5,'MarkerSize',9,'color',[rem(nn*1.3,7)/7 rem(nn*1+4,7)/7 rem(nn*1+3,7)/7])
     %plot(bxvari16mu3(:,1),bxvari16mu3(:,3)*1000,'o:','LineWidth',2.5,'MarkerSize',9,'color',[rem(nn*1.3,7)/7 rem(nn*1+4,7)/7 rem(nn*1+3,7)/7])
     %plot(bexp16(:,1)/1000,bexp16(:,2),'o-k','LineWidth',2.5,'MarkerSize',9)
end
hl=legend('I=30', 'I=16', 'I=8', 'I=4'); %,'fontsize',20


%% -----------------------------------------------
left=9;
bottom=49;
width=1350;
height=636;
hf=figure('position', [left bottom width height]);
%hz=load('balist data2.txt','-ascii');
%plot(hz(find(hz(:,1)<0.389),1)-0.01,hz(find(hz(:,1)<0.389),2)/1000,'-k','LineWidth',2.9);
%hz2=hz(find(hz(:,1)>0.01),1); hz2=[-hz2(end:-1:1,1) hz2(end:-1:1,2); hz2];
plot(hz2(find(abs(hz2(:,1))<0.389),1),hz2(find(abs(hz2(:,1))<0.389),2)/1000,'-k','LineWidth',2.9);
%plot(hz2(:,1),hz2(:,2)/1000,'-k','LineWidth',2.9);
grid on
set(gca,'fontsize',30)
xlim([-0.778/2 0.778/2]); ylim([0 35]);
% ylabel('H, кј/м','fontsize',30);xlabel(' z, м','fontsize',30);
%ylabel('H, кј/м','fontsize',30);xlabel(' z, м','fontsize',30);
%set(hf, 'callback','Color','w');
set(hf,'Color','w');
hold on
plot([-0.5 0.5],[31.5 31.5],'--k','LineWidth',2.9);

%% -----------------------------------------------
function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig   -- !!!!!!!!!!!!!!!!!!!!!---------------просто тренировалс€ в  интерфейсе
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 17-Jun-2018 11:14:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function density_CreateFcn(hObject, eventdata, handles)
% hObject    handle to density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function density_Callback(hObject, eventdata, handles)
% hObject    handle to density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of density as text
%        str2double(get(hObject,'String')) returns contents of density as a double
density = str2double(get(hObject, 'String'));
if isnan(density)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new density value
handles.metricdata.density = density;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function volume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function volume_Callback(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of volume as text
%        str2double(get(hObject,'String')) returns contents of volume as a double
volume = str2double(get(hObject, 'String'));
if isnan(volume)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new volume value
handles.metricdata.volume = volume;
guidata(hObject,handles)

% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mass = handles.metricdata.density * handles.metricdata.volume;
set(handles.mass, 'String', mass);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_gui(gcbf, handles, true);

% --- Executes when selected object changed in unitgroup.
function unitgroup_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in unitgroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (hObject == handles.english)
    set(handles.text4, 'String', 'lb/cu.in');
    set(handles.text5, 'String', 'cu.in');
    set(handles.text6, 'String', 'lb');
else
    set(handles.text4, 'String', 'kg/cu.m');
    set(handles.text5, 'String', 'cu.m');
    set(handles.text6, 'String', 'kg');
end

% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.metricdata.density = 0;
handles.metricdata.volume  = 0;

set(handles.density, 'String', handles.metricdata.density);
set(handles.volume,  'String', handles.metricdata.volume);
set(handles.mass, 'String', 0);

set(handles.unitgroup, 'SelectedObject', handles.english);

set(handles.text4, 'String', 'lb/cu.in');
set(handles.text5, 'String', 'cu.in');
set(handles.text6, 'String', 'lb');

% Update handles structure
guidata(handles.figure1, handles);


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%%  --------------------- приближение
  left=9;
    bottom=49;
    width=1350;
    height=636;
ff4=figure('position', [left bottom width height]);


set(gca,'fontsize',30)
%modelfun = @(b,ld)(b*ld);
% modelfun = @(b,ld) (exp(-b(1)*(ld).^b(2)));
modelfun = @(b,ld) ((-(ld).^b(1))/log(10));
% b = [1;3;2];
% x = exprnd(2,100,1);
% y = modelfun(b,x) + normrnd(0,0.9,100,1);
% opts = statset('nlinfit');
% opts.RobustWgtFun = 'bisquare';
powld=0.75;
beta0 = [0.5];
[beta,R,J,CovB,MSE,ErrorModelInfo] = nlinfit(ld(end-4:end),log10(nraz(end-4:end)),modelfun,beta0)

%plot(sqrt(ld(end-4:end)),log10(nraz(end-4:end)),'sr-'); hold on
%plot([0 sqrt(ld(end-4:end))],[0 sqrt(ld(end-4:end))]*beta,'dk-')
% nlinfit(x,y,FUN,beta0);
% plot(x,y,'om'); hold on
% plot(x,modelfun(beta,x),'ob');
plot((0:ld(2)/10:ld(2)), (modelfun(beta,(0:ld(2)/10:ld(2)))),'pk--','MarkerSize',9,'LineWidth',2); %.^beta(1)
%xlim([0 (ld(2))]);

grid minor
set(gca,'GridLineStyle','-')
 hold on
plot(ld(end-4:end),log10(nraz(end-4:end)),'s-b','MarkerSize',9,'LineWidth',2.5)  %semilogy
ylabel('N','fontsize',30)
xlabel('  (L/d)\^(3/4)            ','fontsize',30)
%(n)= exp(-k*sqrt(ld) )
%
%% exploring power 
sumcof=[];
for poww=0.6:0.1:3
    sumcof=[sumcof sum(nraz(end-1:end)-exp(-(ld(end-1:end)).^poww)).^2];
   
    
end
 figure
    plot([0.6:0.1:3],sumcof)
%% ----------- building nraz(ld) for other power
 left=9;
    bottom=49;
    width=1350;
    height=636;
ff4=figure('position', [left bottom width height],'Color','w');

%  hold on
powltod=1;
lelntod=length(nrazld);
for nn=1:length(nrazld)
    semilogy((nrazld{nn}(1,:)).^powltod,nrazld{nn}(2,:),'s-','MarkerSize',9,'LineWidth',2.5,'color',... %sqrt(ld)
[rem(nn*1,lelntod)/lelntod rem(nn*1+5,lelntod)/lelntod rem(nn*1+7,lelntod)/lelntod],'Marker',mark(fix(rem(nn,8)+1)));

hold on

end
xlabel(['  (L/d)^{', num2str(powltod) '}'],'fontsize',30);
  ylabel('N','fontsize',30)
  legend(legnld,'location', 'northeast');
grid minor
grid on
set(gca,'GridLineStyle','-','fontsize',30)
xlim([0 max(nrazld{nn}(1,:)).^powltod]);

%%  finding coefficient for aproximating formula

modelfun2 = @(b,ld) ((-b(2)*(ld).^b(1))/log(10));
modelfun1 = @(b,ld) ((-(ld).^b(1))/log(10));
% b = [1;3;2];
% x = exprnd(2,100,1);
% y = modelfun(b,x) + normrnd(0,0.9,100,1);
% opts = statset('nlinfit');
% opts.RobustWgtFun = 'bisquare';
powld=0.75;
beta01 = [0.3];
beta02 = [0.3 1];
vecbeta=[];
vecbeta2=[];
for nn=1:length(nrazld)
    beta1 = nlinfit(nrazld{nn}(1,end-4:end),log10(nrazld{nn}(2,end-4:end)),modelfun1,beta01)
        beta2 = nlinfit(nrazld{nn}(1,end-4:end),log10(nrazld{nn}(2,end-4:end)),modelfun2,beta02)

    vecbeta=[vecbeta; beta1];
    plot(nrazld{nn}(1,1:end-1), 10.^(modelfun1(beta1,nrazld{nn}(1,1:end-1))),'pk--','MarkerSize',9,'LineWidth',2,...
        'color',[rem(nn*1,lelntod)/lelntod rem(nn*1+5,lelntod)/lelntod rem(nn*1+7,lelntod)/lelntod]); %.^beta(1)
 vecbeta2=[vecbeta2; beta2];
end
%   semilogy(haxnld,sqrt(nrazld{5}(1,:)),nrazld{5}(2,:),'s-','MarkerSize',9,'LineWidth',2.5,'color',... %sqrt(ld)
% [rem(I*6,21)/21 rem(I*1+5,21)/21 rem(I*1+7,21)/21],'Parent',haxnld);
aldat(7).data(12:16)=aldat(8).data(1:5);
%}

%% ------------------ solve of linear equations
x=[1:5]
y=[5 4 3.5 3.2 3.1]
xv=1./(x.^2)
sum_xv=sum(xv)
sum_y=sum(y)
sum_xv2=sum(xv.^2)
sum_xvy=sum(xv.*y)
sum_xv3=sum(xv.^3)
sum_xv4=sum(xv.^4)
sum_xv6=sum(xv.^6)
sum_xv3y=sum((xv.^3).*y)

a=[5 sum(xv); sum(xv) sum(xv.^2)]
b=[sum(y); sum(xv.*y)]
% a=[4 sum(xv) sum(xv.^3);sum(xv) sum(xv.^2) sum(xv.^4); sum(xv.^3) sum(xv.^4) sum(xv.^6)]
% b=[sum(y); sum(xv.*y); sum((xv.^3).*y)]
% 
resul=linsolve(a,b)
%yt=resul(1)+resul(2)*xv+resul(3)*xv.^3 
yt=resul(1)+resul(2)*xv
 plot(x,y,'pk-',x,yt,'ob-')
 
 %% ------------------ additional grafik for gfafik-mat
 vv=xlsread('C:/Users/Ramzes 1/Documents/octava/hard example2.xlsx',13, 'a3:b8'); 
Bvv=(vv(:,2)*4e-6)/(10*pi*0.0138^2)/1.05;
    HfromIvv=Bosn*vv(:,1)/mu0;
    plot(hax1,HfromIvv/1000,Bvv,'--ob')