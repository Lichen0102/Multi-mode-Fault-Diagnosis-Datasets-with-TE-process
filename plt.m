save('m200','m200')
load m100.mat
load m101.mat
n=1:100;
scatter(n*4,m100(1:100,1),'b')
hold on
scatter(n*4,m200(1:100,1),'r')

