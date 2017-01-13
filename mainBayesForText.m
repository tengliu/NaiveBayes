clear;
clc;
%程序需要改的接口：数据，dictionary，函数的distribution参数
load('typeAll.mat');
load('urlAll.mat');
dictionary=['erge  ';'zuofan';'youxi ';'yizhi ';'wenxue';'shipin';'youxi ';'yinpin';'zuofan';'maoxia';'pintu ';'ertong';'tianse';'zhongw';'gequ  ';'shipin';'donghu';'zhutiq';'yingwe';'gequ  ';'tonghu';'yuyan ';'baike ';'huiben';'gushi ';'FLASH ';'hanzi ';'bihua ';'chengy';'tongya';'changs';'jingwu';'kantu ';'xiaoxu';'kejian';'wenxue';'pinyin';'zimu  ';'hanzi ';'zidian';'duihua';'duwu  ';'tushu ';'fudao ';'minjia';'yingyu';'shuang';'duihua';'duwu  ';'pintu '];%字典词条库，不够的必须用空格补齐
[row,column]=size(dictionary);%row代表字典中有几个单词(特征向量的数量)，column代表单词固定长度
%生成100个随机数做训练集
b=randperm(9000);%生成1到100的随机排列
a=b(1:8000);%取前5000个,a为5000个随机数的向量
train_label=typeAll(a);%5000*1的胞体
train_url=urlAll(a);%5000*1的胞体
train_data=zeros(8000,row);%
for i=1:8000
    train_data(i,:)=text2vec(train_url(i),dictionary,6);
end
%train_data得到5000*row的特征矩阵
O1 = fitNaiveBayes(train_data,train_label,'Distribution', 'mn'); 
C1=O1.predict(train_data);
cMat1 = confusionmat(train_label, C1) %自测试准确率：93%

a=b(8001:9000);%取剩下的1000个做测试集
test_label=typeAll(a);%1000*1的胞体
test_url=urlAll(a);%1000*1的胞体
test_data=zeros(1000,row);%
for i=1:1000
    test_data(i,:)=text2vec(test_url(i),dictionary,6);
end
C2=O1.predict(test_data);
cMat2=confusionmat(test_label, C2)