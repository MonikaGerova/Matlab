clc; clear
xx=-1:0.1:1
yy=xx;
delta = 1/15;
axis([xx(1), xx(length(xx)),  yy(1), yy(length(yy))])
hold on
for k=1:length(xx)
    for m=1:length(yy)
        plot(xx(k),yy(m),'.')
        dy = exp(xx(k))+2*yy(m);
        eps = delta/sqrt(1+dy^2);
        plot([xx(k)-eps/2,xx(k)+eps/2],[yy(m)-eps*dy/2,yy(m)+eps*dy/2])
    end
end

% integralna kriva (-1,0)
right = @(xx,yy) exp(xx)+2*yy;
[X,Y] = ode45(right,[-1,xx(length(xx))+1],0);
plot(X,Y,'g','LineWidth',2)
[XX,YY] = ode45(right,[-1,xx(1)-1],0);
plot(XX,YY,'g','LineWidth',2) 

%ANALITICHNO integralna kriva (0,0)
syms x;
y=dsolve('Dy-2*y=exp(x)','y(0)=0','x')
y=subs(y,'x',xx) % moje i xx vmesto xxx za cqlata grafika
y=eval(y)
plot(xx,y,'b','LineWidth',2)




