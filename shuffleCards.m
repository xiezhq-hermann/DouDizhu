function cards = shuffleCards()
    cards = Card.empty(54,0);
    for idx = 1:54
        cards(idx) = Card(idx);
    end
    cards = cards(randperm(54));
end