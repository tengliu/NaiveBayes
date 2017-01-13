meas=[1 2 3;4 5 6;7 8 9];
species=[0;1;1];
O2 = NaiveBayes.fit(meas,species,'dist',{'normal','kernel','normal','kernel'});
C1 = O1.predict(O2,meas);
cMat1 = confusionmat(species,C1)