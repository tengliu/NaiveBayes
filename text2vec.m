function [ textVec] = text2vec( text,Dictionary,len)
%text��һ���ı����壬�����е�ÿ�����ʳ���һ��;Dictionary��һ������ÿһ����һ������
%����һ�������������ȵ�0-1���顣
Dictionary=cellstr(Dictionary);%��Dictionaryת���ɰ���������
[m,n]=size(Dictionary);
%Dictionary��һ������������,����һ������Ϊһ�����壬n��ֵΪ1,m��ֵ��Ϊ��������
textVec=zeros(1,m);
for i=1:m
    
        if(((strfind(char(text),char(Dictionary(i,:))))>0)&((strfind(char(text),char(Dictionary(i,:))))<48))
        textVec(i)=1;
        else
        textVec(i)=0;
        end
    

end
