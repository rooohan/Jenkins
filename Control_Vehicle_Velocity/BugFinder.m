opts = polyspace.BugFinderOptions;
folder = [gcs, '_ert_rtw'];
% sourceList = {'ert_main.cpp'; gcs};
sourceList = {'ert_main.cpp'};
% opts.Sources = {[folder, '/', sourceList{1}]; [folder, '/', sourceList{2}]};
opts.Sources = {[folder, '/', sourceList{1}]};
opts.EnvironmentSettings.IncludeFolders = {folder};
% opts.EnvironmentSettings.IncludeFolders = {fullfile(polyspaceroot, 'polyspace', 'examples',...
%     'cxx', 'Bug_Finder_Example', 'sources')};
opts.ResultsDir = pwd;
% rtwbuild(gcs);
polyspaceBugFinder(opts);
polyspaceBugFinder('-results-dir', opts.ResultsDir);
