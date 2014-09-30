function O=fogtest(EJ,l,mu,c,zeta)

if EJ<1
    EJ = 100000*l^2/(48*EJ);
end

omega1 = pi^2/l^2*sqrt(EJ/mu);
omega = pi*c/l;
omegab = zeta*sqrt(EJ/mu);
omegab = 0.5*zeta*omega1;
% omegab = omega1*sqrt(1-zeta^2)
omega1a = sqrt(abs(omega1^2-omegab^2));
Omega = 2*pi*c/10;

r1 = Omega + omega;
r2 = Omega - omega;

% if c >= (200/3.6) 
%     Q = 3.10*(c*3.6)^0.7495;
% end
% 
% if c >= (120/3.6) && c < (200/3.6)
%     Q = 3.58*(c*3.6)^0.7495;
% end
% 
% if c < (120/3.6)
%     Q = 5.2064*(c*3.6)^0.7495;
% end

% Q = Q;
% Q = 10000
Q = 1928*c^0.7495;
f = omega1/(2*pi);
v_0 = Q*l^3/(48*EJ);
%omegab = 0.0001*sqrt(EJ/mu);

beta = omegab/omega1;

v1 = @(t) l^3*Q*omega1/(pi^4*EJ) * cos(omega1*t)/(omega^2+omegab^2);
v2 = @(t)omega*(cos(omega*t)-exp(-omegab*t))-omegab*sin(omega*t);
v = @(t) v1(t) * v2(t);

% v11 = 1/((omega1^2-r2^2)^2+4*omegab^2*r2^2);
% v12 = @(t) (omega1^2-r2^2)*(cos(r2*t)-exp(-omegab*t)*cos(omega1a*t));
% v13 = @(t) 2*omegab*r2*sin(r2*t);
% v14 = @(t) -omegab/omega1a*(omega1^2+r2^2)*exp(-omegab*t)*sin(omega1a*t);
% v21 = -1/((omega1^2-r1^2)^2+4*omegab^2*r1^2);
% v22 = @(t) (omega1^2-r1^2)*(cos(r1*t)-exp(-omegab*t)*cos(omega1a*t));
% v23 = @(t) 2*omegab*r1*sin(r1*t);
% v24 = @(t) -omegab/omega1a*(omega1^2+r1^2)*exp(-omegab*t)*sin(omega1a*t);
% v = @(t) Q/(mu*l)*(v11*(v12(t)+v13(t)+v14(t))+v21*(v22(t)+v23(t)+v24(t)));




a11 = @(t) -l^3*Q*omega1^3*cos(omega1*t)/(pi^4*EJ*(omega^2+omegab^2));
a12 = @(t) omega*(cos(omega*t)-exp(-omegab*t))-omegab*sin(omega*t);
a21 = @(t) l^3*Q*omega1*cos(omega1*t)/(pi^4*EJ*(omega^2+omegab^2));
a221 = @(t) omega*(-cos(omega*t)*omega^2-exp(-omegab*t)*omegab^2);
a222 = @(t) omegab*sin(omega*t)*omega^2;
a22 = @(t) a221(t)+a222(t);
a31 = @(t) -2*l^3*Q*omega1^2*sin(omega1*t)/(pi^4*EJ*(omega^2+omegab^2));
a32 = @(t) omega*(-sin(omega*t)+exp(-omegab*t)*omegab)-omegab*cos(omega*t)*omega;
a = @(t) a11(t)*a12(t)+a21(t)*a22(t)+a31(t)*a32(t);


maxt = l/c;
dt = maxt/1000;
tdomain = [0:dt:maxt]';

for i=1:length(tdomain)
    p(i,1) = v(tdomain(i,1));
    p(i,2) = a(tdomain(i,1));
    p(i,3) = p(i,1)/v_0;
end

O = [max(abs(p(:,1))),max(abs(p(:,2))),max(abs(p(:,3)))];

namedaf = strcat('EJ',int2str(EJ),'L',int2str(l),'mu',int2str(mu),'c',int2str(c),'daf','.tikz');
% % 
figure(1)
plot(tdomain,p(:,1))
% grid on
% title(strcat('Max Deflection:',mat2str(O(1,1))));
% % % matlab2tikz(namedef, 'height', '\figureheight', 'width', '\figurewidth','showInfo', false);
% % % 
% figure(2)
% plot(tdomain,p(:,2))
% grid on
% title(strcat('Max Acceleration:',mat2str(O(1,2))));
% % % matlab2tikz(nameacc, 'height', '\figureheight', 'width', '\figurewidth','showInfo', false);
% % % 
% figure(3)
% plot(tdomain,p(:,3))
% grid on
% title(strcat('Max Deflection:',mat2str(O(1,1)),',Max Acceleration:',mat2str(O(1,2))));
% matlab2tikz(namedaf, 'height', '\figureheight', 'width', '\figurewidth','showInfo', false);
