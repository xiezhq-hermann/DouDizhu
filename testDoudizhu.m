classdef testDoudizhu < matlab.uitest.TestCase
   methods (Test)
       function test_demo1(testCase)
           % initialize cards for demo1
           card_id = [1,2,3,5,6,9,13,17,21,29,30,41,42,43,45,46,47];
           card_id = [card_id, 4,10,11,12,14,15,18,19,22,23,25,31,33,37,44,48,49];
           card_id = [card_id, 7,8,16,20,24,26,27,28,32,34,35,36,38,39,40,50,51];
           card_id = [card_id, 52,53,54];
           cards = Card.empty(54,0);
            for idx = 1:54
                cards(idx) = Card(card_id(idx));
            end
            % invoke login page
            starters = invokeLogin();
            testCase.type(starters(1).YourNameEditField, "1");
            testCase.press(starters(1).StartGameButton);
            testCase.type(starters(2).YourNameEditField, "2");
            testCase.press(starters(2).StartGameButton);
            testCase.type(starters(3).YourNameEditField, "3");
            testCase.press(starters(3).StartGameButton);
            players = initializePlayer(starters);
            % distribute cards
            restCards = distributeCard(players, cards);
            % go for Dizhu
            runforDizhu(players, restCards);
            testCase.press(players(1).board.DropButton);
            testCase.press(players(2).board.TakeButton);
            % game start!
            % round one
            players = [players(2), players(3), players(1)];
            
            playerOnTurn = players(1);
            outCard(players, playerOnTurn);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_1.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_2.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_3.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);

            playerOnTurn = players(2);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_3.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_6.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_7.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_8.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(3);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(1);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            %round two
            playerOnTurn = players(2);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_5.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_6.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_8.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_11.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_12.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_13.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(3);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_11.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_12.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_13.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_14.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_15.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_16.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_17.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.RESETButton);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_11.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_12.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_13.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_14.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_15.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_16.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_17.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(1);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(2);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            % round 3
            playerOnTurn = players(3);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_11.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_12.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_13.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(1);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_11.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_12.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_13.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_14.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.RESETButton);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_11.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_12.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_13.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(2);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(3);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            % round 4
            playerOnTurn = players(1);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_4.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_5.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_6.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_7.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_8.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(2);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(3);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            % round 5
            playerOnTurn = players(1);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_7.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(2);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(3);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(1);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            % round 6
            playerOnTurn = players(2);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_8.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(3);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(1);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_8.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(2);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(3);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            % round 7
            playerOnTurn = players(1);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
       end
       
       function test_demo2(testCase)
           % initialize cards for demo1
           card_id = [1,2,5,6,17,21,29,33,37,38,41,42,43,45,46,47,54];
           card_id = [card_id, 3,4,9,10,11,12,18,19,22,23,25,26,30,34,39,48,49];
           card_id = [card_id, 7,8,13,14,15,16,20,24,27,28,31,32,35,36,40,50,51];
           card_id = [card_id, 44,52,53];
           cards = Card.empty(54,0);
            for idx = 1:54
                cards(idx) = Card(card_id(idx));
            end
            % invoke login page
            starters = invokeLogin();
            testCase.type(starters(1).YourNameEditField, "1");
            testCase.press(starters(1).StartGameButton);
            testCase.type(starters(2).YourNameEditField, "2");
            testCase.press(starters(2).StartGameButton);
            testCase.type(starters(3).YourNameEditField, "3");
            testCase.press(starters(3).StartGameButton);
            players = initializePlayer(starters);
            % distribute cards
            restCards = distributeCard(players, cards);
            % go for Dizhu
            runforDizhu(players, restCards);
            testCase.press(players(1).board.TakeButton);
            
            % game start!
            % round one
            players = [players(1), players(2), players(3)];
            
            playerOnTurn = players(1);
            outCard(players, playerOnTurn);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_1.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(2);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(3);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_1.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_2.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(1);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(2);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            % round 2
            playerOnTurn = players(3);
            outCard(players, playerOnTurn);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_2.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_3.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_4.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_5.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_6.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_8.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.RESETButton);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_2.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_3.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_4.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_5.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_6.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_7.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(1);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(2);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_3.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_4.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_5.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_6.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(3);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(1);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            % round 3
            playerOnTurn = players(2);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_5.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_6.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_7.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_8.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(3);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_5.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_6.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_7.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_8.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(1);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_11.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_16.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(2);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(3);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            %round 4
            playerOnTurn = players(1);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_3.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_4.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(2);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(3);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_10.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(1);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_13.Position(1:2)+[10,10]);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_15.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(2);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(3);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            % round 5
            playerOnTurn = players(1);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_6.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
            
            playerOnTurn = players(2);
            pause(2);
            testCase.press(playerOnTurn.board.PASSButton);
            
            playerOnTurn = players(3);
            testCase.press(playerOnTurn.board.UIFigure,playerOnTurn.board.Button_9.Position(1:2)+[10,10]);
            pause(2);
            testCase.press(playerOnTurn.board.OUTButton);
       end
   end
end