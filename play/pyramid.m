classdef pyramid
    %PYRAMID Summary of this class goes here
    %   class for drawing a simple 3D pyramid
    %% Andreas Bernatzky 27.12.2019
    %%
    
    properties
        cX; %centerpointX
        cY; %centerpointY
        cZ; %centerpointZ 
        p; %pyramidlength
        height; %height of the pyramid
    end
    
    methods
        function obj = pyramid(centerX,centerY,centerZ,pyramidBot,height)
            %PYRAMID Construct an instance of this class
            obj.cX = centerX;
            obj.cY = centerY;
            obj.cZ = centerZ;
            obj.p = pyramidBot;
            obj.height = height;
        end
        
        function  drawPyramid(obj)
            %drawPyramid
            % visualise a pyramid obj
            figure()
            hold on
            % Define the first sideFace (myDefault face) by vertices
            % Face 1 vertices create manually
            xFace1 = [obj.cX - obj.p; obj.cX + obj.p; obj.cX]; %xcoordinates of face1 vertices
            yFace1 = [obj.cY - obj.p; obj.cY - obj.p; obj.cY]; %ycoordinates of face1 vertices
            zFace1 = [obj.cZ; obj.cZ; obj.cZ + obj.height]; %zcoordinates of face1 vertices
            % Face 2 vertices (create by rotation)
            xFace2 = cos(pi/2) * (xFace1 - obj.cX) - sin(pi/2) * (yFace1 - obj.cY) + obj.cX; %xcoordinates of face2 vertices
            yFace2 = sin(pi/2) * (xFace1 - obj.cX) + cos(pi/2) * (yFace1 - obj.cY) + obj.cY; %ycoordinates of face2 vertices
            zFace2 = zFace1;%zcoordinates of face2 vertices just a copy not really needed
            % Face 3 vertices (create by rotation)
            xFace3 = cos(pi) * (xFace1 - obj.cX) - sin(pi) * (yFace1 - obj.cY) + obj.cX; %xcoordinates of face3 vertices
            yFace3 = sin(pi) * (xFace1 - obj.cX) + cos(pi) * (yFace1 - obj.cY) + obj.cY; %ycoordinates of face3 vertices
            zFace3 = zFace1;%zcoordinates of face3 vertices  just a copy not really needed 
            % Face 4 vertices (create by rotation)
            xFace4 = cos(pi + pi/2) * (xFace1 - obj.cX) - sin(pi + pi/2) * (yFace1 - obj.cY) + obj.cX; %xcoordinates of face4 vertices
            yFace4 = sin(pi + pi/2) * (xFace1 - obj.cX) + cos(pi + pi/2) * (yFace1 - obj.cY) + obj.cY; %ycoordinates of face4 vertices
            zFace4 = zFace1;%zcoordinates of face4 vertices  just a copy not really needed
            %[xcolumn,ycolumn,zcolumn]
            PyramidVertices = [xFace1 yFace1 zFace1; xFace2 yFace2 zFace2; xFace3 yFace3 zFace3; xFace4 yFace4 zFace4];
            PyramidFaces = [1 2 3;4 5 6; 7 8 9;10 11 12]; %connect the vertices to the faces
            patch('Vertices',PyramidVertices,'Faces',PyramidFaces,'FaceColor','g');         
        end
    end
end