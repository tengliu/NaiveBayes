clear all;
clc;

N=10000;%��������
L=100;%��������
time=100;%
map=0;


    data=rand(N,L);
    data=data-0.5;%�����ʼ�����ݾ���
    label=(rand(N,1)>0.5);%�����ʼ����ǩ����

    train_data=data(1:50,:);%ѡȡǰ50����ѵ����
    train_label(1:50)=label(1:50);
    [pxj,pj]=nbc_train(train_data,train_label);%�õ�ģ�Ͳ���pxj��pj

    test_data=data(51:100,:);%ѡȡ50-100�����������Լ�
    test_label=label(51:100);
    [predict_label,p]=nbv_predict(test_data,pxj,pj);%�ò��Լ���Ԥ�⣬�õ�Ԥ���ǩ����׼ȷ��

    predict_label=(predict_label-1)';
    ap=sum((predict_label-test_label)==0)/length(test_label);%ap������Լ���׼ȷ��
    map=map+ap;
    i
disp('          Classfication completed               ');


map=map/time;