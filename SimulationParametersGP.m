% gravity acceleration vector
g = [0; 0; 9.8066];
% chassis COM displacement from the geometric centre in the x-axis
% direction NB!!! If the parametrized COM position is changed here,
% then all the moments of inertia would change, etc. so be careful with 
% this. It would be for the best to recreate the chassis CAD model such
% for the own case of interest.
cc = 0.0;
% length l1 from the paper (longitudinal distance from the chassis COM to
% the axle
l1 = 1.15-cc;
% length l1 from the paper (longitudinal distance from the chassis COM to
% the axle
l2 = 1.15+cc;
% % lengths wi, i = RL, RR, FL, FR from the paper (lateral distances from 
% the chassis COM to the wheels
wRL = 0.875;
wRR = 0.875;
wFL = 0.875;
wFR = 0.875;
% chassis mass
mBC = 2200;
% tensor of chassis inertia about the x,y,z axes of the BC frame
BCI = diag([100 1200 1000]);
% wheel masses
mFL = 60;
mFR = 60;
mRR = 60;
mRL = 60;
% wheel radii
R0FL = 0.35;
R0FR = 0.35;
R0RR = 0.35;
R0RL = 0.35;
% tyre relaxation time constant used in the longitudinal slip differential
% equations which must be used at low velocities
BFL = 0.05;
BFR = 0.05;
BRR = 0.05;
BRL = 0.05;
% chassis COM height
zC = 0.45;
% soil parameters
betaGround = 1e6;
ground_stiffness = 1e8;
% parametrized manipulator base location with respect to the chassis COM
xCA = 0.5;
yCA = 0;
zCA = .25;
BC_r_BCBM = [xCA; yCA; zCA];
% Common notation for parameters that have same values.
w = wFL;
Rw = R0FL;
mw = mFL;
g0 = 9.8066;
% Rotation matrix per the calculation procedure proposed in the paper.
BC_Rot_BM = eye(3);
% Manipulator base orientation angle.
gamma = pi/4;
% Rotation matrix from BM' to BM as explained in the paper.
BM_Rot_BMp = [cos(gamma) -sin(gamma) 0; sin(gamma) cos(gamma) 0; 0 0 1];
% Frames BM' and B;M have same origins.
BM_r_BMBMp = [0;0;0];
%% Floor parameters
% per  MathWorks Student Competitions Team (2022). 
% MATLAB and Simulink Racing Lounge: Vehicle Modeling with Simscape Multibody 
% (https://www.mathworks.com/matlabcentral/fileexchange/64648-matlab-and-simulink-racing-lounge-vehicle-modeling-with-simscape-multibody), 
% MATLAB Central File Exchange. 
% Retrieved March 20, 2022. 
Floor.l = 1000;  % m
Floor.w = 1000;  % m
Floor.h = 0.1; % m
% Grid parameters
Grid.clr = [1 1 1]*1;
Grid.numSqrs = 250;
Grid.lineWidth = 0.02;
Grid.box_h = (Floor.l-(Grid.lineWidth*(Grid.numSqrs+1)))/Grid.numSqrs;
Grid.box_l = (Floor.l-(Grid.lineWidth*(1+1)))/1;
Grid.extr_data = Extr_Data_Mesh(Floor.w,Floor.w,Grid.numSqrs,1,Grid.box_h,Grid.box_l);
%% Sampling time
dT = 0.01;