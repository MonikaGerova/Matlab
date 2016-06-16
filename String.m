function stringfourier
    clc
    %definirane na promenlivite zadadeni po uslovie
    L=pi;
    a=1;
    tmax=35;
    x=0:L/50:L;
    t=0:tmax/100:tmax;
    % Izchertavane trepteneto na strunata
    for i=1:length(t)
        subplot(4,1,1);
        plot(x,fourier(x,t(i)),'b' ,'LineWidth' ,2)
	    title('Animation')
        axis([0 L -1.5 1.5])
        grid on
        %  Izchertavane na grafikata v moment t=0 
         subplot(4,1,2)
        plot(x,fourier(x,0),'r' ,'LineWidth' ,2)
        title('Moment t=0')
        axis([0 L -1.75 1.75])
        grid on
        % Izchertavane na grafikata v moment t=15
         subplot(4,1,3)
        plot(x,fourier(x,15),'r' ,'LineWidth' ,2)
        title('Moment t=15')
        axis([0 L -1.5 1.5])
        grid on
        % Izchertavane na grafikata v moment t=30
         subplot(4,1,4)
        plot(x,fourier(x,30),'r' ,'LineWidth' ,2)
        title('Moment t=30')
        axis([0 L -1.5 1.5])
        grid on
        M(i)=getframe;
    end
    movie(M,10)
% Definirane na funkciqta na furie
    function y=fourier(x,t)
        y=0;
        for k=1:28
             Xk=cos((2*k+1)*pi*x/(2*L));
             Tk=A(k)*cos(a*(2*k+1)*pi*t/(2*L))+B(k)*sin(a*(2*k+1)*pi*t/(2*L));
            y=y+Xk.*Tk;
            a=A(k)
            b=B(k)
        end
    end
 
    %definirane na koeficientite
    function y=A(k)
        Xk=cos((2*k+1)*pi*x/(2*L));
        y=2*trapz(x,phi(x).*Xk)/L;
    end
 
    function y=B(k)
        Xk=cos((2*k+1)*pi*x/(2*L));
        y=4*trapz(x,psi(x).*Xk)/(a*(2*k+1)*pi);
    end
    % Definirane na funkciqta na phi
    function y=phi(x)
        for j=1:length(x)
                y(j)=cos(x(j)/2);
        end
    end
    % Definirane na funkciqta na psi
    function y=psi(x)
        y=x.*sin(x);
    end
end
