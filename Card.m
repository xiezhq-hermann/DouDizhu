classdef Card
    %CARD Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        ID
        Suit
        Number
        Icon
    end
    
    methods
        function obj = Card(ID)
            %CARD Construct an instance of this class
            %   Detailed explanation goes here
            obj.ID = ID;
            obj.Icon = "img/" + string(ID) + ".jpg";
            obj.Number = ceil(ID/4);
            if (ID == 54)
                obj.Number = 15;
            end
        end
        
        function suit = getSuit(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            % suit = 
        end

        function number = GetNumber(obj)
            % number = 
        end

        function priority = GetPriority(input)
        %myFun - Description
        %
        % Syntax: output = myFun(input)
        %
        % Long description
            % priority = 
        end 
    end
end

