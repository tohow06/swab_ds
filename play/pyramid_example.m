% plotting a Objectorientated pyramid
%% Andreas Bernatzky 27.12.19
%%
clear all;
close all;
% define centerpoint
x = 1; 
y = 2;
z = 3;
% define length
l = 7;
% define height
h = 5;

myPyramid = pyramid(x,y,z,l,h);
myPyramid.drawPyramid();
grid on
axis vis3d
view(3);