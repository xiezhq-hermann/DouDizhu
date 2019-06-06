% Initialize the poker game
cards = shuffleCards();
% card_id = [1,2,5,6,17,21,29,33,37,38,41,42,43,45,46,47,54];
% card_id = [card_id, 3,4,9,10,11,12,18,19,22,23,25,26,30,34,39,48,49];
% card_id = [card_id, 7,8,13,14,15,16,20,24,27,28,31,32,35,36,40,50,51];
% card_id = [card_id, 44,52,53];
% cards = Card.empty(54,0);
% for idx = 1:54
%     cards(idx) = Card(card_id(idx));
% end
% invoke login page
starters = invokeLogin();
waitfor(starters(1), "indicator");
waitfor(starters(2), "indicator");
waitfor(starters(3), "indicator");
players = initializePlayer(starters);

% initialize the player info
restCards = distributeCard(players, cards);

% choose the Dizhu
runforDizhu(players, restCards);
% if (player0.runForDizhu() == 1)
% elseif (player1.runForDizhu() == 1)
%     players = [player1, player2, player0]; 
% elseif (player2.runForDizhu() == 1)
%     players = [player2, player0, player1];
% else
% end
% setDizhu(players, restCards);
waitfor(players(1).board.PASSButton, "Visible");

for player = players
    if (player.board.takeDizhu == 1)
        players = player.board.players;
        break;
    end
end
% game start!
% while (players(1).numHandCards ~= 0 && players(2).numHandCards ~= 0 && players(3).numHandCards ~= 0)
%     outCard(players);
%     players = [players(2), players(3), players(1)];
% end            
playerOnTurn = players(1);
outCard(players, playerOnTurn);

% endGame(players);

% pause(10)
% 
% players(1).delete
% players(2).delete
% players(3).delete