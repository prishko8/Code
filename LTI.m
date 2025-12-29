function yy = LTI(tmin, tmax, Om, k1, k2, v)
    tmin=tmin;
    tmax=tmax;
    ks = k1/2+k2;
    Om1=Om/sqrt(v);
    k11=k1/sqrt(v);
    k21=k2/sqrt(v);
    tmin1=tmin*sqrt(v);
    tmax1=tmax*sqrt(v);
    function dy=LZ(t, y)
        dy = zeros(4,1);
        dy(1) = -ks*y(1)+v*t*y(2);
        dy(2) = -ks*y(2)-v*t*y(1)+Om*y(3);
        dy(3) = -Om*y(2)-k1*(y(3)-1);
        dy(4) = -k1*(y(3)-1);
    end
    function y0=Y0(om,kk,tt)
        y0 = zeros(4,1);
        D = (kk^2+2*om^2+4*tt^2);
        y0(1) = (om.*tt.*4)./D;
        y0(2) = (kk.*om.*2)./D;
        y0(3) = (kk.^2+tt.^2.*4.0)./D;
        y0(4) = kk*om^2*atan(2*tt/sqrt(kk^2+2*om^2))/sqrt(kk^2+2*om^2);
    end
    Init = Y0(Om1,k11,tmin1);
    %disp(Init);
    %disp([Om k1 v]);
    options = odeset('RelTol',1e-6,'AbsTol',[1e-6 1e-6 1e-6 1e-6]);
    [T,Y] = ode45(@LZ,[tmin tmax],[Init(1) Init(2) Init(3) 0], options);
    dmin = Y0(Om1,k11,tmin1)-Y0(Om1,k11,-1e15);
    dmax = Y0(Om1,k11,1e15)-Y0(Om1,k11,tmax1);
    dd = Y0(Om1,k11,tmin1)-Y0(Om1,k11,tmax1);
    DD = Y0(Om1,k11,1e15)-Y0(Om1,k11,-1e15);
    LT = Y(end, 4)+dmin(4)+dmax(4);
    yy.res=v*LT;
    yy.T=T;
    yy.Y=Y;
    yy.dd = -dd(4);
    yy.DD = DD(4);
    yy.ex = pi*k1*Om^2/sqrt(k1^2+2*Om^2);    
    yy.dmin = dmin(4);
    yy.dmax = dmax(4);    
end
