
:- dynamic letter/1.

% Start the game
start :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)),
    writeln('Hi. This is the Name Game.'),
    writeln('You will be given a set of English letters'),
    writeln('to add, delete or move to create your name.'),
    menu.

% Display the menu
menu :-
    nl,
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the bottom'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    write('Enter your choice: '),
    read(Choice),
    ( Choice == 7 ->
        writeln('Goodbye!')
    ;
        option(Choice),
        menu
    ).

% Option 1: Display letters
option(1) :-
    findall(X, letter(X), Letters),
    write('Current letters: '),
    writeln(Letters).

% Option 2: Add a letter
option(2) :-
    get_letter(X),
    assert(letter(X)),
    writeln('Letter added.').

% Option 3: Add a letter at the top
option(3) :-
    get_letter(X),
    asserta(letter(X)),
    writeln('Letter added at the top.').

% Option 4: Add a letter at the bottom
option(4) :-
    get_letter(X),
    assertz(letter(X)),
    writeln('Letter added at the bottom.').

% Option 5: Delete a letter
option(5) :-
    get_letter(X),
    ( retract(letter(X)) ->
        writeln('Letter deleted.')
    ;
        writeln('Letter not found.')
    ).

% Option 6: Delete all letters
option(6) :-
    retractall(letter(_)),
    writeln('All letters deleted.').

% Invalid choice
option(_) :-
    writeln('Invalid choice.').

% Read a letter
get_letter(X) :-
    write('Enter a letter followed by a dot: '),
    read(X).
