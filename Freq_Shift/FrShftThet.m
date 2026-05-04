function y=FrShftThet(Om, z, A, v, E0)
N=max(size(z));
ANS=zeros(size(z));
for ii=1:N
    fun = @(x,y) IntegrandFrSh(x, y, Om, z(ii), A, v, E0); 
    q = integral2(fun,0,3*E0, 0, E0);
    ANS(ii)=q;  
end
y=ANS;
end