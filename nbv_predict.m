function [test_label,predict_prob]=nbv_predict(data,pxj,pj)
%输入数据矩阵，和训练的pxj,pj，输入预测label和为该label的概率
% p(ci/w)=p(w/ci)*p(ci)/p(w),pxj=p(w/ci),pj=p(ci)
%pj=p(ci) 是个向量 pxj=p(w/cj)

N=size(data,1);               %N为实数，表示输入数据的个数
wn=length(pj);                %wn是个实数，同样代表类别个数
predict_prob(1:N,1:wn)=0;     %predict_prob是个矩阵，N行代表数据个数，wn列代表类别个数，predict_prob(i，j)表示第i个数据为j类的概率

for k=1:N                     %对每一个数据，k表示第k个数据
    for j=1:wn                %对每一个类，j表示第j个类
        idx=(data(k,:)>0);    %idx为0 1向量，存储该数据每个特征的取值
        predict_prob(k,j)=mul(pxj(j,idx))*pj(j);%mul为自定义的迭乘函数，将p（Wi/Cj）i=1：m中为1的特征迭乘   p(W/Cj)*p(Cj)
    end
end
[~,test_label]=max(predict_prob');
end


function value=mul(vector)

    m=length(vector);%m是向量的长度
    value=1;
    
    for i=1:m
       value=value*vector(i);   %迭乘函数 
    end

end