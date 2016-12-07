% load ident_45_45.mat
load results_2.mat
figure
plot(outputs.Time,outputs.Data(:,1),'-b',inputs.Time,inputs.Data(:,1),'--r','LineWidth',2);
title('N�vel H1 - Controlado')
ylabel('Altura (cm)');
xlabel('Tempo (s)');
legend('h1','Ref 1','Location','southeast');
grid on;
figure
plot(outputs.Time,outputs.Data(:,2),'-b',inputs.Time,inputs.Data(:,1),'--r','LineWidth',2);
title('N�vel H2 - Controlado')
ylabel('Altura (cm)');
xlabel('Tempo (s)');
legend('h2','Ref 2','Location','southeast');
grid on;
% figure
% plot(outputs.Time,outputs.Data(:,3),'-b');
% title('N�vel 3')
% grid on;
% figure
% plot(outputs.Time,outputs.Data(:,4),'-b');
% title('N�vel 4')
% grid on;
% outputs.Data(10000,:)
% load simulation_6000_full.mat
% figure;
% plot(outputs.Time,outputs.Data(:,1),'-b');
% title('N�vel 1');
% grid on;
% figure
% plot(outputs.Time,outputs.Data(:,2),'-b');
% title('N�vel 2')
% grid on;
% figure
% plot(outputs.Time,outputs.Data(:,3),'-b');
% title('N�vel 3')
% grid on;
% figure
% plot(outputs.Time,outputs.Data(:,4),'-b');
% title('N�vel 4')
% grid on;
% 
% 
% load sim_full_6000_v3.mat
% figure;
% plot(outputs.Time,outputs.Data(:,1),'-b');
% title('N�vel 1');
% grid on;
% figure
% plot(outputs.Time,outputs.Data(:,2),'-b');
% title('N�vel 2')
% grid on;
% figure
% plot(outputs.Time,outputs.Data(:,3),'-b');
% title('N�vel 3')
% grid on;
% figure
% plot(outputs.Time,outputs.Data(:,4),'-b');
% title('N�vel 4')
% grid on;


% figure
% plot(outputs.Time,outputs.Data(:,1),'-b');
% hold on
% plot(tEst1(inicio:final), yEst1(inicio:final,1),'-r');
% title('H1 Ident1');
% 
% figure
% plot(outputs.Time,outputs.Data(:,2),'-b');
% hold on
% plot(tEst1(inicio:final), yEst1(inicio:final,2),'-r');
% title('H2 Ident2');

% figure
% plot(outputs.Time,outputs.Data(:,1),'-b');
% hold on
% plot(tEst2(inicio:final), yEst2(inicio:final,1),'-r');
% title('H1 Ident1');
% 
% figure
% plot(outputs.Time,outputs.Data(:,2),'-b');
% hold on
% plot(tEst2(inicio:final), yEst2(inicio:final,2),'-r');
% title('H2 Ident2');
% figure
% plot(outputs.Time(inicio:final),outputs.Data(inicio:final,2));
% hold on
% plot(tEst, yEst(:,2));
% title('Tank3');
% 
% figure
% plot(outputs.Time(inicio:final),outputs.Data(inicio:final,3));
% hold on
% plot(tEst, yEst(:,3));
% title('Tank2');
% 
% figure
% plot(outputs.Time(inicio:final),outputs.Data(inicio:final,4));
% hold on
% plot(tEst, yEst(:,4));
% title('Tank1');
