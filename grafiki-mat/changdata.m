% change data dlya grafikov with chekbox

global hF hbo isobr numobr hcheb hchebbal hchebmag isbalist...
    hcheb2 hchebg2 isobrb


%isobr =  cell2mat(get(hcheb,'Value'));

%isobr(find(hcheb==gcbo ()))=0;
%find(hcheb==gcbo ())
gcbo ();

if (gcbo ()==hchebg(1))||(gcbo ()==hchebg(2))
  if (gcbo ()==hchebg(1)) % button for all balist obr(first type)
    set(hcheb(find(isbalist)),'Value',get(gcbo (),'Value'))
    isobr(find(isbalist))=get(gcbo (),'Value');
    istyp(1)=get(gcbo (),'Value');
  else
    set(hcheb(find(isbalist==0)),'Value',get(gcbo (),'Value')) % button for all magnitom obr(second type)
    isobr(find(isbalist==0))=get(gcbo (),'Value');
    istyp(2)=get(gcbo (),'Value');
  end
elseif ~isempty(find(hcheb==gcbo ())) % button for once obr(first or second type)
  isobr(find(hcheb==gcbo ()))=get(gcbo (),'Value');
  
  %% -------- 3 и послед типы:
elseif ~isempty(find(hchebg2==gcbo ()))  
    nomtip=(find(hchebg2==gcbo ()));
    %nomobr=find(hcheb2{nomtip}==gcbo ());
     isobrb{nomtip}(:)=get(gcbo (),'Value');
         set(hcheb2{nomtip}(:),'Value',get(gcbo (),'Value'))
         
elseif  ~isempty(find(gcbo ()==hchebcurr))
        iscurr(find(gcbo ()==hchebcurr))=get(gcbo (),'Value');

else
    nomtip=(~cellfun('isempty',cellfun(@(pp) find(pp==gcbo ()), hcheb2,'UniformOutput',0)));
    nomobr=find(hcheb2{nomtip}==gcbo ());
       isobrb{nomtip}(nomobr)=get(gcbo (),'Value');
    %set(hcheb2{nomtip}(nomobr),'Value',get(gcbo (),'Value'))

end

