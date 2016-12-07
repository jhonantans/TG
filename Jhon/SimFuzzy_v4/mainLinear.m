function output = mainLinear()
% Fuzzy Sets
vec_h1 = [10];
vec_h2 = [10];

% System to Each Point
[Ai, Bi, vec_v1, vec_v2, vec_h3, vec_h4] = fuzzy_pontos_v2(vec_h1,vec_h2);
h01 = 5;
h02 = 5;
h03 = 0.0334;
h04 = 2.9076;
v01 = 3.2321;
v02 = 0.5716;

% h03 = 2.0804;
% h04 = 1.7175;
% v01 = 1.8428;
% v02 = 2.0890;

% Solving
samp_time = 0.01;
final_time = 1200;
tot_samps = final_time/samp_time;
t = linspace(0, final_time, tot_samps);
% [t,Hv] = ode45(@quadtank,t,[h01 h02 h03 h04]);
[t,Hv] = ode45(@quadtank,t,[h01 h02 h03 h04]);

% Vizualization
y = [ Hv(:,1) Hv(:,2)];
% plot(t,y(:,1),'--r',t,y(:,2),'--b');
% figure
% plot(t,y(:,1),'--b', 'LineWidth',2);
% title('Modelo TS')
% ylabel('Altura (cm)');
% xlabel('Tempo (s)');
% legend('h1 TS [5 15]');
% grid on
% 
% figure
% plot(t,y(:,2),'--r', 'LineWidth',2);
% title('Modelo TS')
% ylabel('Altura (cm)');
% xlabel('Tempo (s)');
% legend('h2 TS [5 15]');
% grid on

mML_h = Hv;
save('mainLinear.mat');

% /////////////////////////////////////
% ---- Fuzzy Takagi-Sugeno Model ---- %
% /////////////////////////////////////
function dh = quadtank(t,h)
% Inference System
alphas = fuzzy_pertinencia(h(1), h(2), vec_h1, vec_h2);

A = zeros(4,4);
B = zeros(4,2);
resp = zeros(size(h));

% Inputs
u = [v1(t); v2(t)];

for i= 1:size(alphas,1)
    for j= 1:size(alphas,2)
%         A = A + alphas(i,j) * Ai(:,:,i,j);
%         B = B + alphas(i,j) * Bi(:,:,i,j);
        resp = resp + alphas(i,j) * (Ai(:,:,i,j)*[h(1)-vec_h1(i); h(2)-vec_h2(j); h(3)-vec_h3(i,j); h(4)-vec_h4(i,j)] + Bi(:,:,i,j) * [u(1)-vec_v1(i,j); u(2)-vec_v2(i,j)]);
    end
end

% Result System
% dh = A*h + B*u;
dh = resp;
end

% /////////////////////////////////////
% ---- Inputs ---- %
% /////////////////////////////////////
function v11 = v1(t)
    if (t < 100)
        v11 = v01;
    else
        v11 = v01+2;
    end
end
   
function v22 = v2(t)
    if (t < 500)
         v22 = v02;
    else
        v22 = v02+2;
    end
end

end