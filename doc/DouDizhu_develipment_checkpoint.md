## DouDizhu development checkpoint

### *Zhiqiang Xie*

### From Requirement to Development Plan

Based on the requirements my teammate collected and the dev plan he proposed. We first clarify our final target and prepare a more specific plan with a less steep effort curve:

- What we target is to build a real DouDizhu poker game system to let three person sit down and open the application, then they'll be connected to a server, follow the instructions, make their decisions on picking poker cards and have a lot of fun.
- To achieve the final goal, there are something should be noticed in prior iterations:
  - Don't use one GUI for three person, even for testing some functions. The effort to separate the GUI is considered to exceed the effort to rebuild one. Three separate GUIs are eligible to simulate the real scenarios.
  - The **interaction interface** is the most flexible and also the most challenge part in this project. To keep a good iteration of adding functions of the interfaces, we obey a coherent rules for both interface design and underlying component implementations:
    - We deploy **a flexible communication protocol** between server and client, and all queries from clients follow the same interface, which is good for extensibility.
    - In original requirement, there are no GUI components, we convert the **event trigger** style use cases to a set of callback functions, which is directly mapped to GUI components we deployed.
- Specifically, what we have done in this iteration:
  - A starter interface to record the information from gamer (currently name, but other elements are already prepared either)
  - A set of procedures of server from collecting the information, initializing the poker game board for every gamer to moderating the processing of game till one of the gamer win.
  - A poker game board interface for gamer with "pass", "tip", "out" instructions.

### Implemented interface for your reference

Here is the starter for all gamers, note that the "Loding..." means a and b are waiting c to be prepared

![starter](C:\Users\xiezh\Documents\MATLAB\DouDizhu\doc\starter.png)

Here is the interface just initialized, every gamer has its name, cards, score, number of  others' cards, etc. The gamer "c" is considering whether taking the chance to be Dizhu. ![runForDizhu](C:\Users\xiezh\Documents\MATLAB\DouDizhu\doc\runForDizhu.png)

Here it's the interface starting the game! Here you can see the identity, the green light indicate who is running his turn.

![first_turn](C:\Users\xiezh\Documents\MATLAB\DouDizhu\doc\first_turn.png)

Here "c" is outing his cards and other players also saw it in the center of the board.

![outCardExample](C:\Users\xiezh\Documents\MATLAB\DouDizhu\doc\outCardExample.png)

Here shows how the gamer pick his cards during the game.

![pickCards](C:\Users\xiezh\Documents\MATLAB\DouDizhu\doc\pickCards.png)

The second player is outing his cards:

![second_trial](C:\Users\xiezh\Documents\MATLAB\DouDizhu\doc\second_trial.png)

### Conclusion

In this iteration, we have almost prepared any interaction interface for final goals, which means the validation and testing about the GUI could be executed concurrently with my future development. Here are some functions to be implemented:

- Currently, the validation check of the cards to be outing is not sufficient. But the interface is well prepared in both client and server.
- Fix some known bug, here we're simulating the four process (1 server + 3 player) in one CPU thread. Here are risks to deadlock, actually we found matlab internal "waitfor" statement will stuck the process severely. This demo is developed in MATLAB 2019a (Linux 64bit), compatibility also matters.