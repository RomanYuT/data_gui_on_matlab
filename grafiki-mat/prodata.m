 function prodata
 % vybor data dlya grafikov
 changdata
 global hButl hBut2 hBut3 hBut4 hBut5 hBut6 hbo isobr nam

         nam = get(hBut4,'Value');
         nafi=num2str(nam);

 
 hF1 = figure('Name', ['svoistva obrazca' nafi],...
'Color',[0.7,0.7,0.7],'Position',[200,50,900,450],'Resize','off');

 hbo = uicontrol(hF1,'Style','checkbox','Position',[280,230,50,50],...
 'BackgroundColor',[0,0.9,0],'string','no');
 
 hBu2=uicontrol(hF1,'Style','pushbutton','String',' save and exit','Position',...
[320,40,170,70],'BackgroundColor',[1,1,1],'Callback','saiex');


 %isobr(nam)=0;
 
isobr(nam) = get(hbo,'Value');
get(hbo,'Value');


 
     %   val = source.Value;
        % For R2014a and earlier: 
        % val = get(source,'Value');
        % maps = get(source,'String'); 

%        newmap = maps{val};
%        colormap(newmap);
    end