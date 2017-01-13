clear;
clc;
%������Ҫ�ĵĽӿڣ����ݣ�dictionary��������distribution����
load('typeAll.mat');
load('urlAll.mat');
dictionary=['erge  ';'zuofan';'youxi ';'yizhi ';'wenxue';'shipin';'youxi ';'yinpin';'zuofan';'maoxia';'pintu ';'ertong';'tianse';'zhongw';'gequ  ';'shipin';'donghu';'zhutiq';'yingwe';'gequ  ';'tonghu';'yuyan ';'baike ';'huiben';'gushi ';'FLASH ';'hanzi ';'bihua ';'chengy';'tongya';'changs';'jingwu';'kantu ';'xiaoxu';'kejian';'wenxue';'pinyin';'zimu  ';'hanzi ';'zidian';'duihua';'duwu  ';'tushu ';'fudao ';'minjia';'yingyu';'shuang';'duihua';'duwu  ';'pintu '];%�ֵ�����⣬�����ı����ÿո���
[row,column]=size(dictionary);%row�����ֵ����м�������(��������������)��column�����ʹ̶�����
%����100���������ѵ����
b=randperm(9000);%����1��100���������
a=b(1:8000);%ȡǰ5000��,aΪ5000�������������
train_label=typeAll(a);%5000*1�İ���
train_url=urlAll(a);%5000*1�İ���
train_data=zeros(8000,row);%
for i=1:8000
    train_data(i,:)=text2vec(train_url(i),dictionary,6);
end
%train_data�õ�5000*row����������
O1 = fitNaiveBayes(train_data,train_label,'Distribution', 'mn'); 
C1=O1.predict(train_data);
cMat1 = confusionmat(train_label, C1) %�Բ���׼ȷ�ʣ�93%

a=b(8001:9000);%ȡʣ�µ�1000�������Լ�
test_label=typeAll(a);%1000*1�İ���
test_url=urlAll(a);%1000*1�İ���
test_data=zeros(1000,row);%
for i=1:1000
    test_data(i,:)=text2vec(test_url(i),dictionary,6);
end
C2=O1.predict(test_data);
cMat2=confusionmat(test_label, C2)