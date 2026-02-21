% Pre-Processing Calculations (done before varying angle of attack)

function [taper_ratio,wing_area,aspect_ratio,k] = constParams()

%% Given data

% Geometry
cr=0.9; % Wing root chord length
ct=0.15; % Wing tip chord length
b=1.5; % Wing span
e=0.89; % Oswald efficiency factor

%% Calculations

% Taper ratio
taper_ratio=ct/cr;

% Wing area
wing_area=(b/2)*cr*(1+taper_ratio);

% Aspect ratio
aspect_ratio=(b^2)/wing_area;

% Induced drag correction factor
k=1/(pi*e*aspect_ratio);

end





