function y=IntegrandFrSh(D, D0, OmRm, x, A, vm, E0)  % Theta=0
%PopDiff(OmR, D0, E, E0, A, v)
%N1=max(size(D)); N2=max(size(D0));
sz=size(D);
%Matr=zeros(N1, N2);
Matr=zeros(sz(1), sz(2));
% disp(sz);
% disp([size(D), size(D0)]); 
for ii=1:sz(1)
    for jj=1:sz(2)
        E=sqrt(D(ii, jj)^2+D0(ii, jj)^2);
        OmR=OmRm*D0(ii, jj)*x/E; v=vm*x; T1=1/(A*E*D0(ii, jj)^2); 
        Matr(ii, jj)=PopDiff(OmR, D0(ii, jj), E, E0, A, v)*(E-E0)*D0(ii, jj)/(((E-E0)^2+1/T1^2)*E^2); 
    end
end
y=Matr; 
end