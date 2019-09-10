
% Your program goes here


/** <examples> Your example queries go here, e.g.
?- member(X, [cat, mouse]).
*/
%square(X,Y) :- Y is X*X.
f(X,Y):- X<6, Y is 3*X**2-1;
    X=6, Y is 8;
    Y is 2*X+4.
%f(10,Y).
%patrat([2,4,6],L).
%patrat([1,2,3,4,5,6,7],L).
patrat([],[]).
patrat([A|B],[A1|B1]):-
        A1 is A*A, patrat(B,B1).
%dublare numere pare
%A mod 2 =:=0 ,
dub_par([],[]).
dub_par([A|B],[A1|B1]):-
    A mod 2 =:=0  , A1 is A*A, dub_par(B,B1);
    A1 is A ,dub_par(B,B1).

%dub_imp([1,2,3,4,5,6,7],S).
dub_imp([],[]).
dub_imp([A|B],[A1|B1]):-
    A mod 2 =:=1  , A1 is A*A, dub_imp(B,B1);
    A1 is A ,dub_imp(B,B1).

sar_par([],[]).
/*
sar_par([A|B],[B1]):-
    A mod 2 =:= 0, sar_par(B,B1).
    */
%sar_par([1,2,3,4,5,6,7],S).
sar_par([A|B],[A1|B1]):-
    A mod 2 =:= 0, sar_par(B,[A1|B1]);
    A1 is A ,sar_par(B,B1).

/*
even(N) :- 
    N mod 2 =:= 0.    
doubleeven([],[]).
doubleeven([H|T], [H,H|Z]) :- even(H), !,
    doubleeven(T,Z).
doubleeven([H|T], [H|Z]) :-
    doubleeven(T,Z).
*/
%stergem aparitiile multiple a elemntului de pe prima pozitie din sirul de pe pozitia 2 si returnam in pozitia 3
%del(5,[3,5,2,5,2,3,5,1,2,4,5],Y).
%del(X,[],[]).
del(X,[X],[]).
del(X,[X|List],List1):- 
    del(X, List, List1).
del(X,[Y|List], List1):-
    del(X,List, List2),  append([Y], List2, List1).


increment(Y, Z):- 
    Y == 0, Z is 1;
    Z is Y+1.

even_elts(M,L) :-
  even_elts(M,0,[],L).

even_elts([H|T],I,Acc,Ans) :-
  ( I mod 2 =:= 0, append(Acc,[H], AccNew)
  ; I mod 2 =:= 1, AccNew = Acc
  ),
  Inew is I + 1,
  even_elts(T,Inew,AccNew,Ans).

even_elts([],_,Acc,Acc).



%list2set([2,3,4,2],L).
element_of(X,[X|_]).
element_of(X,[_|List]) :- element_of(X,List).

list2set([],[]).
list2set([H|List],[H|Set]) :- list2set(List,Set),not(element_of(H,Set)).
list2set([_|List],Set)     :- list2set(List,Set). 

%intersect([3,4,5],[1,2,3],L).
intersect([],_,[]).
intersect([H|List],List1,[H|Result]) :- intersect(List,List1,Result),element_of(H,List1),not(element_of(H,Result)).
intersect([_|List],List1,Result) :- intersect(List,List1,Result).


%solution(L,K,J,H).
word(atentat,a,t,e,n,t,a,t).
word(atentie,a,t,e,n,t,i,e).
word(antena,a,n,t,e,n,a).
word(tainic,t,a,i,n,i,c).
word(harnic,h,a,r,n,i,c).
word(atomar,a,t,o,m,a,r).
word(angina,a,n,g,i,n,a).
word(uniune,u,n,i,u,n,e).

solution(H1,H2,V1,V2) :- word(H1,_,X1,_,_,Y1,_),
			 word(H2,_,X2,_,_,Y2,_),
			 word(V1,_,X1,_,X2,_,_,_),
			 word(V2,_,Y1,_,Y2,_,_).

%merge([1,2,3,4],[2,6,7,8,3],Y).
merge([],List,List).
merge(List,[],List).
merge([H|List],[H1|List1],[H1|X]) :- H > H1, merge([H|List],List1,X).
merge([H|List],[H1|List1],[H|X])  :- merge(List,[H1|List1],X).


all_a([H]):-H==a.
all_a([H|T]):-H==a, all_a(T).
trans_a_b([],[]).
trans_a_b([a|T],L1):-(all_a(T);T==[]),trans_a_b(T,L2),(L1=[b|L2],length(L1,N1),length(T,N2),N3 is N2+1,N1==N3).

scalarMult(_,[],[]).
scalarMult(A,[H|T],L):-scalarMult(A,T,L1),X is H * A, L=[ X |L1].

dot([],[],0).
dot([H|T],[H1|T1],Result):-dot(T,T1,R1),Prod is H1 * H, Result is R1+Prod.

max([],0).
max([H|T],Result):-max(T,R1),(H>R1,Result is H ; H<R1, Result is R1).

adauga_final([],E,[E]).
adauga_final([H|T],E,[H|R]):-adauga_final(T,E,R).
reverse([],[]).
reverse([H|T],L):-reverse(T,L1),adauga_final(L1,H,L).
palindrome(L1):-reverse(L1,L2),egalitate(L1,L2).
egalitate([],[]).
egalitate([H|T],[H1|T1]):-H==H1, egalitate(T,T1).

remove_duplicates([],[]).
remove_duplicates([H|T],L):-remove_duplicates(T,L1),(\+member(H,L1),L=[H|L1]; member(H,L1),L=L1).



%-----
succesor([],[x]).
succesor([x|T],[x|T1]):-succesor(T,T1).

plus([],List2,List2).
plus([x|T],List2,[x|T2]):-plus(T,List2,T2).

times([],_,[]).
times([x],List,List):-!.
times([x|T],List,Rez):-times(T,List,Rez1),plus(List,Rez1,Rez).

%---
element_at([H|_],1,H).
element_at([_|T],N,X):-N1 is N-1, element_at(T,N1,X).

% insert sort
order([],[]).
order([H|T],R):-
 order(T,TR),
 put(H,TR,R).

 put(H,[],[H]):-!.
 put(H,[X|Y],[H,X|Y]):-
 H < X,!.
 put(H,[X|Y],[X|Z]):-
 put(H,Y,Z),!.

%Sorting by finding minimal/maximal element
min([X],X):-!.
 min([P|R],P):- min(R,X),X > P,!.
 min([P|R],X):- min(R,X),X =< P.

 max([X],X):-!.
 max([P|R],P):- max(R,X),X =< P,!.
 max([P|R],X):- max(R,X),X > P.

 min-sort([],[]):- !.
 min-sort(L,[M|LS]):-
 min(L,M),
 select(M,L,LM),
 min-sort(LM,LS).

 min-sort-iter(L,LS):-
 msi(L,[],LS).

 msi([],LS,LS):- !.
 msi(L,LA,LS):-
 max(L,M),
 select(M,L,LM),!,
 msi(LM,[M|LA],LS).












