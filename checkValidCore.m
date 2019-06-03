function result = checkValidCore(toOut, prevCards)
    if isempty(toOut)
        result = false;
        return
    end
    type_out = classify(toOut);
    if (isempty(prevCards) && type_out ~= "unknown")
        result = true;
        return;
    end
    
    type_pre = classify(prevCards);
    if (type_out == "Joker")
        result = true;
    elseif (type_out == "bomb" && type_pre ~= "bomb" && type_pre ~= "Joker")
        result = true;
    elseif (type_out ~= "unknown" && type_out == type_pre)
        result = true;
    else
        result = false;
    end
end