function endGame(players)

    for idx = 1:3
        player = players(1);
        if (player.board.takeDizhu == 1)
            if (player.numHandCards == 0)
                player.board.finish("win");
                players(2).board.finish("lose");
                players(3).board.finish("lose");
            else
                player.board.finish("lose");
                players(2).board.finish("win");
                players(3).board.finish("win");
            end
            break;
        end
        players = [players(2), players(3), players(1)];
    end
    
    pause(10)

    players(1).delete
    players(2).delete
    players(3).delete

end