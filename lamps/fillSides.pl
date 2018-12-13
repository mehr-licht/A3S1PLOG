
/**
 * First state of the game: fill the 4 lists with random values to populate de board center
*/

fillSides(Tabuleiro, NewSize, FinalTabuleiro):-
    nl,
    fillTop(Tabuleiro, NewSize,InterTab0),
    fillButtom(InterTab0,NewSize,InterTab1),
    fillLeft(InterTab1,NewSize,InterTab2),
    fillRight(InterTab2,NewSize,InterTab3),        
    adjustBoard(InterTab3, FinalTabuleiro,NewSize).
    

/**
 * Se o o tabuleiro for 4x4, o random nos sides vai escolher entre 0 e 3 pois o centro vai ser 3x3
 * e o intervalo é aberto em Index -> logo de 0 a 3 
 * */      
fillTop(Tabuleiro, NewSize,NewTabuleiro):-
    Index is NewSize - 1,
    randomLists(NewSize, Index, TopLista),    
    setLineToMatrix(Tabuleiro, 0, TopLista, NewTabuleiro).
fillButtom(Tabuleiro,NewSize,NewTabuleiro):-
    Index is NewSize - 1,
    randomLists(NewSize, Index, ButtomLista),    
    setLineToMatrix(Tabuleiro,Index,ButtomLista,NewTabuleiro).

fillLeft(Tabuleiro,NewSize,NewTabuleiro):-
    Index is NewSize - 1,
    transpose(Tabuleiro, TabTransposto),
    randomLists(NewSize, Index, LeftLista),
    setLineToMatrix(TabTransposto,0,LeftLista,NewTabTransposto),
    transpose(NewTabTransposto, NewTabuleiro).

fillRight(Tabuleiro,NewSize,NewTabuleiro):-
    Index is NewSize - 1,
    transpose(Tabuleiro, TabTransposto),
    randomLists(NewSize, Index, LeftLista),
    setLineToMatrix(TabTransposto,NewSize-1,LeftLista,NewTabTransposto),
    transpose(NewTabTransposto, NewTabuleiro).

/**
 * @brief Populate a N length list with random numbers
 * @param Range, index 
 *  randomLists(+Range, +RangeRandom, -NewLista) 
*/
randomLists(0, _,[]).   
randomLists(Range, RangeRandom, NewLista):-
    Range > 0,        
    C1 is Range-1,    
    random(0, RangeRandom, U),
    NewLista = [U|T],    
    randomLists(C1, RangeRandom, T).   

