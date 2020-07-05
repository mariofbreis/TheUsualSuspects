% Projecto de L�gica para Programa��o

%%% Grupo 54
%% S�rgio Augusto Lopes de Moura, N� 70257
%% M�rio Filipe Batalha Reis, N� 70969

%% existe(Suspeito, Suspeitos): indica se o Suspeito � um elemento
% que pertence � lista Suspeitos.

existe(Suspeito, Suspeitos) :-
        member(Suspeito, Suspeitos).


%% lado(Suspeito1, Suspeito2, Suspeitos): indica que o Suspeito1 e
% Suspeito2 est�o ao lado um do outro (independentemente de estar
% � esquerda/direita), na lista Suspeitos.

lado(Suspeito1, Suspeito2, Suspeitos):-
        nextto(Suspeito1, Suspeito2, Suspeitos).
lado(Suspeito1, Suspeito2, Suspeitos):-
        nextto(Suspeito2, Suspeito1, Suspeitos).


%% entre(Suspeito1, Suspeito2, Suspeito3, Suspeitos): indica que
% um suspeito2 est� entre o Suspeito1 e Suspeito3 na lista
% Suspeitos. Nada � dito sobre o que est� � esquerda/direita, mas
% pode-se inferir que os tr�s suspeitos est�o seguidos (s1 s2 s3
% ou s3 s2 s1).

entre(Suspeitos1, Suspeitos2, Suspeitos3, [Suspeitos1, Suspeitos2, Suspeitos3 | _]).
entre(Suspeitos1, Suspeitos2, Suspeitos3, [Suspeitos3, Suspeitos2, Suspeitos1 | _]).
entre(Suspeitos1, Suspeitos2, Suspeitos3, [_ | T]) :-
        entre(Suspeitos1, Suspeitos2, Suspeitos3, T).


%% esquerda(Suspeito1, Suspeito2, Suspeitos): indica que o
% Suspeito1 est� � esquerda do Suspeito2 (n�o necessariamente na
% posi��o imediatamente a seguir).

esquerda(Suspeito1, Suspeito2, [Suspeito1 | T]) :-
        existe(Suspeito2, T).
esquerda(Suspeito1, Suspeito2, [_ | T]) :-
        esquerda(Suspeito1, Suspeito2, T).


%% direita(Suspeito1, Suspeito2, Suspeitos): indica que o
% Suspeito1 est� � direita do Suspeito2 (n�o necessariamente na
% posi��o imediatamente a seguir).

direita(Suspeito1, Suspeito2, Suspeitos) :-
        esquerda(Suspeito2, Suspeito1, Suspeitos).


%% naoEntre(Suspeito1, Suspeito2, Suspeito3, Suspeitos): indica
% que o Suspeito2 n�o est� entre Suspeito1 e Suspeito3. Nada �
% dito sobre o que est� � esquerda/direita. No entanto, pode-se
% inferir que entre o Suspeito1 e Suspeito3 h� apenas uma posi��o.

naoEntre(Suspeito1, Suspeito2, Suspeito3, Suspeitos) :-
        entre(Suspeito1, Suspeito4, Suspeito3, Suspeitos),
        Suspeito4 \= Suspeito2.


%% ou(Suspeito1, Suspeito2, Suspeito3, Suspeitos): indica que o
% Suspeito1 � "o mesmo" que Suspeito2 ou que Suspeito3, mas n�o os
% dois.

ou(Suspeito1, Suspeito2, Suspeito3, Suspeitos) :-
        existe(Suspeito1, Suspeitos),
        existe(Suspeito2, Suspeitos),
        existe(Suspeito3, Suspeitos),
        ((Suspeito1 = Suspeito2, Suspeito1 \= Suspeito3);
        (Suspeito1 \= Suspeito2, Suspeito1 = Suspeito3)).