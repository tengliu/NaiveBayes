clear;
load fisheriris
%Use the default Gaussian distribution and a confusion matrix:

O2 = fitNaiveBayes(meas,species,'dist',...
{'normal','kernel','normal','kernel'}); 
C2 = O2.predict(meas);
cMat2 = confusionmat(species,C2)