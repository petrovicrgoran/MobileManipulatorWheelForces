% Mathematical modelling and virtual decomposition control of heavy-duty
% parallel-serial hydraulic manipulators

% Authors: Goran Petrovic and Jouni Mattila
% August 2021
% Tampere University / Tampereen Yliopisto

% Simulation initialization file

%%

% boundary conditions
D22F = [0;0;0;0;0;0];
Bc1_V = [0;0;0;0;0;0];
% commanded motion
% Th1 = Th1B + Th1A*sin(Th1f*t) [rad]
Th1A = 10*pi/180;
Th1B = 20*pi/180;
Th1f = 1;
% Th2 = Th2B + Th2A*sin(Th2f*t) [rad]
Th2A = 15*pi/180;
Th2B = -70*pi/180;
Th2f = 2;
% x3 = x3B + x3A*sin(x3f*t) [m]
x3A = 0.2;
x3B = 0.3;
x3f = 1;
% constant lengths and angles
L1 = 1.0071227324212;
L11 = 0.37610632101293;
x10 = 0.83;
L2 = 1.132185817991;
L12 = 0.30901132665325;
x20 = 0.83;
lc1 = 0.745;
lc01 = 0.085;
lc2 = 0.745;
lc02 = 0.085;
lc3 = 1.2;
beta1 = atan2d(374.261,935)*pi/180;
beta2 = atan2d(45.757,373.313)*pi/180;
beta3 = atan2d(139.50,1132.19)*pi/180;
beta4 = atan2d(88.061,296.198)*pi/180;
alpha1 = 1.9515432018109;
alpha2 = 0.24548563270531;
%constant position vectors
P32_r_P32D22 = [0.40499744871392; -0.13130517281345; -0.013385243295654];
B52_r_B52P32 = [lc3; 0; 0];
P22_r_P22P22p = [0.041; 0; 0];
Tc2_r_Tc2P22 = [-0.048858374920227;0.36587359346146;0.035276938723102];
B12_r_B12Tc2 = [L12;0;0];
Bc2_r_Bc2B12 = [L2;0;0];
B42_r_B42Tc2 = [lc2; 0; 0];
B32_r_B32B32p = [lc01;0;0];
Bc2_r_Bc2B32 = [0;0;0];
Tc1_r_Tc1Bc2 = [0.098495302558553; 0.01838181329939; 0];
B11_r_B11Tc1 = [L11; 0; 0];
Bc1_r_Bc1B11 = [L1; 0; 0];
Bc1_r_Bc1B31 = [0;0;0];
B31_r_B31B31p = [lc02;0;0];
B41_r_B41Tc1 = [lc1;0;0];
BMp_r_BMpBc1 = [0.185;0;0.205];
W_r_WBc1 = [0.185;0;0.205];
% constant rotation matrices
W_Rot_Bc1 = [cos(alpha1) -sin(alpha1)  0;...
                 0            0       -1;...
               sin(alpha1)  cos(alpha1)  0];
BMp_Rot_Bc1 = [cos(alpha1) -sin(alpha1)  0;...
                 0            0       -1;...
               sin(alpha1)  cos(alpha1)  0];
B31_Rot_B41 = eye(3);
B11_Rot_Tc1 = eye(3);
Tc1_Rot_Bc2 = [cos(alpha2) -sin(alpha2) 0;...
               sin(alpha2)  cos(alpha2) 0;...
               0            0           1];
B32_Rot_B42 = eye(3);           
B12_Rot_Tc2 = eye(3);
Tc2_Rot_P22 = [0.95853460763586 -0.27664713597974  0.0683942111482;...
               0.28497614981675  0.93051946315663 -0.23004808784757;...
               0                 0.23999977258511  0.9707729441837];
P22_Rot_B52 = eye(3);
B52_Rot_P32 = eye(3);
P32_Rot_D22 = [1 0 0;...
             0 0.9707729441837 0.23999977258512;...
             0 -0.23999977258512 0.9707729441837];
% auxiliary vectors
xf = [1;0;0;0;0;0];
zf = [0;0;1;0;0;0];
ztau = [0;0;0;0;0;1];
% gravity vector
Wg = [0; 0; 9.8066];
% masses
mP32 = 570.18877059;
mB52 = 6.73059863;
mP22 = 9.26136143;
mB12 = 33.92850233;
mB42 = 10.34519231;
mB32 = 17.36281648;
mBc2 = 54.58702836;
mB11 = 25.52660174;
mB41 = 10.34519231;
mB31 = 17.36281648;
mBc1 = 307.29601379;
% c.o.m. positions
P32_r_P32C = [0.25466704; -0.13034397; -0.01302248];
B52_r_B52C = [0 0 0.56802906];
P22_r_P22C = [0.62192523 0 0];
B12_r_B12C = [0.60504569; 0.27199376; 0.00002484];
B42_r_B42C = [0.55785997 0 0];
B32_r_B32C = [0.35781210 0 0];
Bc2_r_Bc2C = [0.54319901; 0.10543875; 0];
B11_r_B11C = [0.23805608; 0.13201777; 0];
B41_r_B41C = [0.55785997 0 0];
B31_r_B31C = [0.35781210 0 0];
Bc1_r_Bc1C = [0.14178771; 0.16555780; 0];
%inertia tensors
P32cI = [46.81220713 0.38607676 -0.00453819;...
         0.38607676 71.92201786 -1.14320993;...
         -0.00453819 -1.14320993 67.38128576];
B52cI = diag([0.91789884, 0.91790043, 0.00091463]);
P22cI = diag([0.00662754, 1.48387017, 1.48398069]);
B12cI = [1.18803886 -2.36786418 0.00280315;...
         -2.36786418 6.31493281 0.00022322;...
          0.00280315 0.00022322 7.40915161];
B42cI = diag([0.00370720 0.55759812 0.55785997]);
B32cI = diag([0.03150902 0.90735702 0.90763033]);
Bc2cI = [0.48071390 0.52924041 0;...
         0.52924041 5.80912352 0;...
             0      0          5.97255351];
B11cI = [0.28426000 -0.06487287 0;...
        -0.06487287  0.54237481 0;...
                  0  0          0.67891020];
B41cI = diag([0.00370720 0.55759812 0.55785997]);
B31cI = diag([0.03150902 0.90735702 0.90763033]);
Bc1cI = [+5.892211080 +5.476111360 -0.000019630;...
         +5.476111360 +28.66965601 -0.000024550;...
         -0.000019630 -0.000024550 +29.78955950];