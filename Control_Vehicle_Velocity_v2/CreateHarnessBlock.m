%��Ҫ�������ŵ���ǰ·���²��ܵ��ã��ҵ����ѡģ����û���⡣����δ����mat�ļ�ʹ��ģ���д����޷�ʶ��ı��������޷�ִ�гɹ�
function CreateHarnessBlock(TestCaseName,TestCaseNum)
BlockPath='ControlVehicleVelocity';%��ȡ���ѡ���ģ��·��
load_system(BlockPath);
    for i=1:TestCaseNum
        if i<10
            try
                temp = [TestCaseName,'_00',num2str(i)];%ʹ�����ӷ�[]�����ַ���ƴ��
    %             sltest.harness.create(BlockPath,'Name',temp,'Source','Signal Builder');%����harnessģ��,����Ϊtemp�ַ������ź�Դѡ��Signal Builder
                sltest.harness.create(BlockPath,'Name',temp);
            catch
                disp('����harnessģ��ʧ�ܣ�������ѡģ���Ƿ��������');
            end
        else
            try
                temp = [TestCaseName,'_0',num2str(i)];%�ַ���ƴ��
%               sltest.harness.create(BlockPath,'Name',temp,'Source','Signal Builder');%����harnessģ��,����Ϊtemp�ַ������ź�Դѡ��Signal Builder  
                sltest.harness.create(BlockPath,'Name',temp);
            catch
                disp('����harnessģ��ʧ�ܣ�������ѡģ���Ƿ��������');
            end
        end         
    end

end

