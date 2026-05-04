function y=ThVsRealExp(p, Data, Rt, A, Plot)
%hbar=1.054571817*10^(-34);
% Freq - array of frequencies to compare data for 
% Get Exp data 
% Data contains Data(:, 1)-numbers, 
% Data(:, 2)-numbers of photons 
% Data(:, 3)-bias frequencies
% Data(:, 4) -loss tangents Data(:, 5) - frequencies 
% Data(:, 6) - bias sweep rates Data(:, 7) -fields
% 
% Frequency Shift
% Assume identical bias sweep rates 
%c1=0.052543198392118; c2=0.010763911587285;
c1=0.10561774277717; c2=0.04279693324736;
%disp(c1); 
% Extract Frequency dependence
numm=find(Data(:, 3)==Rt);
Dat=Data(numm, :); 
numm=find(Dat(:, 2)>1);
Dat=Dat(numm, :);
% Finding zeroth frequency and redefine data with respect to it taking
% relative correction 
Freq0=mean(Dat(1:10, 5)); 
Dat(:, 5)=(Dat(:, 5)-Freq0)/Freq0; 
nn=size(Dat, 1); 
ThFit=zeros(nn, 1); 
for ii=1:nn
    ThFit(ii)=-SmartFitExpLowDiss(sqrt(Dat(ii, 7)), Dat(ii, 6), p, A, 2*pi*Freq0, c1, c2)/sqrt(Dat(ii, 7)); 
end

%Optimizing proportionality factor 
%y.Dev=norm(Res(:, 3)-Res(:, 4))/norm(Res(:, 3)); 
zz=Deviate(Dat(:, 5), ThFit); 
y.Fact=zz.Fact;
ThFit=ThFit*zz.Fact; 
y.Dev=zz.Diff; 
%y.Fact=zz.Fact;  
y.Res=[Dat(:, 5) ThFit];
y.Fr0=Freq0; 
y.Dat=Dat; 
if Plot==1 
    semilogx(Dat(:, 2), Dat(:, 5), "o", 'MarkerSize',12); 
    hold on; 
    semilogx(Dat(:, 2), ThFit); 
    hold on; 
end