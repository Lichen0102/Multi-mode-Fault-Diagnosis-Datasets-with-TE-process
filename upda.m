clear all;
clc;
load Mode6xInitial
for i =1:35
    blockName = xInitial.signals(i).blockName;
    blockName(15) = '6';
    xInitial.signals(i).blockName = blockName;
end
save ('Mode6xInitial.mat','xInitial')