% Initialize the poker game
for idx = 1:54
    cards(idx) = Card(idx);
end
cards(randperm(54));


% invoke login page
start0 = Starter;
start1 = Starter;
start2 = Starter;
[indicator0, nickname0] =  start0.exec();
[indicator1, nickname1] =  start1.exec();
[indicator2, nickname2] =  start2.exec();

start0.delete;
start1.delete;
start2.delete;

if (indicator0 == -1 || indicator1 == -1 || indicator2 == -1)
    return
end


% initialize board for player
nicknames = [nickname0, nickname1, nickname2];
player0 = Player(nickname0);
player1 = Player(nickname1);
player2 = Player(nickname2);
players = [player0, player1, player2];


% initialize the player info
player0.rival_1 = player1;
player0.rival_2 = player2;
player1.rival_1 = player2;
player1.rival_2 = player0;
player2.rival_1 = player0;
player2.rival_2 = player1;
player0.initialize(cards(1:17));
player1.initialize(cards(18:34));
player2.initialize(cards(35:51));
restCards = cards(52:54);

% choose the Dizhu
if (player0.runForDizhu() == 1)
elseif (player1.runForDizhu() == 1)
    players = [player1, player2, player0]; 
elseif (player2.runForDizhu() == 1)
    players = [player2, player0, player1];
else
end
setDizhu(players, restCards);


% game start!
while (players(1).numHandCards ~= 0 && players(2).numHandCards ~= 0 && players(3).numHandCards ~= 0)
    outCard(players);
    players = [players(2), players(3), players(1)];
end

% pause(20)


% exit
player0.delete
player1.delete
player2.delete