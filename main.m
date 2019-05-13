% Initialize the poker game
for idx = 1:54
    cards(idx) = Card(idx);
end

start = Starter;
[indicator, nickname] =  start.exec();
start.delete
if (indicator == -1)
    return
end

% invoke login page
user0 = Player(nickname);
user1 = Player(nickname);
user2 = Player(nickname);

pause(5)

% exit
user0.delete
user1.delete
user2.delete