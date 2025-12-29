function f=IntThis(xx,yy,Om,k1,v,nn)
    r=zeros(length(yy(:,1)),length(xx(1,:)));
    sx = size(xx);
    if length(yy(:,1))==1
        yy=repmat(yy,1,length(xx));
    end
    for j=1:length(yy(:,1))
        for i=1:length(xx(1,:))
            y = yy(j,i);
            x = xx(j,i);
            if or(x==0,y==0)
                r(j,i)=0;
            else
                if x==1
                    r(j,i)=Inf;
                else
                    Om1 = Om*x*y;
                    k11 = k1*x^2;
                    v1 = v*sqrt(1-x^2)*y;
                    r(j,i) = LTA(nn,Om1,k11,0,v1)/(x*sqrt(1-x^2));
                end
            end
        end
    end
    f=r;
end
