function [outK] = fuzzy_ganhos(vec_h1, vec_h2)
% Plant Specs
[A1,A2,A3,A4,a1,a2,a3,a4,g,k1,k2,gamma1,gamma2] = planta();

% C
C = [1 0 0 0;
     0 1 0 0];

% Returns
outK = zeros(2,6,length(vec_h1),length(vec_h2));
size(outK)

%new LMI system
LMIs = [];

%create the variables
vec_M = [];

% Lyapunov matrix
W = sdpvar(6,6,'symmetric');
LMIs = [LMIs, W>0];


for i1 = 1:length(vec_h1)
    hp1 = vec_h1(i1);
    
    for i2 = 1:length(vec_h2)
        hp2 = vec_h2(i2);

        v2 = ((a1*sqrt(2*g*hp1)*((gamma1-1)/gamma1))+ a2*sqrt(2*g*hp2))*(gamma1/(k2*(gamma1+gamma2-1)));
        v1 = (a1*sqrt(2*g*hp1) + (gamma2-1)*(k2*v2))/(gamma1*k1);
        
        hp3 = (1/(2*g))*((((1-gamma2)*k2*v2)/a3)^2);
        hp4 = (1/(2*g))*((((1-gamma1)*k1*v1)/a4)^2);
        
        T1 = (A1/a1)*sqrt(2*hp1/g);
        T2 = (A2/a2)*sqrt(2*hp2/g);
        T3 = (A3/a3)*sqrt(2*hp3/g);
        T4 = (A4/a4)*sqrt(2*hp4/g);

        A = [-(1/T1) 0 (A3/(A1*T3)) 0;
             0 -(1/T2) 0 (A4/(A2*T4));
             0 0 -(1/T3) 0;
             0 0 0 -(1/T4)];

        B = [gamma1*k1/A1 0;
            0 gamma2*k2/A2;
            0 (1 - gamma2)*k2/A3;
            (1 - gamma1)*k1/A4 0];
               
        Aa = [A zeros(4,2); -C zeros(2)];
        Ba = [B; zeros(2)];

        M = sdpvar(2,6,'full');
        vec_M = [vec_M M];
        LMIs = [LMIs, Aa*W + W*Aa' + Ba*M + M'*Ba' <0];
    end
end
% Solving
obj = 0;
sol = optimize(LMIs,obj,sdpsettings('verbose',0,'solver','sedumi'));
Mi = value(vec_M);
vW = value(W);
invW = inv(vW);

for k1 = 1:length(vec_h1)
    for k2 = 1:length(vec_h2)
        inicio = (k1-1)*length(vec_h2)*6 + 1;
        fim = inicio + 5;
        Mn = Mi(:,inicio:fim);
        outK(:,:,k1,k2) = Mn*invW;
    end
end
% Mn = Mi(:,1:6);
% outK(:,:,1,1) = Mn*invW;
% Mn = Mi(:,7:12);
% outK(:,:,1,2) = Mn*invW;
% Mn = Mi(:,13:18);
% outK(:,:,2,1) = Mn*invW;
% Mn = Mi(:,19:24);
% outK(:,:,2,2) = Mn*invW;