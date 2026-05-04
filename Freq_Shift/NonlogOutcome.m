function y=NonlogOutcome(v, A, E0, x, Om, t)
    DeltaIn=E0*sqrt(1-x.^2);
 %   Delta=@(t) DeltaIn+v*t; E=@(t) sqrt((DeltaIn+v*t).*(DeltaIn+v*t)+E0^2*x^2); 
 %   Omm=@(t) Om*E0*x./E(t); 
%    Exp1=@(t) 0.5*A*x^2*(Delta(t).*E(t)-DeltaIn*E0)/(v*E0);
 %   Exp2=@(t) (0.5*A*x^4*E0/v)*log((E(t)+Delta(t))/(E0+DeltaIn));
 %   fun1=@(t) exp(-Exp1(t)-Exp2(t))./sqrt((E(t)-E0).*(E(t)-E0)+Omm^2); 
    y=v*x.*exp(-0.5*A*x.^2.*abs(((E0*sqrt(1-x.^2)+v*t).*sqrt((E0*sqrt(1-x.^2)+v*t).*(E0*sqrt(1-x.^2)+v*t)+E0^2*x.^2)-E0*sqrt(1-x.^2)*E0)/(abs(v)*E0))+x.^2.*log(((E0*sqrt(1-x.^2)+v*t)+sqrt((E0*sqrt(1-x.^2)+v*t).*(E0*sqrt(1-x.^2)+v*t)+E0^2*x.^2))./((E0*sqrt(1-x.^2)+E0))))./sqrt((sqrt((E0*sqrt(1-x.^2)+v*t).^2+E0^2*x.^2)-E0).^2+Om^2*x.^2./((sqrt(1-x.^2)+v*t/E0).^2+x.^2)).*1./((sqrt(1-x.^2)+v*t/E0).^2+x.^2); 
   % y=fun1(5); 
end