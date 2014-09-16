%-------------------
% PART LIBRARY
%-------------------

%-- p1 is a promoter
promoter(p1).
promoter(p2).

rbs(rbs1).
rbs(rbs2).

gene(g1).
gene(g2).

terminator(t1).
terminator(t2).


%-------------------
% PRODUCTION RULES
%-------------------

% we do not allow, that an empty list 
% is a transcriptional unit
%is_tu([]).


% here, we define a transcriptional unit 
% based on the followind production rules:

%-- it starts with a promoter
%-- followed by an RBS
is_tu([Head | Tail]) :-
	promoter(Head),
	is_rbs(Tail).

%-- an RBS is followed by a gene
is_rbs([Head | Tail]) :-
	rbs(Head),
	is_gene(Tail).

%-- a gene is followed by a terminator	
is_gene([Head | Tail]) :-
	gene(Head),
	is_terminator(Tail).

%-- there's no list element allowed after the 
%-- the terminator		
is_terminator([Head]) :-
	terminator(Head).

%-- EXAMPLES:

%-- is the list [p1, rbs1, g1, t1] a valid transcriptional unit?
% ?- is_tu( [p1, rbs1, g1, t1] ).
% true.


%-- is the list [t1, g1, rbs1, t1] a valid transcriptional unit?
% ?- is_tu( [t1, g1, rbs1, t1] ).
% false.

%-- enumerate all TUs
% ?- is_tu(Y).
% Y = [p1, rbs1, g1, t1] ;
% Y = [p1, rbs1, g1, t2] ;
% Y = [p1, rbs1, g2, t1] ;
% ...
	