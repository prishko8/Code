function y=FreqShiftFs(p, Fmw, DerFb, A, E0, N)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% p - dipole moment of TLSs in Debye 
% Fmw - microwave field amplitude V/m
% DerFb - time derivative of bias field 
% I assumed that bias and microwave fields are parallel to each other
% A - proportionality cofficient for relaxation rate 1/T1=A*E*Delta_0^2, 10^8 s^-1 K^-3=10^(-3) KK^-3, 
% Integrates frequency shift over angles N - number of integration steps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Outcome y - Frequency shift divided by TLS density of states P0 (I guess)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hbar=1.054571817*10^(-34);
De=3.33564*10^(-30);
Conv=De/hbar; 
Om=Fmw*p*Conv;  
vm=DerFb*2*p*Conv; 
AA=FrShftThet1(Om, 1/(2*N):1/N:(1-1/(2*N)), A, vm, E0); 
y=sum(AA)/N; 