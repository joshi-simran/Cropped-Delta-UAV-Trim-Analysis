## **Trim, Thrust Required & Power Required Analysis of a Cropped Delta Wing UAV**

Def-Space Tech Winter Internship 2025

Aircraft Design Project

By **Simran Joshi**



## **📌 Project Overview**

This project presents a computational trim and performance analysis of a cropped delta wing UAV (wing-alone configuration) in steady level flight using MATLAB.
The objective was to evaluate how aerodynamic trim constraints interact with propulsion requirements and how performance metrics vary with angle of attack.

The study computes:
- Trim elevator deflection
- Lift coefficient (CL)
- Drag coefficient (CD)
- Flight velocity
- Thrust required
- Power required
- Aerodynamic efficiency metrics (CL/CD and CL³ᐟ²/CD)

The analysis integrates trim equilibrium, aerodynamic modeling, and propulsion constraints into a modular numerical solver.



## **📌 Internship Context**

This project was completed as part of the Def-Space Tech Winter Internship 2025 by Bharat Space Education Research Centre, focused on Aircraft Design.

The internship emphasized:
- Coupling aerodynamic modeling with flight equilibrium
- Numerical solution methods for UAV performance
- Interpretation of classical performance trends using computational tools



## **📌 Methodology**

### 1️. Geometric Preprocessing

- Taper ratio
- Wing planform area
- Aspect ratio
- Induced drag correction factor

### 2️. Aerodynamic Modeling

- Linear lift and moment relations
- Parabolic drag polar
- Wing-alone trim modeling

### 3. Trim Condition

- Steady, level trimmed flight requires:
- Lift = Weight
- Thrust = Drag
- Net pitching moment = 0

Trim elevator deflection is computed from moment equilibrium and used to evaluate corresponding lift and drag.

### 4️. Numerical Iteration

Angle of attack varied from:
α = 0° to 12° (Δα = 0.5°)

For each α:
- Trim solved
- Lift coefficient evaluated
- Velocity computed from lift equilibrium
- Drag, thrust, and power calculated
- Performance metrics stored

The α = 0° edge case was handled separately to avoid singular physical conditions.



## **📌 Key Results**

### 
- Minimum Thrust Required	≈ 12.3 m/s
- Minimum Power Required (Max Endurance)	≈ 11.2 m/s
- Maximum CL/CD (Max Range)	≈ 12.3 m/s
- Maximum CL³ᐟ²/CD (Max Endurance)	≈ 11.2 m/s

### Observed Trends
- Trim angle of attack decreases nonlinearly with increasing velocity
- Elevator deflection varies linearly with α
- Lift coefficient increases linearly (pre-stall regime)
- Drag increases quadratically due to induced drag
- Thrust and power curves exhibit classical U-shaped behavior

The results are consistent with fixed-wing aircraft performance theory and highlight the trade-off between range and endurance conditions.



## **📌 Technical Skills Demonstrated**

- Aircraft Trim Analysis
- UAV Performance Modeling
- Drag Polar Implementation
- Steady Level Flight Equilibrium
- MATLAB Modular Programming
- Numerical Iterative Solvers
- Aerospace Data Interpretation



## **📌 Engineering Insights**

This project reinforces that:
- Trim, aerodynamic efficiency, and propulsion requirements are strongly coupled.
- Maximum range and maximum endurance occur at different flight velocities.
- Induced drag dominates at low speeds, parasite drag dominates at high speeds.
- Numerical methods are essential for analyzing unconventional configurations like cropped delta wing UAVs.



## **📌 Full Technical Report**
The complete structured technical report, including derivations, plots, and detailed discussions, is included in this repository:

[Project Report](Project_Report_DefSpace_Winter_Internship_2025_Simran_Joshi.pdf)



## **📌 Applications**

This methodology can be extended to:
- Electric UAV endurance optimization
- Preliminary aircraft sizing studies
- Conceptual design validation
- Comparative configuration analysis



## **👩‍💻 Author**

Simran Joshi
