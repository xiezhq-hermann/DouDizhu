function players = initializePlayer(starters)
    [indicator0, nickname0] =  starters(1).getName();
    [indicator1, nickname1] =  starters(2).getName();
    [indicator2, nickname2] =  starters(3).getName();

    starters(1).delete;
    starters(2).delete;
    starters(3).delete;
    
    if (indicator0 == -1 || indicator1 == -1 || indicator2 == -1)
        error("Someone quit the game");
    end

    % initialize board for player
    d = get(0, 'screensize');
    player0 = Player(nickname0, 0, d(4)/2);
    player1 = Player(nickname1, d(3)/2, d(4)/2);
    player2 = Player(nickname2, 0, 0);

    % initialize the player info
    player0.rival_1 = player1;
    player0.rival_2 = player2;
    player1.rival_1 = player2;
    player1.rival_2 = player0;
    player2.rival_1 = player0;
    player2.rival_2 = player1;
    
    players = [player0, player1, player2];
end