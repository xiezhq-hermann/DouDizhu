function outCard(players)
    %myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description
    players(1).board.Lamp.Visible = true;
    players(2).board.Lamp_2.Visible = true;
    players(3).board.Lamp_1.Visible = true;

    playerOnTurn = players(1);
    outCards = playerOnTurn.myTurn();

    if isempty(outCards)
    else
        for card = outCards
            for idx = 1:length(playerOnTurn.cards)
                if (playerOnTurn.cards(idx).ID == card.ID)
                    playerOnTurn.cards(idx) = [];
                    break;
                end
            end
        end
        playerOnTurn.updateDisplayCards();
        playerOnTurn.numHandCards = length(playerOnTurn.cards);
    
        players(1).updateDisplayCards();
        players(2).updateDisplayCards();
        players(3).updateDisplayCards();
    
        players(1).board.updateCards(outCards, "out");
        players(2).board.updateCards(outCards, "out");
        players(3).board.updateCards(outCards, "out");
    end

    players(1).board.Lamp.Visible = false;
    players(2).board.Lamp_2.Visible = false;
    players(3).board.Lamp_1.Visible = false;
end