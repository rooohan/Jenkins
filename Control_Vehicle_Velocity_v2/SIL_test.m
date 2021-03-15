% ------------------------------------------
% 代码SIL测试
% Matlab: R2020a
% Time: 2021.3.2
% Author: Hannah
% ------------------------------------------
model_name = 'ControlVehicleVelocity_Harness2';   %gcs
load_system(model_name);

set_param(model_name,'StopTime','10.0');
set_param(model_name,'SolverType','Fixed-step');
set_param(model_name,'Solver','FixedStepDiscrete'); %Auto
set_param(model_name,'FixedStep','0.1');

set_param(model_name,'SystemTargetFile','ert.tlc');
set_param(model_name,'TargetLang', 'C');
set_param(model_name,'PortableWordSizes','off');
set_param(model_name,'TargetHWDeviceType','Custom Processor->MATLAB Host Processor');
set_param(model_name,'ProdEqTarget','off');

set_param(model_name,'GenerateReport','on');
set_param(model_name,'LaunchReport','off');
set_param(model_name,'CodeExecutionProfiling','off');

set_param(model_name,'LoadExternalInput','on');
set_param(model_name,'ExternalInput','[0, input]');
set_param(model_name,'GenCodeOnly', 'on');

%% read excel data
[num, txt] = xlsread('./test_case2.xlsx');
TestNum = length(num(1:end, 1));
TestCondition = txt(2:2, 2);
ExpectedResult = txt(2:end, 3);

%% test data
CompareResult = false(1,length(ExpectedResult));

%% MIL Simulation set
set_param(model_name,'SimulationMode','Normal');
set_param(model_name,'OutputSaveName', 'MIL_out');

for i = 1:TestNum
    eval([TestCondition{i}]);
    sim(model_name);
%     for j = 1:length(ExpectedResult)
%         eval([ExpectedResult{j}]);
%         CompareResult(j) = (MIL_out{1}.Values.Data(j) - Out) < 0.1;
%     end
end

% SIL Simulation set
set_param(model_name,'OutputSaveName', 'SIL_out');
set_param(model_name,'SimulationMode','Software-in-the-Loop (SIL)'); %SimulationMode

for i = 1:TestNum
    eval([TestCondition{i}]);
    sim(model_name);
    for j = 1:length(ExpectedResult)
%         eval([ExpectedResult{j}]);
        CompareResult(j) = (SIL_out{1}.Values.Data(j) - MIL_out{1}.Values.Data(j)) < 0.01;
    end
end
save_system(model_name,[],'OverwriteIfChangedOnDisk',true);
close_system(model_name);

%%
result_path = './RESULT/SIL_result';
if exist(result_path,'dir') == 0
   mkdir(result_path);
end
%% write the result to excel
file_path = [result_path, '/SIL_result.xlsx'];
data = {'采样时间','MIL结果','SIL结果','比较结果'};
xlswrite(file_path, data, 'Sheet1', 'A1:D1');

xlswrite(file_path, SIL_out{1}.Values.Time, 'Sheet1', 'A2');
xlswrite(file_path, SIL_out{1}.Values.Data, 'Sheet1', 'B2');
xlswrite(file_path, SIL_out{1}.Values.Data, 'Sheet1', 'C2');
xlswrite(file_path, CompareResult', 'Sheet1', 'D2');

%% plot the result
% fig1 = figure;
% subplot(3,1,1), plot(MIL_Out), title('Output for Normal Simulation')
% subplot(3,1,2), plot(SIL_Out), title('Output for SIL Simulation')
% subplot(3,1,3), plot(MIL_Out-SIL_Out), ...
%     title('Difference Between Normal and SIL');
