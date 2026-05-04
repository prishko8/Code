function y=IntegrandFrShA1(E, Ph, OmRm, x, A, vm, E0)  % Theta=0
%PopDiff(OmR, D0, E, E0, A, v)
%N1=max(size(D)); N2=max(size(D0));
sz=size(E);
%Matr=zeros(N1, N2);
Matr=zeros(sz(1), sz(2));
% disp(sz);
% disp([size(D), size(D0)]); 
for ii=1:sz(1)
    for jj=1:sz(2)
        EE=E(ii, jj); D0=EE*sin(Ph(ii, jj)); 
%        E=sqrt(D(ii, jj)^2+D0(ii, jj)^2);
        OmR=OmRm*D0*x(ii, jj)/EE; v=vm*x(ii, jj); T1=1/(A*EE*D0^2); 
        Matr(ii, jj)=x(ii, jj)^2*PopDiff(OmR, D0, EE, E0, A, v)*(EE-E0)*D0/(((EE-E0)^2+1/T1^2)*EE); 
    end
end
y=Matr; 
end