/*
 * **********************************************
 * Printing result depth
 *
 * You can enlarge it, if needed.
 * **********************************************
 */
maximum_printing_depth(100).

:- current_prolog_flag(toplevel_print_options, A),
   (select(max_depth(_), A, B), ! ; A = B),
   maximum_printing_depth(MPD),
   set_prolog_flag(toplevel_print_options, [max_depth(MPD)|B]).

% Signature: sub_list(Sublist, List)/2
% Purpose: All elements in Sublist appear in List in the same order.
% Precondition: List is fully instantiated (queries do not include variables in their second argument).

sub_list([],[]).
sub_list([Head | SubTail],[Head | Tail]) :- sub_list(SubTail,Tail). %if Subtail is a sublist of Tail then concating head to SubTail is a sub_list of concated Head to Tail
sub_list(SubTail,[Head | Tail]) :- sub_list(SubTail,Tail). %if Subtail is a sub list of tail then he is also a sub list of head concated to tail

% Signature: swap_list(List, InversedList)/2
% Purpose: InversedList is the ‘mirror’ representation of List, i.e, each item in the list is recursively replaced with the item at the position, with refers to the beginning and the end of the list.   

% Helper procedure to append two lists
my_append([], L, L).
my_append([H|T], L, [H|R]) :- my_append(T, L, R).

% Case 1: Empty list
swap_list([], []) :- !.

% Case 2: The Head is itself a list.
swap_list([[X|Y] | Tail], InversedList) :- !,
    swap_list([X|Y], SwappedHead),
    swap_list(Tail, SwappedTail),
    my_append(SwappedTail, [SwappedHead], InversedList).

% Case 3: The Head is a regular element.
swap_list([Head|Tail], InversedList) :-
    swap_list(Tail, SwappedTail),
    my_append(SwappedTail, [Head], InversedList).






% Signature: sub_tree(Subtree, Tree)/2
% Purpose: Tree contains Subtree.


% Case 1: Search recursively in the Left subtree first
sub_tree(Subtree, tree(_, Left, _)) :- sub_tree(Subtree, Left).

% Case 2: Search recursively in the Right subtree next
sub_tree(Subtree, tree(_, _, Right)) :- sub_tree(Subtree, Right).

% Case 3: Match the current tree structure itself
sub_tree(tree(X, Left, Right), tree(X, Left, Right)).


% Signature: swap_tree(Tree, InversedTree)/2
% Purpose: InversedTree is the �mirror� representation of Tree.

% Case 1: Base case
swap_tree(void,void):- !.

% Case 2: Recursive case
swap_tree(tree(Element, Left, Right), tree(Element, SwappedRight, SwappedLeft)) :- !,
    swap_tree(Left, SwappedLeft),
    swap_tree(Right, SwappedRight).