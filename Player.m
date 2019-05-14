classdef Player < handle
    properties
        nickName
        avatar
        board
        rival_1
        rival_2
        score = 50
        numHandCards = 17
    end
    methods
        function obj = Player(name)
            obj.board = Client;
            obj.nickName = name;
        end

        function initialize(obj, cards)
            % Delete UIFigure when app is deleted
            obj.board.Label.Text = obj.nickName;
            obj.board.SCOREEditField.Value = obj.score;
            obj.board.initialize(cards);
            obj.board.Label_1.Text = obj.rival_1.nickName;
            obj.board.SCOREEditField_1.Value = obj.rival_1.score;
            obj.board.Label_2.Text = obj.rival_2.nickName;
            obj.board.SCOREEditField_2.Value = obj.rival_2.score;
        end

        function delete(obj)
            % Delete UIFigure when app is deleted
            obj.board.delete;
        end

    end
    
end
