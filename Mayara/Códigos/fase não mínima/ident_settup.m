ti=1000; %instante anterior ao degrau
tf=87280; %tempo final
step=30000;

time = h1_real.time(ti:tf);


h1(:,1) = h1_real.signals.values(1,1,:);
h1(1:step) = h1(step)*ones(step,1);
h1 = h1(ti:tf);
h1 = h1-h1(1);
% figure
% plot(time,h1);
% grid on


h2(:,1) = h2_real.signals.values(1,1,:);
h2(1:step) = h2(step)*ones(step,1);
h2 = h2(ti:tf);
h2 = h2-h2(1);
% figure
% plot(time,h2);
% grid on

h3(:,1) = h3_real.signals.values(1,1,:);
h3(1:step) = h3(step)*ones(step,1);
h3 = h3(ti:tf);
h3 = h3-h3(1);
% figure
% plot(time,h3);
% grid on

h4(:,1) = h4_real.signals.values(1,1,:);
h4(1:step) = h4(step)*ones(step,1);
h4 = h4(ti:tf);
h4 = h4-h4(1);
% figure;
% plot(time,h4);
% grid on

u1(:,1) = u1_real.signals.values(1,1,:);
u1 = u1(ti:tf);
u1 = u1-u1(1);
% figure
% plot(time,u1);
% grid on

u2(:,1) = u2_real.signals.values(1,1,:);
u2 = u2(ti:tf);
u2 = u2-u2(1);
% figure
% plot(time,u2);
% grid on


datah1u1 = iddata(h1,u1,1);
datah2u1 = iddata(h2,u1,1);
datah3u1 = iddata(h3,u1,1);
datah4u1 = iddata(h4,u1,1);


datah1u2 = iddata(h1,u2,1);
datah2u2 = iddata(h2,u2,1);
datah3u2 = iddata(h3,u2,1);
datah4u2 = iddata(h4,u2,1);

clear h1
clear h2
clear h3
clear h4
clear time


