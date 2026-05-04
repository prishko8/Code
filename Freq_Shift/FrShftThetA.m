function y=FrShftThetA(F, A, Fder, E0, P0, p)
% The code evaluates the correction to the frequency 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input parameters F - AC field amplitude (V/m)  (10000) 
% A - relaxation rate of resonant TLS Delta_0=E0 (s^(-1)) (3*10^(5))
% Fder - rate of the electric field change (V/(ms)) 10^10 
% E0 - resonant frequency in inverse seconds (10^(10))
% P0 TLS density of states 1/(Jm^3) (10^(44))
% p - TLS dipole moment in D (1-10)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output: y  the relative correction delta omega/omega
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Fact=3.1630e+04; 
Om=F*p*Fact; 
vm=2*p*Fact*Fder; 
disp([Om^2 vm]); 
A=A/E0^3; 
% rescale A to make it typical relaxation rate
De=3.33564*10^(-30); 
% The best up to date to evaluate the frequency shift
% Tries E0=1000 (in MHZ)
% vm=0.1 MHZ^2
% A=10^8 
% N=max(size(z));
% ANS=zeros(size(z));
% for ii=1:N
    fun1 = @(x,y,z) IntegrandFrShA1(x, y, Om, z, A, vm, E0); 
    q1 = integral3(fun1,0,E0, 0, pi/2, 0, 1); 
    fun2 = @(x,y, z) IntegrandFrShA2(x, y, Om, z, A, vm, E0); 
    q2 = integral3(fun2,E0,inf, 0, E0, 0, 1); 
%    fun = @(x,y) IntegrandFrSh(x, y, Om, z(ii), A, v, E0); 
%    disp([q1 q2]);
    q = q1+q2;
%    ANS(ii)=q;  
%end
y=-q*P0*De^2*p^2*2*pi*9*10^9;
end