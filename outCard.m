function outCard(players, prev_player)
    %myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description
    players(1).board.Lamp.Visible = true;
    players(2).board.Lamp_2.Visible = true;
    players(3).board.Lamp_1.Visible = true;
    players(1).myTurn(players, prev_player);
end