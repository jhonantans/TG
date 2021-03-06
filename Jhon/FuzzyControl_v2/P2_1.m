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

A = [-3 2; 4 -5];
Bu = [1 0; 0 1];
Bw = [1 0; 0 1];
Cz = [1 0; 0 1];

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

Aa = [A zeros(2); Cz zeros(2)];
Bua = [Bu; eye(2)];
Bwa = [Bw zeros(2); zeros(2) -eye(2)];
Cza = [Cz zeros(2)];

% ------ Utilizando o Lema 8 da realimenta��o de estados:
% Toler�ncia
tolerance = 1e-7;

%new LMI system
LMIs = [];

%create the variables
Z = sdpvar(2,4,'full');

% Lyapunov matrix
W = sdpvar(4,4,'symmetric');
mu = sdpvar(1);

LMIs = [LMIs, W>0];

% LMIs:
T11 = Aa*W + W*Aa' + Bua*Z + Z'*Bua';
T12 = W*Cza';
T13 = zeros(4);
T22 = -eye(2);
T23 = zeros(2,4);
T33 = -mu*eye(4);
LMIs = [LMIs, [T11 T12 T13; T12' T22 T23; T13' T23' T33]<0];

% Solving
obj = mu;
sol = solvesdp(LMIs,obj,sdpsettings('verbose',1,'solver','sedumi'));

p=min(checkset(LMI's));

%capturing the solutions (if ones exist)
if p > -tolerance;
    output.feas = 1;
    Z = double(Z);
    W = double(W);
    K = Z*inv(W)
    K1 = K(:,1:2)
    K2 = K(:,3:4)
    display('Done')
else
    display('Error MSG!')
end
