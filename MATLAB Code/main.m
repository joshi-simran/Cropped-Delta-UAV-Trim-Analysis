%% Constant Parameters Calculation

[taper_ratio,S,AR,k]=constParams();   % from constParams.m

%% AOA Loop

alpha=0:0.5:12;  % varying angle of attacks
                 % creates a 1x25 matrix of values from 0 to 12 with a step value of 0.5 
 
[deltae,cl,cd,v,t,p,metric1,metric2]=deal(zeros(1,25)); % assigns an all zero 1x25 matrix to all variables
                                                        % deltae - trimmed elevator deflection
                                                        % cl - trimmed lift coefficient
                                                        % cd - corresponding drag coefficient
                                                        % v - corresponding velocity
                                                        % t - corresponding thrust
                                                        % p - corresponding power
                                                        % metric1 - cl/cd
                                                        % metric2- (cl^(3/2))/cd

% main computing loop
for i=1:length(alpha)

    aoa=deg2rad(alpha(i));  % degrees converted to radians for computation

    % assigns computed value to index in each matrix specified by i
    [deltae(i),cl(i),cd(i),v(i),t(i),p(i)]=loop(aoa,k,S);  % from loop.m

    % handling zero aoa edge case
    if alpha(i)==0
        [v(i),t(i),p(i)]=deal(NaN);
    end
    
end

deltae=rad2deg(deltae);  % radians converted back to degrees after computation

%Computing performance metrics
metric1=cl./cd;
metric2=(cl.^(3/2))./cd;


%% Visualization

valid=~isnan(v); % to exclude all NaNs from plots

figure(1)

% 1. Trim Angle of Attack vs Flight Velocity
plot(v(valid),alpha(valid),'-bs','MarkerFaceColor','m')
grid on
xlabel('V (m/s)')
ylabel('\alpha (deg)')
title('Trim Angle of Attack vs Flight Velocity')

figure(2)

% 2. Trim Elevator Deflection vs Angle of Attack
subplot(2,3,1)
plot(alpha,deltae,'-bs','MarkerFaceColor','m')
grid on
xlabel('\alpha (deg)')
ylabel('\delta_e (deg)')
title('Trim Elevator Deflection vs Angle of Attack')

% 3. Trim Lift Coefficient vs Angle of Attack
subplot(2,3,3)
plot(alpha,cl,'-bs','MarkerFaceColor','g')
grid on
xlabel('\alpha (deg)')
ylabel('C_L')
title('Trim Lift Coefficient vs Angle of Attack')

% 4. Trim Drag Coefficient vs Angle of Attack
subplot(2,3,5)
plot(alpha,cd,'-bs','MarkerFaceColor','c')
grid on
xlabel('\alpha (deg)')
ylabel('C_D')
title('Trim Drag Coefficient vs Angle of Attack')

figure(3)

% 5. Thrust vs Flight Velocity
subplot(1,2,1)
plot(v(valid),t(valid),'-bs','MarkerFaceColor','m')
grid on
xlabel('V (m/s)')
ylabel('Thrust Required (N)')
title('Thrust vs Flight Velocity')

% 6. Power vs Flight Velocity
subplot(1,2,2)
plot(v(valid),p(valid),'-bs','MarkerFaceColor','g')
grid on
xlabel('V (m/s)')
ylabel('Power Required (W)')
title('Power vs Flight Velocity')

figure(4)

% 7. C_L​/C_D vs Flight Velocity
subplot(1,2,1)
plot(v(valid),metric1(valid),'-bs','MarkerFaceColor','m')
grid on
xlabel('V (m/s)')
ylabel('C_L​/C_D')
title('C_L​/C_D vs Flight Velocity')

% 8. C_L^{3/2​}/C_D vs Flight Velocity
subplot(1,2,2)
plot(v(valid),metric2(valid),'-bs','MarkerFaceColor','g')
grid on
xlabel('V (m/s)')
ylabel('C_L^{3/2} / C_D')
title('C_L^{3/2​}/C_D vs Flight Velocity')
