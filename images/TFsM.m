% Duty Cycle
D = 0.6129;

% Passive component values
R_o = 3.8;
C_o = 6.1290e-6;
C_c = 4.7451e-6;
L_1 = 2.4194e-6;
L_2 = 3.6774e-6;
V_o = 3.3;

V_g = V_o * (1 + D) / (2 * D);
I_o = 1;

% Derived parameters
I_g = I_o * 2 * D / (1 + D); %
L_a = L_1 * ((4 * (D ^ 2))/((1 + D) ^ 2)); %
C_a = C_c / (D ^ 2); %
D_fac = 1 / (D + D ^ 2); %

% Intermediate transfer functions
U_S = tf(R_o, [(R_o * C_o), 1]); %
Z_S = tf([(L_a * C_a * L_2 * C_o * R_o), (L_a * L_2 * C_a), (R_o * (L_a * C_o + L_a * C_a + L_2 * C_o)), (L_a + L_2), R_o], [(L_2 * C_o * C_a * R_o), (L_2 * C_a), ((C_a + C_o) * R_o + 1)]); %
E_S = tf([(-4 * L_1 * V_g * C_c * D_fac / (1 + D)), (L_1 * I_g * D_fac), (-D * V_g * D_fac)], 1); %

% Transfer Functions
G_vg = ((1 + D) * U_S) / (2 * D * Z_S);
G_vd = ((1 + D) * U_S * 1) / (2 * D * Z_S);
bode(G_vd);
xlabel('G_vd(s) at V_o = 3.3 V and I_o = 1 A');
grid
