% Calculations done with every iteration in angle of attack

function [trim_eldef,trim_lift_coeff,drag_coeff,velocity,thrust,power] = loop(aoa,k,S)

%% Given data

% Aerodynamic coefficient
cd0=0.03;            % Zero-lift drag coefficient
cm0=0.01;            % Zero AOA pitching moment coefficient 
cl0=0;               % assumed since not specified
clalpha=2.92;        % Lift curve slope (per radian) 
cldelta=0.265;       % Lift due to elevator deflection
cmalpha=-0.292;      % Pitching moment due to AOA
cmdelta=-0.4;        % Pitching moment due to elevator deflection

% Flight conditions
uav_mass=3.5;
air_density=1.225;
g=10;
uav_weight=uav_mass*g;

%% Calculations

% Trim elevator deflection
% cm = cm0 + cmalpha*AOA + cmdelta*eldef = 0
trim_eldef=-((cm0+cmalpha*aoa)/cmdelta);  % in radians

% Trim lift coefficient
% cl = cl0 + clalpha*aoa + cldelta*eldef
trim_lift_coeff=cl0+clalpha*aoa+cldelta*trim_eldef;

% Drag coefficient
%cd = cd0 + k*(cl^2)
drag_coeff=cd0+k*(trim_lift_coeff^2);

% Velocity
% Lift = Weight = 0.5*air_density*(v^2)*S*cl
velocity=sqrt(uav_weight/(0.5*air_density*S*trim_lift_coeff));

% Thrust
% Thrust = Drag = 0.5*air_density*(v^2)*S*cd
thrust=0.5*air_density*(velocity^2)*S*drag_coeff;

% Power
%Power=Thrust*Velocity
power=thrust*velocity;

end