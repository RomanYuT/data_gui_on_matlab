
%function vihodgraf
global hF hbo isobr singlgraf hEd3 isobrb istyp...
    lastcurr allhf
cd('C:\Users\Ramzes 1\Documents\octava\grafiki-mat');
% �������� ���� ����
singlgraf=get(hEd3 ,'Value');
lastcurr=get(hBut5,'Value'); % ����� ���������� ���� ��� ����������� lastcurr=6;
save('grafsetting.mat','isobr','isobrb','singlgraf','istyp','lastcurr','iscurr','numtlibo');  % ������� ���������� ���������� ����� ������ ����������
close(allhf(ishghandle(allhf)))