function y=LZsol(t, D0, v) % crossing takes place at t=0    vtS^z+D0S^x
%Prefactor definition 
% Delta=alpha t v=alpha epsilon_{12}=D0/2
alpha=v; 
 z=alpha^(1/2)*exp(-1i*pi/4)*t;
 f=D0/2;
 n=1i*f^2/alpha;  
 Gamma=f^2/alpha;  
A=Gamma*exp(-pi*Gamma/4);
wf=A*pvlx(-n-1, 1i*z);
y=1-2*abs(wf)^2;
end

% D_{-n-1}(iz) is the solution (Zener)
% 