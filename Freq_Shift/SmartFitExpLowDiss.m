function y=SmartFitExpLowDiss(F, Fdot, p, A, om, c1, c2)
    hbar=1.054571817*10^(-34);
    D=3.335*10^(-30);
    Om=F*p*D/hbar;
    v=Fdot*2*p*D/hbar; 
    Xi=0.5*pi*Om^2/v;
    %disp(Xi); 
    Damp=A*om/v; 
    disp(Damp); 
    % x=Delta0/E, x1 = cos(theta)
    fun=@(x, x1) 2*log(1+om.*(1-x.^2)./((c1*Om*x.*x1).^2+(c2*sqrt(v*x1.*sqrt(1-x.^2)).^2)).^(1/2));
    fun1=@(x, x1) exp(-(Damp*x.^2).*(sqrt(1-x.^2)+x.^2.*log(x.^(-1).*(1+sqrt(1-x.^2))))./x1); 
%    fun2=@(x, x1) p*x.*x1.*fun(x, x1)./sqrt(1-x.^2);
    fun2=@(x, x1) p*(1-exp(-Xi*(x.^2).*x1./sqrt(1-x.^2))).^2.*x.*x1.*fun(x, x1)./sqrt(1-x.^2);
%    fun2=@(x) (1-exp(-Xi*(x.^2).*x1/sqrt(1-x.^2))).^2.*fun1(x, x1).*x.*x1.*fun(x, x1)./sqrt(1-x.^2);
    y= integral2(fun2,0,1, 0, 1);
end

% Optimum for no dissipation c1=0.32090059857679; c2=0.015081986927844 
% Make a fitting function depending on p only 
% write comparison program
% write Monte Carlo search 