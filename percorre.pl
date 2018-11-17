percorre([]):-write('acabou').
percorre([X|Lista]):- write(X), nl,percorre(Lista).
