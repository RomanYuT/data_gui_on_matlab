%{
function difuryx;
clear
%a1=1.5;
h=0.1;      
x=0:h:1; y=x;   
n=length(x);
y(1)=2;

for i=1:n-1
    k0=h*f(x(i),y(i));
    k1=h*f(x(i)+h/2,y(i)+k0/2);
    k2=h*f(x(i)+h/2,y(i)+k1/2);
    k3=h*f(x(i)+h/2,y(i)+k2);
    y(i+1)=y(i)+(k0+2*k1+2*k2+k3)/6;
end

yteor=-2*cos(x).^2+cos(x);
plot(x,y,':r',x,yteor,'--k')
hold on

h1=0.05;
x1=0:h1:1;  y1=x1;
for i=1:n-1
    k0=h1*f(x1(i),y1(i));
    k1=h1*f(x1(i)+h1/2,y1(i)+k0/2);
    k2=h1*f(x1(i)+h1/2,y1(i)+k1/2);
    k3=h1*f(x1(i)+h1/2,y1(i)+k2);
    y1(i+1)=y1(i)+(k0+2*k1+2*k2+k3)/6;
end
plot(x1,y1,':ro')
del=abs((y-y(1:2:end))/(2^4-1)

function result=f(x,y);
result=sin(2*x)-y.*tan(x);
%}

%-------------------------------------------
A=zeros(20,20);
A(1,[1 2])=[5 4];
A(18,[17 18])=[3 5];
for i=2:20-3
    A(i,[i-1:i+1])=[3 5 4];
end
A


m(1,[1 2])=[5 4];
m(2,[1:3])=[3 5 4];
m(3,[2:4])=[3 5 4];
m
surf(m)
% U(1,:)=x.*(2*x-0.5);
% U(:,1)=t^2;
% U(:,M)=1.5+2*t;
%     for
%             U(j+1,i)=a1*ht/hx^2*(U(j,i+1)-2*U(j,i-1)+ht*8*sin(t(j+1))*cos(x(i+1))+U(j,i);
%     end
%     end