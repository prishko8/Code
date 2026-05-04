function y=FrShiftFit(F, p, A, Fbs, nu)
% Inputs 
% F - microwave field in V/m 
% p - dipole moment in Debye units 
% A relaxation rate of two level system with energy and tunneling amplitude
% kB*1K at zero K. For example if the resonance frequency is 5GHz and
% relaxatiojn time is 3 microseconds, then A=2.4088*10^7 
% Fbs is the difference of maximum bias field and minimum bias field in
% V/m
% nu is the inverse time of field change from maximum to minimum 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hbar=1.054571817*10^(-34);
De=3.33564*10^(-30);
Rat=10^4*3.33564/1.054571817;
Om=p*F*Rat; 
vm=2*p*Fbs*nu*Rat; 
E0=2*pi*nu; 
y=FrShftThetA(Om, A, vm, E0); 
end