figure
grid on
hold on
load H_NL
load H_L
load H_FZ
plot(t, y1(:,1), '-red', t, y2(:,1),'-magenta', t, y3(:,1),'-blue');
title('Simula��o H1');
legend('N�o Linear','Linear','Fuzzy TS');
ylabel('Altura (cm)');
xlabel('Tempo (s)');

figure
grid on
hold on
plot(t, y1(:,2), '-red', t, y2(:,2),'-magenta', t, y3(:,2),'-blue');
title('Simula��o H2');
legend('N�o Linear','Linear','Fuzzy TS');
ylabel('Altura (cm)');
xlabel('Tempo (s)');