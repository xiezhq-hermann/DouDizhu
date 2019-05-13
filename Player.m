classdef Player
    properties
        nickName
        score = 50
        numHandCards
        board
    end
    methods
        function obj = Player(name)
            obj.board = Client
            obj.nickName = name
        end

        function delete(obj)
            % Delete UIFigure when app is deleted
            obj.board.delete
        end
    end
    
end
