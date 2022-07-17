function saiex
% выход из проги и в дальнейшем сохранение данных
 global  hbo isobr nam hEd1


isobr(nam) = get(hbo,'Value')
get(hbo,'Value')

set(hEd1,'String',num2str(isobr));


close