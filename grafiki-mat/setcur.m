function setcur
% ������������ ���� � ������
global hEd2 hBut5 curr
set(hEd2,'String',num2str(curr(get(hBut5,'Value'))));
