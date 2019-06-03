function type = classify(cards)
%     for card = cards
%         disp(num2str(card.Number));
%     end
    if (length(cards) == 2 && (cards(1).Number == 14 || cards(2).Number == 14) && (cards(1).Number == 15 || cards(2).Number == 15))
        disp("Joker!");
        type = "Joker";
    elseif (length(cards) == 4 && cards(1).Number == cards(2).Number &&  cards(2).Number == cards(3).Number && cards(3).Number == cards(4).Number)
        disp("bomb!");
        type = "bomb";
    elseif (length(cards) == 8 && cards(3).Number == cards(4).Number &&  cards(4).Number == cards(5).Number && cards(6).Number == cards(7).Number && cards(7).Number == cards(8).Number)
        disp("airplane");
        type = "airplane";
    elseif (length(cards) == 6 && cards(1).Number == cards(2).Number && cards(2).Number == cards(3).Number && cards(3).Number == cards(4).Number)
        disp("four with two");
        type = "fourTwo";
    elseif (length(cards) == 4 && cards(4).Number == cards(2).Number &&  cards(2).Number == cards(3).Number)
        disp("three with one");
        type = "fourTwo";
    elseif (mod(length(cards),2) == 0 && length(cards) >= 6 && cards(1).Number == cards(2).Number &&  cards(3).Number == cards(4).Number && cards(5).Number == cards(6).Number)
        disp("sequence pair");
        type = "seqPair";
    elseif (length(cards) == 1)
        disp("single");
        type = "single";
    elseif (length(cards) == 2 && cards(1).Number == cards(2).Number)
        disp("pair");
        type = "pair";
    else
        len = length(cards);
        if (len >= 5 && cards(len).Number ~= 13)
            for i = 2:len
                if (cards(i).Number ~= cards(i-1).Number+1) 
                    disp("unknown")
                    type = "unknown";
                    return
                end
            end
            disp("sequence")
            type = "sequence";            
        else
            disp("unknown")
            type = "unknown";
        end
    end
end