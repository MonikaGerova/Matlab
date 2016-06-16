clc;clear;

syms x;
y=dsolve('x*Dy=2*sqrt(y)*cos(x)-2*y','x')

x=pi/2:pi/35:2*pi 
axis([x(1),x(length(x)),0,1])

hold on;

y=dsolve('x*Dy=2*sqrt(y)*cos(x)-2*y','y(pi/2)=2/pi^2','x');
plot(x,eval(y),'y','LineWidth',2); %grafika
plot(pi/2,2/pi^2,'b*','LineWidth',3); %tochka


y=dsolve('x*Dy=2*sqrt(y)*cos(x)-2*y','y(pi/2)=4/pi^2','x');
plot(x,eval(y),'r','LineWidth',2); %grafika
plot(pi/2,4/pi^2,'b*','LineWidth',3); %tochka

