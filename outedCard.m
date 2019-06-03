function outedCard(players, outCards, prev_player)
    players(1).board.Lamp.Visible = false;
    players(2).board.Lamp_2.Visible = false;
    players(3).board.Lamp_1.Visible = false;
    playerOnTurn = players(1);
    if isempty(outCards)
        players = [players(2), players(3), players(1)];
        outCard(players,prev_player);
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
        
        if (players(1).numHandCards ~= 0 && players(2).numHandCards ~= 0 && players(3).numHandCards ~= 0)
            players = [players(2), players(3), players(1)];
            outCard(players, playerOnTurn);
        else
            endGame(players);
        end
    end
end