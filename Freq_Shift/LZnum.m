function y=LZnum(Om, om0, E, D0, v, T1, ti)
% E>D0 
    Delta=sqrt(E^2-D0^2); 
    t1=-Delta/v; 
    t2=Delta/v; 
%    ti=ti+t1; 
    tspan1=[ti t1];
%    v=0; 
%    [t,yy] = ode45(@(tt,y) [-1/(2*T1) sqrt((v*tt)^2+D0^2)-om0 0; -(sqrt((v*tt)^2+D0^2)-om0) -1/(2*T1) -Om*D0/sqrt((v*tt)^2+D0^2); 0 Om*D0/sqrt((v*tt)^2+D0^2) -1/T1]*y+[0; 0; 1/T1], tspan1, [0; 0; 1]);
    options = odeset('RelTol',1e-8);
%    [ta,yya] = ode45(@(tt,yy) [0 sqrt(D0^2+v^2*tt^2)-om0 0; -sqrt(D0^2+v^2*tt^2)+om0 0 -Om*D0/sqrt(D0^2+v^2*tt^2); 0 Om*D0/sqrt(D0^2+v^2*tt^2) 0]*yy+[0; 0; 0], tspan1, [0; 0; 1], options);
    [ta,yya] = ode45(@(tt,yy) [-D0^2/(2*T1*(D0^2+v^2*tt^2)) sqrt(D0^2+v^2*tt^2)-om0 0; -sqrt(D0^2+v^2*tt^2)+om0 -D0^2/(2*T1*(D0^2+v^2*tt^2)) -Om*D0/sqrt(D0^2+v^2*tt^2); 0 Om*D0/sqrt(D0^2+v^2*tt^2) -D0^2/(T1*(D0^2+v^2*tt^2))]*yy+[0; 0; D0^2/(T1*(D0^2+v^2*tt^2))], tspan1, [0; 0; 1], options);
    yy1=yya(end, :); % 1x3
    tspan2=[t1 t2];
 %   disp(yy1); disp(yy1'); 
 %   [tb,yy] = ode45(@(tt,y) [-1/(2*T1) sqrt((v*tt)^2+D0^2)-om0 0; -(sqrt((v*tt)^2+D0^2)-om0) -1/(2*T1) -Om*D0/sqrt((v*tt)^2+D0^2); 0 Om*D0/sqrt((v*tt)^2+D0^2) -1/T1]*y+[0; 0; 1/T1], tspan2, yy1');
 %   [tb,yyb] = ode45(@(tt,yy) [0 sqrt(D0^2+v^2*tt^2)-om0 0; -sqrt(D0^2+v^2*tt^2)+om0 0 -Om*D0/sqrt(D0^2+v^2*tt^2); 0 Om*D0/sqrt(D0^2+v^2*tt^2) 0]*yy+[0; 0; 0], tspan2, yy1', options);
    [tb,yyb] = ode45(@(tt,yy) [-D0^2/(2*T1*(D0^2+v^2*tt^2)) sqrt(D0^2+v^2*tt^2)-om0 0; -sqrt(D0^2+v^2*tt^2)+om0 -D0^2/(2*T1*(D0^2+v^2*tt^2)) -Om*D0/sqrt(D0^2+v^2*tt^2); 0 Om*D0/sqrt(D0^2+v^2*tt^2) -D0^2/(T1*(D0^2+v^2*tt^2))]*yy+[0; 0; D0^2/(T1*(D0^2+v^2*tt^2))], tspan2, yy1', options);
    yy2=yyb(end, :); 
    y=(yy1(3)+yy2(3))/2; 
%    plot([ta; tb], [yya(:, 3); yyb(:, 3)]); 
end