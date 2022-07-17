
%function vihodgraf
global hF hbo isobr singlgraf hEd3 isobrb istyp...
    lastcurr allhf
cd('C:\Users\Ramzes 1\Documents\octava\grafiki-mat');
% закрытие всех окон
singlgraf=get(hEd3 ,'Value');
lastcurr=get(hBut5,'Value'); % номер последнего тока для запоминания lastcurr=6;
save('grafsetting.mat','isobr','isobrb','singlgraf','istyp','lastcurr','iscurr','numtlibo');  % сделать переменную содержащую имена нужных переменных
close(allhf(ishghandle(allhf)))