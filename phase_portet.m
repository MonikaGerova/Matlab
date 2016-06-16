function fazov_portret
    clc;clear;

    A=[-5,1;3,-5];  % koef. pred x i y
    f=[2;1]; % svob. koef pri x. i y.=0 i prehvurleni ot drugata strana

    [u,lambda]=eig(A) % sobstvenite stoinosti na A
    a=-inv(A)*f; % osobena tochka 

    tmax=10;
    x=a(1)-1:0.5:a(1)+1;
    y=a(2)-1:0.5:a(2)+1;

    [X,Y]=meshgrid(x,y);

    P=A(1,1)*X+A(1,2)*Y+f(1);
    Q=A(2,1)*X+A(2,2)*Y+f(2);
    D=sqrt(P.^2+Q.^2);

    hold on;
    axis([-6 4 -4 4])

    % izchertavane na fazov portret
    
    for i=1:length(x)
        for j=1:length(y)
            [T,Z]=ode45(@ff,[a(1),tmax],[X(i,j),Y(i,j)]);
            [T1,Z1]=ode45(@ff,[a(2),-tmax],[X(i,j),Y(i,j)]);
            hold on
            plot(Z(:,1),Z(:,2),Z1(:,1),Z1(:,2))
            axis([a(1)-2,a(1)+2,a(2)-2,a(2)+2])
        end
    end
    
    quiver(X,Y,A(1,1)*X+A(1,2)*Y+f(1),A(2,1)*X+A(2,2)*Y+f(2))
    
  
    % chertaene na tengelcialni vektori

    quiver(X,Y,P./D,Q./D,0.5,'g');
    
    %chertaene na ravnovesnata tochka ( polojenie na ravnovesieto
    plot(a(1),a(2),'r*','LineWidth',1);
    
    function z=ff(t,y)
        z=A*y+f;
    end
      
    % izchertavane na pravite, vurhu koito ima fazovi krivi

     xx=-10:10;
     plot(xx,a(2)+(u(2,1)/u(1,1))*(xx-a(1)),'k','LineWidth',1 )
     plot(xx,a(2)+u(2,2)/u(1,2)*(xx-a(1)),'k','LineWidth',1 )

	 
    %chertaene na vektorno pole (vsichki tangencialni vektori)
    
    x=-10:0.3:10;
    y=x;
    
   % [X,Y] = meshgrid(x,y);
   % P=A(1,1)*X+A(1,2)*Y+f(1);
   % Q=A(2,1)*X+A(2,2)*Y+f(2);
   % D=sqrt(P.^2+Q.^2);
   % quiver(X,Y,P./D,Q./D,0.5,'y');
    
end