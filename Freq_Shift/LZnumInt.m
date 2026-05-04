function y=LZnumInt(Om, om0, E, v, T1, ti, D0, x)
%disp(size(D0));
%disp(size(x)); 
% E>D0 
% ti can be defined by the experiment, e. g. -10 T1 or -om0/v or so 
    sz=size(D0); %N2=max(size(x)); 
    Arr=zeros(sz); 
    for ii=1:sz(1)
        for jj=1:sz(2)
            Oma=Om*x(ii, jj); 
            va=v*x(ii, jj); 
            Arr(ii, jj)=x(ii, jj)^2*D0(ii, jj)*LZnum(Oma, om0, E, D0(ii, jj), va, T1, ti)/(E*sqrt(E^2-D0(ii, jj)^2)); 
        end
    end
    y=Arr; 
end