function y=PopDiffWeak(A, DE, v, E0, D0)
    Epl=E0+DE; Dpl=sqrt(Epl^2-D0^2); 
    Phpl=(Epl*Dpl/2+D0^2*log(Epl+Dpl)/2); 
    Emin=E0-DE; 
    if Emin>=D0
        Dmin=sqrt(Emin^2-D0^2);
        Phmin=(Emin*Dmin/2+D0^2*log(Emin+Dmin)/2);
    else 
        Dmin=0; 
        Phmin=0;
%        disp('Privet!');
    end
%    Phmin=(Emin*Dmin/2+log(Emin+Dmin)/2);
    D=sqrt(E0^2-D0^2);
    Ph0=E0*D/2+D0^2*log(E0+D)/2; 
    if Emin>=D0
       PopInv=D0*exp(-A*(Ph0-Phmin)/v)/(Emin*Dmin)-D0*exp(-A*(Phpl-Ph0)/v)/(Epl*Dpl);  
    else
       PopInv=-D0*exp(-A*Phpl/v+A*Ph0/v)/(Epl*Dpl);  
    end
    y=PopInv; 
end