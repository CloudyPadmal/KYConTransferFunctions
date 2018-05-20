% Duty Cycle
D = 0:0.001:1;
d = 1 - D;
% Ideal Condition
IdealGain = 2 * D ./ (1 + D);

% Non Ideal Condition
V_D1 = 0.6;
V_g = 5;
R_L1 = 0.001;
R_L2 = 0.001;
R_C1 = 0.001;
R_C2 = 0.001;
R_o = 3.8;

% On resistance of semiconductors are assumed to be zero, therefore
R_Z = (1 + D) .* R_L2 + (D / (1 + D)) .* (4 * D .* R_L1 + d .* (R_C1 + R_C2));

First_Term = 2 * D ./ (1 + D + (R_Z / R_o));
Second_Term = - ((1 + D) .* (V_D1 / V_g) .* d) ./ (1 + D + (R_Z / R_o));
NonIdealGain = (First_Term + Second_Term);

figure
subplot(2,1,1);
plot(D,IdealGain);
xlabel('Ideal Gain');

subplot(2,1,2);
plot(D,NonIdealGain);
xlabel('Non Ideal Gain with V_D1 = 0.6 V');
