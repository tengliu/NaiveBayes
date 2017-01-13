function [test_label,predict_prob]=nbv_predict(data,pxj,pj)
%�������ݾ��󣬺�ѵ����pxj,pj������Ԥ��label��Ϊ��label�ĸ���
% p(ci/w)=p(w/ci)*p(ci)/p(w),pxj=p(w/ci),pj=p(ci)
%pj=p(ci) �Ǹ����� pxj=p(w/cj)

N=size(data,1);               %NΪʵ������ʾ�������ݵĸ���
wn=length(pj);                %wn�Ǹ�ʵ����ͬ������������
predict_prob(1:N,1:wn)=0;     %predict_prob�Ǹ�����N�д������ݸ�����wn�д�����������predict_prob(i��j)��ʾ��i������Ϊj��ĸ���

for k=1:N                     %��ÿһ�����ݣ�k��ʾ��k������
    for j=1:wn                %��ÿһ���࣬j��ʾ��j����
        idx=(data(k,:)>0);    %idxΪ0 1�������洢������ÿ��������ȡֵ
        predict_prob(k,j)=mul(pxj(j,idx))*pj(j);%mulΪ�Զ���ĵ��˺�������p��Wi/Cj��i=1��m��Ϊ1����������   p(W/Cj)*p(Cj)
    end
end
[~,test_label]=max(predict_prob');
end


function value=mul(vector)

    m=length(vector);%m�������ĳ���
    value=1;
    
    for i=1:m
       value=value*vector(i);   %���˺��� 
    end

end