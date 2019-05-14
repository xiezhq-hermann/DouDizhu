function setDizhu(players, restCards)
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description
    players(1).nickName = "Dizhu: " + players(1).nickName;
    players(2).nickName = "Farmer: " + players(2).nickName;
    players(3).nickName = "Farmer: " + players(3).nickName;
    players(1).updateDisplayName();
    players(2).updateDisplayName();
    players(3).updateDisplayName();
    
    players(1).cards = [players(1).cards, restCards];
    assert(length(players(1).cards) == 20)
    players(1).numHandCards = players(1).numHandCards + length(restCards);
    players(1).updateDisplayCards();
    players(2).updateDisplayCards();
    players(3).updateDisplayCards();

    players(1).board.updateCards(restCards, "extra");
    players(2).board.updateCards(restCards, "extra");
    players(3).board.updateCards(restCards, "extra");
end