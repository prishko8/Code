function y=MCSearchFrSh(b, c, A, NN, eta, Count, Count1, Nang)
rng('shuffle'); 
z=FrShiftInterp(b, c, A, Count, Count1, Nang);
%disp(b); disp(c); disp(A); disp(z.Diff);
Diff=z.Diff; 
z0=z; 
for ii=1:NN
    b1=b*(1-eta+2*eta*rand(1, 1)); 
    c1=c*(1-eta+2*eta*rand(1, 1)); 
%    d1=d*(1-eta+2*eta*rand(1, 1)); 
    A1=A*(1-eta+2*eta*rand(1, 1));
    z=FrShiftInterp(b1, c1, A1, Count, Count1, Nang);
    dlmwrite('tmp1.txt', ii); 
    if z.Diff<Diff
        b=b1; c=c1;  A=A1; Diff=z.Diff; z0=z; 
%        disp(b); disp(c); disp(A); disp(z.Diff);
        dlmwrite('tmp.txt', [b c A z.Diff], 'precision', 14);
    end
    disp(ii); 
end
y.b=b; y.c=c; y.A=A; y.Diff=Diff; y.z=z0; 
end