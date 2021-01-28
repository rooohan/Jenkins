opts = polyspace.BugFinderOptions;
folder = [gcs, '_ert_rtw'];
sourceList = {'ert_main.cpp'; gcs};
opts.Sources = {[folder, '/', sourceList{1}]; [folder, '/', sourceList{2}]};
opts.EnvironmentSettings.IncludeFolders = {[gcs, '_ert_rtw']};
opts.ResultsDir = pwd;
rtwbuild(gcs);
polyspaceBugFinder(opts);
polyspaceBugFinder('-results-dir', opts.ResultsDir);
