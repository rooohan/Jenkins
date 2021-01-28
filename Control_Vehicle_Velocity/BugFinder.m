%------------------------------------------------------------------------------
%   Simulink script for bug finder.
%   File Name    : BugFinder.m
%   MATLAB       : R2020a
%   Author       : Hannah
%   Time         : 2021/1/28
%  
%------------------------------------------------------------------------------
opts = polyspace.BugFinderOptions;

modelName = 'ControlVehicleVelocity';
folder = [modelName, '_ert_rtw'];
sourceFile = fullfile(pwd, folder, '*.cpp');
includeFolder = fullfile(pwd, folder, '*.h');

opts.Sources = {sourceFile};
opts.EnvironmentSettings.IncludeFolders = {includeFolder};

opts.ResultsDir = pwd;
% rtwbuild(gcs);
polyspaceBugFinder(opts);
polyspaceBugFinder('-results-dir', opts.ResultsDir);
