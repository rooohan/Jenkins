%------------------------------------------------------------------------------
%   Simulink script for bug finder.
%   File Name    : BugFinderOptions.m
%   MATLAB       : R2020a
%   Author       : Hannah
%   Time         : 2021/1/28
%  
%------------------------------------------------------------------------------
opts = polyspace.BugFinderOptions;

modelName = 'ControlVehicleVelocity';
folder = [modelName, '_ert_rtw'];
% define the source files
sourceFile = {fullfile(pwd, folder, '*.cpp')};
% define the header files
includeFolder = {fullfile(pwd, folder, '*.h'); 'D:\\software\\Polyspace\\R2020a\\simulink\\include'};
 
opts.Sources = sourceFile;
opts.EnvironmentSettings.IncludeFolders = includeFolder;
opts.TargetCompiler.Compiler = 'gnu4.9';

opts.ResultsDir = pwd;
% rtwbuild(gcs);
polyspaceBugFinder(opts);
polyspaceBugFinder('-results-dir', opts.ResultsDir);
