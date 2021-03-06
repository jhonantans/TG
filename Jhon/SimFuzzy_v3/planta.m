function [A1,A2,A3,A4,a1,a2,a3,a4,g,k1,k2,gamma1,gamma2] = planta()

% Tanks Specs
A1 = 28;
A2 = 32;
A3 = 28;
A4 = 32;

a1 = 0.071;
a2 = 0.057;
a3 = 0.071;
a4 = 0.057;

g = 981;

% Minimum Phase
k1 = 3.33;
k2 = 3.35;
gamma1 = 0.70;
gamma2 = 0.60;

% Non Minimum Phase
% k1 = 3.15;
% k2 = 3.29;
% gamma1 = 0.43;
% gamma2 = 0.34;

end