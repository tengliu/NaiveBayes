function [ pxj,pj ] = nbc_train( data,label )
% p(ci/w)=p(w/ci)*p(ci)/p(w),pxj=p(w/ci),pj=p(ci)
%dataһ�д���һ�����ݵ�ȫ������ȡֵ
[N,l]=size(data);           %N�����������ݵ�����(������N������)
wn=length(unique(label));   %wn�����ж�����
wm(1:wn)=0;                 %��ʼ����������ͬ��0����
pxj=zeros(wn,l);            %pxjΪ��������ͬ��������

for j=1:wn                  %j ����� j��
   idx=(label==(j-1));      %�ж�label�ǲ��ǵ�j�� ,idx��һ������ ��idx�� 3��5��7��Ϊ1������data��3��5��7��Ϊ����
   wm(j)=sum(idx);          %wmΪ��������wm��j���洢�ڼ����м�������wm��3��=9��˵����������9��Ԫ��
   pxj(j,:)=(sum(data(idx,:)>0)+1)/(wm(j)+wn);%data��һ����������data��idx����������>0˵��������ȡ1,(data(idx,:)>0)���һ��0 1����������¼��Щ����Ϊ1��
                                   % (sum(data(idx,:)>0)+1)��ʾ�ж��ٸ�����Ϊ1       sum(data(idx,:))��ʾ�ж��ٸ�����wȡ1��p(w)�� ����֮��ʾp(w/ci)= p(w)+1/(sum(ci)+n)
end

pj=wm/N;   %pjΪ����, pj=ĳ������/������  =p��ci�� p(c1)=0.3 ��ʾc1��ĸ���Ϊ0.3

end








