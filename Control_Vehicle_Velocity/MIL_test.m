% ------------------------------------------
% MIL自动化测试
% Matlab: R2020a
% Time: 2021.2.26
% Author: Hannah
% ------------------------------------------

%% load model
load_system('./ControlVehicleVelocity.slx');

%% read excel data
[num, txt] = xlsread('./test_case2.xlsx');
TestNum = length(num(1:end, 1));
TestCondition = txt(2:2, 2);
ExpectedResult = txt(2:end, 3);

%% test data
TestResult = false(1,length(ExpectedResult));

for i = 1:TestNum
    eval([TestCondition{i}]);
    sim('./ControlVehicleVelocity.slx');
    for j = 1:length(ExpectedResult)
        eval([ExpectedResult{j}]);
        TestResult(j) = (yout{1}.Values.Data(j) - Out) < 0.1;
    end
end

%% write the result to excel
xlswrite('./test_case2.xlsx', TestResult', 'Sheet1', 'D2');
