function [ pxj,pj ] = nbc_train( data,label )
% p(ci/w)=p(w/ci)*p(ci)/p(w),pxj=p(w/ci),pj=p(ci)
%data一行代表一个数据的全部特征取值
[N,l]=size(data);           %N代表输入数据的行数(输入了N个数据)
wn=length(unique(label));   %wn代表有多少类
wm(1:wn)=0;                 %初始化跟类数相同的0向量
pxj=zeros(wn,l);            %pxj为跟类数相同的列向量

for j=1:wn                  %j 代表第 j类
   idx=(label==(j-1));      %判断label是不是第j类 ,idx是一个向量 ，idx的 3，5，7行为1，代表data的3，5，7行为该类
   wm(j)=sum(idx);          %wm为行向量，wm（j）存储第几类有几个，若wm（3）=9，说明第三类有9个元素
   pxj(j,:)=(sum(data(idx,:)>0)+1)/(wm(j)+wn);%data是一个特征矩阵，data的idx（向量）行>0说明该特征取1,(data(idx,:)>0)获得一个0 1行向量，记录哪些特征为1，
                                   % (sum(data(idx,:)>0)+1)表示有多少个特征为1       sum(data(idx,:))表示有多少个特征w取1（p(w)） ，总之表示p(w/ci)= p(w)+1/(sum(ci)+n)
end

pj=wm/N;   %pj为向量, pj=某类数量/总数量  =p（ci） p(c1)=0.3 表示c1类的概率为0.3

end








