clc;
close all;
clear vars;


rcm_point = [0,0,0];
xrot_ang = 0 /180*pi;
yrot_ang = 0 /180*pi;


[X,Y,Z]=cylinder([0 1],1000);

% axis([0 +3,0 +3,0 +3])   %change axis range
% axis equal
xlabel('x');
ylabel('y');
zlabel('z');

M=makehgtform('translate', rcm_point, 'xrotate', xrot_ang, 'yrotate', yrot_ang);    %translate and rotate
h=surf(X,Y,Z,'Parent',hgtransform('Matrix',M),'LineStyle','none','FaceAlpha',0.3);
view([-75,35])  %change view angle
axis vis3d %hold ratio when viewing 3D
grid on