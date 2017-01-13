function [ textVec] = text2vec( text,Dictionary,len)
%text是一个文本胞体，向量中的每个单词长度一致;Dictionary是一个矩阵，每一行是一个单词
%返回一个特征数量长度的0-1数组。
Dictionary=cellstr(Dictionary);%将Dictionary转换成胞体列向量
[m,n]=size(Dictionary);
%Dictionary是一个胞体列向量,由于一个单词为一个胞体，n的值为1,m的值即为特征数量
textVec=zeros(1,m);
for i=1:m
    
        if(((strfind(char(text),char(Dictionary(i,:))))>0)&((strfind(char(text),char(Dictionary(i,:))))<48))
        textVec(i)=1;
        else
        textVec(i)=0;
        end
    

end
