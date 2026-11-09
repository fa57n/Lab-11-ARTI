% Lab 11 - The Name Game

:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start :-
    writeln('Hi. This is the Name Game.'),
    writeln('You will be given a set of English letters'),
    writeln('which you can add, delete or move to create your name.'),
    menu.

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
    action(Choice).

action(1) :-
    findall(X, letter(X), Letters),
    writeln(Letters),
    menu.

action(2) :-
    write('Enter a letter: '),
    read(X),
    assertz(letter(X)),
    menu.

action(3) :-
    write('Enter a letter: '),
    read(X),
    asserta(letter(X)),
    menu.

action(4) :-
    write('Enter a letter: '),
    read(X),
    assertz(letter(X)),
    menu.

action(5) :-
    write('Enter a letter to delete: '),
    read(X),
    (retract(letter(X)) ->
        writeln('Letter deleted')
    ;
        writeln('Letter not found')
    ),
    menu.

action(6) :-
    retractall(letter(_)),
    writeln('All letters deleted'),
    menu.

action(7) :-
    writeln('Goodbye!').

action(_) :-
    writeln('Invalid choice'),
    menu.
