function y=McSearch2(Freq, p, T1, c1, c2, N)
% change logarithm to account for narrowings
rng("shuffle");
%warning('off','all');
parfevalOnAll(@warning,0,'off','all')
warning; 
z=ThVsExp2(Freq, p, T1, c1, c2, 0);
disp('Initial deviation');
D=3.335*10^(-30);
disp([p/D T1*10^6 c1 c2]); 
disp(z.Dev); 
Dev=z.Dev; 
ii=0; 
while ii <N
    Eta=1+rand(4, 1)/4-0.125; 
    pn=p*Eta(1); T1n=T1*Eta(2); 
    c1n=c1; 
    c2n=c2*Eta(4); 
    zn=ThVsExp2(Freq, pn, T1n, c1n, c2n, 0);
    disp(ii);
    if zn.Dev<z.Dev
        p=pn; T1=T1n; c1=c1n; c2=c2n; 
        disp('Current deviation');
        disp([p/D T1*10^6 c1 c2]); 
        disp(zn.Dev);
        Dev=zn.Dev;
        z=zn; 
        z.Dev=Dev; 
    end
    ii=ii+1; 
end
y.Dev=Dev;
y.p=p; y.T1=T1; y.c1=c1; y.c2=c2; 
y.z=z; 
end



