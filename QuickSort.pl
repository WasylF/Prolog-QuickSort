quicksort([], []).
quicksort([HEAD | TAIL], SORTED) :- partition(HEAD, TAIL, LEFT, RIGHT),
                                    quicksort(LEFT, SORTEDL),
                                    quicksort(RIGHT, SORTEDR),
                                    append(SORTEDL, [HEAD | SORTEDR], SORTED).

partition(PIVOT, [], [], []).
partition(PIVOT, [HEAD | TAIL], [HEAD | LEFT], RIGHT) :- HEAD @=< PIVOT,
                                                         partition(PIVOT, TAIL, LEFT, RIGHT).
partition(PIVOT, [HEAD | TAIL], LEFT, [HEAD | RIGHT]) :- HEAD @> PIVOT,
                                                         partition(PIVOT, TAIL, LEFT, RIGHT).

append([], LIST, LIST).
append([HEAD | LIST1], LIST2, [HEAD | LIST3]) :- append(LIST1, LIST2, LIST3).
