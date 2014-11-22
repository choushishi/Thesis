function O=Spanenvelop(EJ,min,max,mu,c,zeta)

dl = 2;
l = [min:dl:max]';

for i=1:length(l)
    maxres(:,i) = fogtest(EJ,l(i,1),mu,c,zeta);
    stiff = l(i,1);
end




figure(1)
plot(l,maxres(1,:))
title(strcat('SpanEnvelop def from',int2str(min),' to ', int2str(max)));
%matlab2tikz(namedef, 'height', '\figureheight', 'width', '\figurewidth','showInfo', false);


figure(2)
plot(l,maxres(2,:))
title(strcat('SpanEnvelop acc from',int2str(min),' to ', int2str(max)));
%matlab2tikz(nameacc, 'height', '\figureheight', 'width', '\figurewidth','showInfo', false);

figure(3)
plot(l,maxres(3,:))
title(strcat('SpanEnvelop dc from',int2str(min),' to ', int2str(max)));
%matlab2tikz(nameaco, 'height', '\figureheight', 'width', '\figurewidth','showInfo', false);