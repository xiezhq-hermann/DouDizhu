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
       end
   end
end