classdef HelloClass
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        x;
        y;
    end
    
    methods
    
        function obj =  HelloClass()
            obj.x = (1:0.01:3)';
            obj.y = sin(x) + normrnd(0,0.1,size(x,1),1);
        end 
        
        function obj =  plotIt()
            plot(obj.x,obj.y);
            obj.x;
        end
    end
    
end

