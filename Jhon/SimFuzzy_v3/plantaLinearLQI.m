% NOT working!
function output = plantaLinearLQI()
% UnB, Bras�lia: 26 de novembro de 2014
% Aluno: Jhonantans Moraes Rocha
% Matr�cula: 11/0014090

clear all; clc;
warning off;

% Modelo de controle inicial:

% x(t)' = A*x(t) + Bu*u(t) + Bw*w(t)
% z(t) = Cz*x(t)

% x = [x1; x2]
% u = [u1; u2]
% w = [w1; w2]
% z = [z1; z2]

% x1(t) e x2(t) s�o os n�veis dos tanques
% z1(t) = x1(t) e z2(t) = x2(t) s�o as vari�veis a serem controladas
% Devem seguir as refer�ncias z1ref(t) e z2ref(t), constantes por partes

% u1(t) e u2(t) s�o entradas de controle proporcionais �s vaz�es de
% entrada nos tanques.

% w1(t) e w2(t) varia��es nas vaz�es de entrada ou sa�da nos tanques.

% A = [-0.0251         0    0.0719         0;
%          0   -0.0176         0    0.0508;
%          0         0   -0.0719         0;
%          0         0         0   -0.0508];
% Bu = [0.0833         0;
%          0    0.0628;
%          0    0.0479;
%     0.0312         0];

A = [-0.0251         0    0.0719         0;
         0   -0.0176         0    0.0508;
         0         0   -0.0719         0;
         0         0         0   -0.0508];
Bu = [0.0833         0;
         0    0.0628;
         0    0.0479;
    0.0312         0];

% Bw = [1 0; 0 1];
Cz = [1 0 0 0; 0 1 0 0];

%------ Estado aumentado:
% xi(t)' = z(t) - zref(t) :: novo vetor de estados
% e = [x; xi] = [x1; x2; xi] :: novo vetor de estados

% e(t)' = Aa*e(t) + Bua*u(t) + Bwa*wa(t)
% z(t) = Cza*e(t)

% wa(t) = [w; zref] = [w1; w2; zref]

% Aa = [A 0; C 0]
% Bua = [Bu; 0]
% Bwa = [Bw 0; 0 -I]
% Cza = [Cz 0]

Aa = [A zeros(4,2); -Cz zeros(2)];
Bua = [Bu; zeros(2)];
% Bwa = [Bw zeros(2); zeros(2) -eye(2)];
Cza = [Cz zeros(2)];

% ------ Utilizando o Lema 8 da realimenta��o de estados:
% Toler�ncia
tolerance = 1e-7;

%new LMI system
LMIs = [];

% %create the variables
% Z = sdpvar(2,4,'full');
% 
% % Lyapunov matrix
% % W = sdpvar(6,6,'symmetric');
% mu = sdpvar(1);
% 
% W = sdpvar(4,4,'symmetric');
% LMIs = [LMIs, W>0];
% 
% % % LMIs:
% Q = eye(2);
% R = eye(2);
% T11 = A*W - Bu*Z + W*A' - Z'*Bu';
% T21 = R*Z;
% T31 = Q*Cz*W;
% T22 = -R;
% T32 = zeros(2);
% T33 = -Q;
% LMIs = [LMIs, [T11 T21' T31'; T21 T22 T32'; T31 T32 T33]<0];
% obj = trace(W);

%create the variables
Z = sdpvar(2,6,'full');

% Lyapunov matrix
% W = sdpvar(6,6,'symmetric');
mu = sdpvar(1);

W = sdpvar(6,6,'symmetric');
LMIs = [LMIs, W>0];

% LMIs:
T11 = Aa*W + W*Aa' + Bua*Z + Z'*Bua';
T12 = W*Cza';
T13 = zeros(6);
T22 = -eye(2);
T23 = zeros(2,6);
T33 = -mu*eye(6);
LMIs = [LMIs, [T11 T12 T13; T12' T22 T23; T13' T23' T33]<0];
obj = mu;

% Solving
sol = optimize(LMIs,obj,sdpsettings('verbose',0,'solver','sedumi'));

p=min(checkset(LMIs));

%capturing the solutions (if ones exist)
if p > -tolerance;
    output.feas = 1;
    Z = double(Z);
    W = double(W);
    K = Z*inv(W)
    K1 = K(:,1:4)
    K2 = K(:,5:6)
%     K1 = Z*inv(W)
%     K2 = Z
    display('Done')
else
    display('Error MSG!')
end

% Timing
samp_time = 0.01;
final_time = 50;
tot_samps = final_time/samp_time;
t = 0:samp_time:final_time;

% Getting Reference to Plot
for idx = 1:numel(t)
    v1(idx) = r1(t(idx));
    v2(idx) = r2(t(idx));
end

inputs = [v1' v2'];
Ac = [(A-Bu*K1) Bu*K2; -Cz zeros(2)];
Bc = [zeros(4,2); eye(2)];
% [tv,Hv] = ode15s(@quadtank,t,[h1 h2 h3 h4]);
sys = ss(Ac,Bc,eye(6),0,samp_time)
[y, t] = lsim(sys,inputs,t,[0 0 0 0 0 0]);

figure;
plot(t,y(:,1),'--r');
ylabel('Altura (cm)');
xlabel('Tempo (s)');
figure;
plot(t,y(:,2),'--r');
ylabel('Altura (cm)');
xlabel('Tempo (s)');
figure;
plot(t,y(:,3),'--r');
ylabel('Altura (cm)');
xlabel('Tempo (s)');
figure;
plot(t,y(:,4),'--r');
ylabel('Altura (cm)');
xlabel('Tempo (s)');
figure;
plot(t,y(:,5),'--r');
ylabel('Altura (cm)');
xlabel('Tempo (s)');
figure;
plot(t,y(:,6),'--r');
ylabel('Altura (cm)');
xlabel('Tempo (s)');
% /////////////////////////////////////
% Reference Inputs
% /////////////////////////////////////
function r11 = r1(t)
    r11 = 20;
end
   
function r22 = r2(t)
    r22 = 20;
end

end


