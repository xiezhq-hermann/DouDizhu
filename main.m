% Initialize the poker game
cards = shuffleCards();

% invoke login page
starters = invokeLogin();
waitfor(starters(1), "indicator");
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
while (players(1).numHandCards ~= 0 && players(2).numHandCards ~= 0 && players(3).numHandCards ~= 0)
    outCard(players);
    players = [players(2), players(3), players(1)];
end

endGame(players);

% pause(10)
% 
% players(1).delete
% players(2).delete
% players(3).delete