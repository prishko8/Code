function y=FrShiftInterp(b, c, A, Count, Count1, Nang)
% a - conversion of the expression to the frequency shift
% b - conversion of number of photons to the Rabi frequency 0.3267 (V/m)
% c - conversion of frequency to the bias sweep rate
% d - additional shift
% A - rate of TLS relaxation for all 1K
% E0 - initial frequency 
Data=dlmread('Res_6789_5V.csv');
om0=6.788595*10^9;
E0=4.7992*om0*10^(-11); 
Shifts=(Data(3, :)-om0)/om0;
RabiFr=sqrt(Data(1, :))*b;
Rates=c*Data(4, :); 
N=size(Data, 2); 
ResTh=zeros(N, 1);
for ii=1:N
    ResTh(ii)=-FreqShift(RabiFr(ii), A, Rates(ii), E0, Nang); 
end
OmR=reshape(RabiFr', 43, 5);
ShiftsExp=reshape(Shifts', 43, 5);
ShiftsTh=reshape(ResTh', 43, 5);
RatesTh=reshape(Rates', 43, 5);
ShiftsTh=ShiftsTh-ones(43, 5)*ShiftsTh(1, 1); 
%XX=sum(abs(ShiftsTh.^2), 'all'); YY=sum(ShiftsTh.*ShiftsExp, 'all'); a=YY/XX;
zzz=MatrixFit2(ShiftsExp(Count:end, Count1:end) , ShiftsTh(Count:end, Count1:end));
a=zzz(1); d=zzz(2); 
%semilogx(OmR(:, 1), [ShiftsExp(:, 1) ShiftsTh(:, 1)],OmR(:, 2), [ShiftsExp(:, 2) ShiftsTh(:, 2)], OmR(:, 3), [ShiftsExp(:, 3) ShiftsTh(:, 3)], OmR(:, 4), [ShiftsExp(:, 4) ShiftsTh(:, 4)], OmR(:, 5), [ShiftsExp(:, 5) ShiftsTh(:, 5)]);
y.RatesTh=RatesTh; 
y.ShiftsTh=a*ShiftsTh+d;
y.ShiftsExp=ShiftsExp; 
y.OmR=OmR; 
y.Diff=norm(y.ShiftsExp(Count:end, Count1:end)-y.ShiftsTh(Count:end, Count1:end));
y.a=a; 
y.d=d; 
%semilogx(OmR(:, 1), y.ShiftsTh(:, 1),OmR(:, 2), y.ShiftsTh(:, 2), OmR(:, 3), y.ShiftsTh(:, 3), OmR(:, 4), y.ShiftsTh(:, 4), OmR(:, 5), y.ShiftsTh(:, 5));
%semilogx(OmR(:, 1), [y.ShiftsExp(:, 1) y.ShiftsTh(:, 1)],OmR(:, 2), [y.ShiftsExp(:, 2) y.ShiftsTh(:, 2)], OmR(:, 3), [y.ShiftsExp(:, 3) y.ShiftsTh(:, 3)], OmR(:, 4), [y.ShiftsExp(:, 4) y.ShiftsTh(:, 4)], OmR(:, 5), [y.ShiftsExp(:, 5) y.ShiftsTh(:, 5)]);
end
%FreqShift(Om, A, vm, E0, N)
%Arr(1, :) - numbers of photons
% Nums1=reshape(Data(1, :)', 43, 5);
%Arr(2, :) - loss tangent
%Arr(3, :) - center frequency
% Shifts1=reshape(Data(3, :)', 43, 5);
%Arr(4, :) - bias frequency
%Shifts1(:, 3), Nums1(:, 4), Shifts1(:, 4), Nums1(:, 5), Shifts1(:, 5))
% n100=43; n231=86; n534=129; n1233=172; 