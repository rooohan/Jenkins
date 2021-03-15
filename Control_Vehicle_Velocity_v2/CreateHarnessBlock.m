%需要将函数放到当前路径下才能调用，且点击所选模块需没问题。例如未导入mat文件使得模块中存在无法识别的变量，则无法执行成功
function CreateHarnessBlock(TestCaseName,TestCaseNum)
BlockPath='ControlVehicleVelocity';%获取点击选择的模块路径
load_system(BlockPath);
    for i=1:TestCaseNum
        if i<10
            try
                temp = [TestCaseName,'_00',num2str(i)];%使用连接符[]进行字符串拼接
    %             sltest.harness.create(BlockPath,'Name',temp,'Source','Signal Builder');%生成harness模块,名称为temp字符串，信号源选择Signal Builder
                sltest.harness.create(BlockPath,'Name',temp);
            catch
                disp('生成harness模块失败，请检查所选模块是否存在问题');
            end
        else
            try
                temp = [TestCaseName,'_0',num2str(i)];%字符串拼接
%               sltest.harness.create(BlockPath,'Name',temp,'Source','Signal Builder');%生成harness模块,名称为temp字符串，信号源选择Signal Builder  
                sltest.harness.create(BlockPath,'Name',temp);
            catch
                disp('生成harness模块失败，请检查所选模块是否存在问题');
            end
        end         
    end

end

