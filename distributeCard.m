function restCards = distributeCard(players, cards)
    players(1).initialize(sortCards(cards(1:17)));
    players(2).initialize(sortCards(cards(18:34)));
    players(3).initialize(sortCards(cards(35:51)));
    restCards = cards(52:54);
end