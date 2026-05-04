function y=SmartFit(Om, v, T1, om, c1, c2)
    Xi=0.5*pi*Om^2/v;
    Damp=2*pi*om/(v*T1); 
    fun=@(x, xx) 2*log(1+2*pi*om.*sqrt(1-x.^2)./(c1*Om*x.*xx+c2*sqrt(v*xx.*sqrt(1-x.^2))));
    fun1=@(x, xx) exp(-(Damp*x.^2).*(sqrt(1-x.^2)+x.^2.*log(x.^(-1).*(1+sqrt(1-x.^2))))./xx); 
%    fun2=@(x, xx) (1-exp(-Xi*(x.^2).*xx./sqrt(1-x.^2)).^2).*x.*fun(x, xx);
     fun2=@(x, xx) (1-exp(-Xi*(x.^2).*xx./sqrt(1-x.^2)).^2).*fun1(x, xx).*x.*fun(x, xx)./sqrt(1-x.^2);
    y= integral2(fun2,0,1,0, 1);
end