classdef PerfectObservationSensor < handle
    properties
        ObstacleMatrix;
        sensorPosition;
        alhpa;
        d_limit;
    end
    
    methods
        function obj = ObservationSensor(ObstacleMatrix, sensorPosition, sensorAngleLimit, sensorDistanceLimit)
            obj.ObstacleMatrix = ObstacleMatrix;
            obj.sensorPosition = sensorPosition;
            obj.alpha = sensorAngleLimit;
            obj.d_limit = sensorDistanceLimit;
        end
        
        function output = detect(x_current, y_current, heading)
            xpos = x_current + obj.sensorPosition; % Assuming the previous referred to this
                                               %"+0.1" was just fixed and not a funciton of input
            ypos = y_current;
            
            psi = heading;
            
            for i = 1:length(obj.ObstacleMatrix)
                dx = obj.ObstacleMatrix(i).end_x - obj.ObstacleMatrix(i).starting_x;
                dy = obj.ObstacleMatrix(i).end_y - obj.ObstacleMatrix(i).starting_y;
                dr = norm([dx, dy]);
                
                D = det([obj.ObstacleMatrix(i).starting_x,  obj.ObstacleMatrix(i).end_x; obj.ObstacleMatrix(i).starting_y,  obj.ObstacleMatrix(i).end_y]);
                x_int1 = (D*dy + sign(dy)*dx*sqrt(((r^2)*(dr^2)) - D^2))/(dr^2);
                x_int2 = (D*dy + sign(dy)*dx*sqrt(((r^2)*(dr^2)) - D^2))/(dr^2);
                
                y_int1 = (-D*dx + abs(dy)*sqrt(((r^2)*(dr^2)) - D^2))/(dr^2);
                y_int2 = (-D*dx - abs(dy)*sqrt(((r^2)*(dr^2)) - D^2))/(dr^2);
                
            end
            
            
        end
    end
end