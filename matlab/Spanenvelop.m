function O=Spanenvelop(min,max)

dl = 2;
l = [min:dl:max]';

for i=1:length(l)
    maxres(:,i) = fog(8e10,l(i,1),4000,5,0.005);
    stiff = l(i,1);
end



figure('name','span_envolop');
plot(l,maxres(1,:));