clear all;
clc;

N=10000;%数据总量
L=100;%特征数量
time=100;%
map=0;


    data=rand(N,L);
    data=data-0.5;%随机初始化数据矩阵
    label=(rand(N,1)>0.5);%随机初始化标签向量

    train_data=data(1:50,:);%选取前50行做训练集
    train_label(1:50)=label(1:50);
    [pxj,pj]=nbc_train(train_data,train_label);%得到模型参数pxj，pj

    test_data=data(51:100,:);%选取50-100行数据做测试集
    test_label=label(51:100);
    [predict_label,p]=nbv_predict(test_data,pxj,pj);%用测试集做预测，得到预测标签集和准确率

    predict_label=(predict_label-1)';
    ap=sum((predict_label-test_label)==0)/length(test_label);%ap代表测试集的准确率
    map=map+ap;
    i
disp('          Classfication completed               ');


map=map/time;