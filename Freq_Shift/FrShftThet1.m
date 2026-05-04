function y=FrShftThet1(Om, z, A, vm, E0)
% The best up to date to evaluate the frequency shift
% Tries E0=1000 (in MHZ)
% vm=0.1 MHZ^2
% A=10^8 
N=max(size(z));
ANS=zeros(size(z));
for ii=1:N
    fun1 = @(x,y) IntegrandFrSh1(x, y, Om, z(ii), A, vm, E0); 
    q1 = integral2(fun1,0,E0, 0, pi/2); 
    fun2 = @(x,y) IntegrandFrSh2(x, y, Om, z(ii), A, vm, E0); 
    q2 = integral2(fun2,E0,inf, 0, E0); 
%    fun = @(x,y) IntegrandFrSh(x, y, Om, z(ii), A, v, E0); 
%    disp([q1 q2]);
    q = q1+q2;
    ANS(ii)=q;  
end
y=sum(ANS)/N;
end