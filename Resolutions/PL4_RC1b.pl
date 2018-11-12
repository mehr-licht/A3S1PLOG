ligado(a,b). 
ligado(f,i).
ligado(a,c). 
ligado(f,j).
ligado(b,d). 
ligado(f,k).
ligado(b,e). 
ligado(g,l).
ligado(b,f). 
ligado(g,m).
ligado(c,g). 
ligado(k,n).
ligado(d,h). 
ligado(l,o).
ligado(d,i). 
ligado(i,f). 

path(End, End, Path, Path).
path(Start, End, Path) :- path(Start, End, Path, [Start]).
path(Start, End, Path, Temp ):- ligado(Start,Next), \+ member(Next, Temp), append(Temp, [Next], NewTemp), path(Next, End, Path, NewTemp).



