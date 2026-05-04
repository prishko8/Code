function y=LZnumInt1(Om, om0, E, v, T1, ti, D)
disp(max(size(D)));
%disp(size(D0));
%disp(size(x)); 
% E>D0 
% ti can be defined by the experiment, e. g. -10 T1 or -om0/v or so 
    D0=sqrt(E^2-D.^2); 
    sz=size(D0); %N2=max(size(x)); 
    Arr=zeros(sz); 
    for ii=1:max(sz) 
       Arr(ii)=D0(ii)*LZnum(Om, om0, E, D0(ii), v, T1, ti)/(E^2); 
    end
    y=Arr; 
end