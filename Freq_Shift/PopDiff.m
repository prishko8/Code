function y=PopDiff(OmR, D0, E, E0, A, v)
Pr0=exp(-pi*OmR^2/(2*v));
De=sqrt(E^2-D0^2); 
De0=sqrt(E0^2-D0^2);
if E<E0
    Texp1=(A*D0^2/v)*(-E*De+E0*De0+D0^2*log((E0+De0)/(E+De)))/2; 
    Texp2=(A*D0^2/v)*(E*De+E0*De0+D0^2*log((E0+De0)/(E-De)))/2;
%    disp([Texp1 Texp2]);
    Pex=(1-Pr0)*(exp(-Texp1)+exp(-Texp2))/2; 
    PopDiffT=(-2*Pex)*(E0-E)/sqrt((E0-E)^2+OmR^2); 
%    PopDiffT=(1-2*Pex)*(E0-E)/sqrt((E0-E)^2+OmR^2)-1; 
else
    Texp=(A*D0^2/v)*(E0*De0+E0*De0+D0^2*log((E0+De0)/(E0-De0)))/2;
    Texp1=(A*D0^2/v)*(E*De-E0*De0+D0^2*log((E+De)/(E0+De0)))/2;
%    disp([Texp Texp1]); 
    Pexc=(1-Pr0)*exp(-Texp); 
    Pexc1=Pexc*Pr0+(1-Pexc)*(1-Pr0); 
    Pexcf=(Pexc1*exp(-Texp1))/2;
    PopDiffT=(-2*Pexcf)*(E-E0)/sqrt((E0-E)^2+OmR^2);
%    PopDiffT=(1-2*Pexcf)*(E-E0)/sqrt((E0-E)^2+OmR^2)-1;
end
y=PopDiffT; 
end