function starters = invokeLogin()
    % invoke login page
    d = get(0, 'screensize');
    starters(1) = Starter(0,0);
    starters(2) = Starter(d(3)/3,0);
    starters(3) = Starter(d(3)*2/3,0);
end