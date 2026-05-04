function y=PopDiffWeakVect(A, DE, v, E0, D0)
Z=zeros(size(D0)); 
for ii=1:max(size(D0))
    Z(ii)=PopDiffWeak(A, DE, v, E0, D0(ii)); 
end
y=Z; 