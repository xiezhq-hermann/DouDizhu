classdef Player < handle
    properties
        nickName
        avatar
        board
        cards
        rival_1
        rival_2
        score = 50
        numHandCards = 17
    end
    methods
        function updateDisplayName(obj)
            %myFun - Description
            obj.board.Label.Text = obj.nickName;
            obj.board.Label_1.Text = obj.rival_1.nickName;
            obj.board.Label_2.Text = obj.rival_2.nickName;
        end
        function updateDisplayScore(obj)
            %myFun - Description
            obj.board.SCOREEditField.Value = obj.score;
            obj.board.SCOREEditField_1.Value = obj.rival_1.score;
            obj.board.SCOREEditField_2.Value = obj.rival_2.score;
        end
        function updateDisplayCards(obj)
            % Long description
            obj.board.updateCards(obj.cards, "hold");
            obj.board.EditField_1.Value = length(obj.rival_1.cards);
            obj.board.EditField_2.Value = obj.rival_2.numHandCards;
        end
    end
    methods
        function obj = Player(name)
            obj.board = Client;
            obj.nickName = name;
        end

        function initialize(obj, cards)
            % Delete UIFigure when app is deleted
            obj.cards = cards;
            updateDisplayName(obj);
            updateDisplayScore(obj);
            obj.board.initialize(cards);

        end

        function output = runForDizhu(obj)
            %myFun - Description
            output = obj.board.runForDizhu();
            
        end

        function outCards = myTurn(obj)
            outCards = obj.board.myTurn();
        end

        function delete(obj)
            % Delete UIFigure when app is deleted
            obj.board.delete;
        end

    end
    
end
