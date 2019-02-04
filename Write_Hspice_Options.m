% Write Hspice Simulation Options
% By: Dr. Behzad NOURI
% Last Update: 2019/02/20
%--------------------------------------------------------------------------
close all; clc; clear;  %Intialization

FN = 'xoption.sp';
%--------------------------------------------------------------------------
[OptFid,errmsg] = fopen(FN,'wt');
if OptFid<0, error(errmsg); end 

fprintf(OptFid, '\n***Options:');
fprintf(OptFid, '\n.OPTION PROBE');

%--------------------------------------------------------------------------
%POST = x Stores simulation results for analysis by using AvanWaves 
...interface or other methods.
...POST = 1 saves results in binary.  (for Hspice-toolbox)
...POST = 2 saves results in ASCII.
...POST = 3 saves results in New Wave binary format.
fprintf(OptFid, '\n.OPTION POST=1\t\t\t$POST=1 is for Hspice-toolbox'); 
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%LIST=0: Do NOT Print ckt element list(0=None). Setting it to 1 Prints all
... ckt element summary table and para definition. Default is 
fprintf(OptFid, '\n.OPTION LIST=0'); 
%--------------------------------------------------------------------------

fprintf(OptFid, '\n.OPTION INGOLD=2')  ;%$2=Numbers in exp. format');
fprintf(OptFid, '\n');

%fprintf(OptFid, '\n\n***For Freq. sim:');
%fprintf(OptFid, '\n');

fprintf(OptFid, '\n\n***For tran. sim:');

%--------------------------------------------------------------------------
%ACCURATE: Selects a time algorithm; uses LVLTIM=3 and DVDT = 2 for 
...circuits such as high-gain comparators. Default is 0.
fprintf(OptFid, '\n.OPTION ACCURATE');
%--------------------------------------------------------------------------

fprintf(OptFid, '\n.OPTION DVDT=2');

%--------------------------------------------------------------------------
%LVLTIM: Selects the timestep algorithm for transient analysis.
...If LVLTIM = 1 (default), HSPICE uses the DVDT timestep algorithm.
...If LVLTIM = 2, HSPICE uses the local truncation error (LTE) timestep control method.
...If LVLTIM = 3, HSPICE uses the DVDT timestep algorithm with timestep reversal.
fprintf(OptFid, '\n.OPTION LVLTIM=2')       ;%if 2, use local truncation error (LTE) time-step control method
%--------------------------------------------------------------------------

fprintf(OptFid, '\n.OPTION TRTOL=10')       ;%Range:0.01-to-100, Use this when LVLTIM=2, As TRTOL increases,the time-step increases
fprintf(OptFid, '\n*.OPTION RMIN=1.0e-10')  ;%Min of time-step, default-val:1.0e-9. Min-val:1e-15
fprintf(OptFid, '\n');

%--------------------------------------------------------------------------
%INTERP: Default is 0. By setting it to 1, Hspice limits output to only the 
...timestep intervals in .TRAN command (faster post processing)and enables 
....printing of output variables at their internal time points
fprintf(OptFid, '\n*.OPTION INTERP=1');
%--------------------------------------------------------------------------
fprintf(OptFid, '\n');


fprintf(OptFid, '\n\n***For Selecting Integration Method:');
%--------------------------------------------------------------------------
%RUNLVL: Controls the speed and accuracy trade-off. It can be set to 
...0,1,2,3,4,5,6. Higher values of RUNLVL result in higher accuracy and 
...longer simulation times, while lower values give lower accuracy and 
...faster simulation runtimes.
...RUNLVL=0 turns off this algorithm.
...RUNLVL=1 is the lowest simulation runtime.
...RUNLVL=3 is the default (similar to original HSPICE default mode).
...RUNLVL=5, 6 correspond to the HSPICE standard accurate mode. For most circuits,
...RUNLVL=5 is similar to the HSPICE standard accurate mode.
fprintf(OptFid, '\n*.OPTION RUNLVL=5')               ;%5 or 6 are the most accurate                                             
%--------------------------------------------------------------------------

fprintf(OptFid, '\n*.OPTION METHOD=TRAP PURETP')    ;%sets pure trapezoidal method integration. No Gear-2 or Backward-Euler is mixed in. 
                                                     %...e.g. use this setting when you simulate harmonic oscillators.
fprintf(OptFid, '\n*.option method=gear maxord=1')  ;%sets pure Backward-Euler integration                                                  
fprintf(OptFid, '\n*.option method=gear')           ;%sets pure Gear-2 integration
fprintf(OptFid, '\n*.option method=bdf')            ;%Sets the higher order backward differentiation formulation integration for supported models.

fprintf(OptFid, '\n');

fclose(OptFid);

%End-of-File
