%% 

clc;
close all;
clear ;

%% constants
q1 = [-25 25];
q2 = [-45 45];
l1 = 10;
l2 = 10;
l3 = 10;
R = 8;

%%
RCM = [0 0 l1+l3];
yaw_l = sum(R*cosd(q2));
pitch_l = sum(R*cosd(q1));


%%
% N=10 time=0.197
% N=20 time=0.422
% N=30 time=1.043
% N=50 time=13.947
NR = 50;
Nq1 = NR;
Nq2 = Nq1;
endX = [];
endY = [];
endZ = [];
for Ri = linspace(0,8,NR)
    for q1i = linspace(q1(1),q1(2),Nq1)
        for q2i = linspace(q2(1),q2(2),Nq2)
            endX = [endX Ri.*cosd(q1i).*cosd(q2i)];
            endY = [endY Ri.*cosd(q1i).*sind(q2i)];
            endZ = [endZ Ri.*sind(q1i) + RCM(3)];

        end
    end
%     disp("done a Ri")
end

plot3(endX,endY,endZ,'o','color','red');
hold on
% axis([0 R -6 6 0 (RCM(3)+R*10)]);
% axis equal
axis vis3d
grid on


%% use meshgrid may be faster

% [X,Y] = meshgrid(1:0.5:10,1:20);
% Z = sin(X) + cos(Y);
% surf(X,Y,Z)



