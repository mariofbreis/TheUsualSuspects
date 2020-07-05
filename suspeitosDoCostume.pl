% Projecto de Lógica para Programação

%%% Grupo 54
%% Sérgio Augusto Lopes de Moura, Nº 70257
%% Mário Filipe Batalha Reis, Nº 70969

%% existe(Suspeito, Suspeitos): indica se o Suspeito é um elemento
% que pertence à lista Suspeitos.

existe(Suspeito, Suspeitos) :-
        member(Suspeito, Suspeitos).


%% lado(Suspeito1, Suspeito2, Suspeitos): indica que o Suspeito1 e
% Suspeito2 estão ao lado um do outro (independentemente de estar
% à esquerda/direita), na lista Suspeitos.

lado(Suspeito1, Suspeito2, Suspeitos):-
        nextto(Suspeito1, Suspeito2, Suspeitos).
lado(Suspeito1, Suspeito2, Suspeitos):-
        nextto(Suspeito2, Suspeito1, Suspeitos).


%% entre(Suspeito1, Suspeito2, Suspeito3, Suspeitos): indica que
% um suspeito2 está entre o Suspeito1 e Suspeito3 na lista
% Suspeitos. Nada é dito sobre o que está à esquerda/direita, mas
% pode-se inferir que os três suspeitos estão seguidos (s1 s2 s3
% ou s3 s2 s1).

entre(Suspeitos1, Suspeitos2, Suspeitos3, [Suspeitos1, Suspeitos2, Suspeitos3 | _]).
entre(Suspeitos1, Suspeitos2, Suspeitos3, [Suspeitos3, Suspeitos2, Suspeitos1 | _]).
entre(Suspeitos1, Suspeitos2, Suspeitos3, [_ | T]) :-
        entre(Suspeitos1, Suspeitos2, Suspeitos3, T).


%% esquerda(Suspeito1, Suspeito2, Suspeitos): indica que o
% Suspeito1 está à esquerda do Suspeito2 (não necessariamente na
% posição imediatamente a seguir).

esquerda(Suspeito1, Suspeito2, [Suspeito1 | T]) :-
        existe(Suspeito2, T).
esquerda(Suspeito1, Suspeito2, [_ | T]) :-
        esquerda(Suspeito1, Suspeito2, T).


%% direita(Suspeito1, Suspeito2, Suspeitos): indica que o
% Suspeito1 está à direita do Suspeito2 (não necessariamente na
% posição imediatamente a seguir).

direita(Suspeito1, Suspeito2, Suspeitos) :-
        esquerda(Suspeito2, Suspeito1, Suspeitos).


%% naoEntre(Suspeito1, Suspeito2, Suspeito3, Suspeitos): indica
% que o Suspeito2 não está entre Suspeito1 e Suspeito3. Nada é
% dito sobre o que está à esquerda/direita. No entanto, pode-se
% inferir que entre o Suspeito1 e Suspeito3 há apenas uma posição.

naoEntre(Suspeito1, Suspeito2, Suspeito3, Suspeitos) :-
        entre(Suspeito1, Suspeito4, Suspeito3, Suspeitos),
        Suspeito4 \= Suspeito2.


%% ou(Suspeito1, Suspeito2, Suspeito3, Suspeitos): indica que o
% Suspeito1 é "o mesmo" que Suspeito2 ou que Suspeito3, mas não os
% dois.

ou(Suspeito1, Suspeito2, Suspeito3, Suspeitos) :-
        existe(Suspeito1, Suspeitos),
        existe(Suspeito2, Suspeitos),
        existe(Suspeito3, Suspeitos),
        ((Suspeito1 = Suspeito2, Suspeito1 \= Suspeito3);
        (Suspeito1 \= Suspeito2, Suspeito1 = Suspeito3)).