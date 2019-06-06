function sorted = sortCards(cards)
    [~, ind] = sort([cards.ID]);
    sorted = cards(ind);
end