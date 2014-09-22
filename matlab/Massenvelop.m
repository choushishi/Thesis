function O=Massenvelop(EJ,l,min,max,c,zeta)

dm = 100;
m = [min:dm:max]';

if EJ<1
    EJ = 100000*l^2/(48*EJ);
end

for i=1:length(m)
    maxres(:,i) = fogtest(EJ,l,m(i,1),c,zeta);

end


namedef = strcat('medef','EJ',int2str(EJ),'L',int2str(l),'c',int2str(c),'min',int2str(min),'max',int2str(max),'.tikz')
nameacc = strcat('meacc','EJ',int2str(EJ),'L',int2str(l),'c',int2str(c),'min',int2str(min),'max',int2str(max),'.tikz')


figure(1)
plot(m,maxres(1,:))
title(strcat('MassEnvelop def from',int2str(min),' to ', int2str(max)));
%matlab2tikz(namedef, 'height', '\figureheight', 'width', '\figurewidth','showInfo', false);

figure(2)
plot(m,maxres(2,:))
title(strcat('MassEnvelop acc from',int2str(min),' to ', int2str(max)));
%matlab2tikz(nameacc, 'height', '\figureheight', 'width', '\figurewidth','showInfo', false);