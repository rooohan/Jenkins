% ------------------------------------------
% test harness测试
% Matlab: R2020a
% Time: 2021.3.8
% Author: Hannah
% ------------------------------------------

% CreateHarnessBlock('test_harness_case', 1);
sltest.harness.load('ControlVehicleVelocity', 'test_harness_case_001');
testfile = sltest.testmanager.TestFile('./test_file.mldatx');
ts = getTestSuites(testfile);
tc = getTestCases(ts);
