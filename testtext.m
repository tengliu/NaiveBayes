% text=['ab';'bc';'cd';'de'];
% textCell=cellstr(text);
% [m,n]=size(textCell)
% textVec=text2vec(text,Dictionary)
Dictionary=cellstr(['ab';'cb';'ef']);
text=['ab','aa','aa'];
 textVec=text2vec(text,Dictionary)