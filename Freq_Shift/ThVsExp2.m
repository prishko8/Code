function y=ThVsExp2(Freq, p, T1, c1, c2, Plot)
hbar=1.054571817*10^(-34);
% Freq - array of frequencies to compare data for 
% Get Exp data 
Exp=dlmread('Data5V6Ghz.txt');
% Get fits for zeros 
Ft=dlmread('MeanFreqsV5F6789.txt');
om=Ft(1, 2);
nn=max(size(Freq)); 
num=31; 
Res=zeros(nn*num, 8); 
for ii=1:nn
    in=num*(ii-1); 
    Fr=Freq(ii);
    numm=find(Ft(:)==Fr); 
    nums=find(Exp(:, 3)==Fr); 
    ArrCur=Exp(nums, :);
    numms=find(ArrCur(:, 2)>1); 
    Means=mean(ArrCur(numms(1):(numms(1)+10), 5)); 
    ArrCur=ArrCur((end+1-num):end, :);
 %   disp(numm)
    ArrCur(:, 5)=Means-ArrCur(:, 5);
    ThC=zeros(num, 1); 
    parfor jj=1:num 
        Om=p*sqrt(ArrCur(jj, 7))/hbar; 
        ThC(jj, 1)=SmartFit(Om, ArrCur(jj, 6)*2*p/hbar, T1, om, c1, c2); 
    end
    Res((in+1):(in+num), :)=[ ArrCur ThC];
end
%Optimizing proportionality factor 
zz=Deviate(Res(:, 5), Res(:, 8)); 
Res(:, 8)=Res(:, 8)*zz.Fact; 
y.Dev=zz.Diff; 
y.Fact=zz.Fact;  
y.Res=Res; 
if Plot==1
for ii=1:nn
    In=num*(ii-1)+1; Fin=num*ii;
    semilogx(sqrt(Res(In:Fin, 7)), Res(In:Fin, 5), "o", 'MarkerSize',12); 
    hold on; 
    semilogx(sqrt(Res(In:Fin, 7)), Res(In:Fin, 8)); 
    hold on; 
end
end

%'MeanFreqsV5F6789.txt'