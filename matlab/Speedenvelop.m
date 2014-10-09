function O=Speedenvelop(EJ,l,mu,min,max,zeta)

dv = 0.2;
v = [min:dv:max]';

for i=1:length(v)
    maxres(:,i) = fog(EJ,l,mu,v(i,1),zeta);
    speed = v(i,1);
end


% figure('name','speed_envolop');
% plot(v,maxres);

namedef = strcat('spedef','EJ',int2str(EJ),'L',int2str(l),'min',int2str(min),'max',int2str(max),'mu',int2str(mu),'.tikz')
nameacc = strcat('speacc','EJ',int2str(EJ),'L',int2str(l),'min',int2str(min),'max',int2str(max),'mu',int2str(mu),'.tikz')
nameaco = strcat('speaco','EJ',int2str(EJ),'L',int2str(l),'min',int2str(min),'max',int2str(max),'mu',int2str(mu),'.tikz')


figure(1)
plot(v,maxres(1,:))
title(strcat('SpeedEnvelop def from',int2str(min),' to ', int2str(max)));
matlab2tikz(namedef, 'height', '\figureheight', 'width', '\figurewidth','showInfo', false);


figure(2)
plot(v,maxres(2,:))
title(strcat('SpeedEnvelop acc from',int2str(min),' to ', int2str(max)));
%matlab2tikz(nameacc, 'height', '\figureheight', 'width', '\figurewidth','showInfo', false);

figure(3)
plot(v,maxres(3,:))
title(strcat('SpeedEnvelop dc from',int2str(min),' to ', int2str(max)));
%matlab2tikz(nameaco, 'height', '\figureheight', 'width', '\figurewidth','showInfo', false);