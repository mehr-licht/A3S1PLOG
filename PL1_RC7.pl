
/* TINHA FEITO ASSIM E DEVOLVIA O ESPERADO MAS MUITO LONGO E NAO ERA OBJECTIVO DO EXERCICIO
codigo(1).
codigo(2).
codigo(3).
significado(integer_overflow).
significado(divisao_por_zero).
significado(id_desconhecido).
semantica(1, integer_overflow).
semantica(2, divisao_por_zero).
semantica(3, id_desconhecido).
traduza(Codigo,Significado):- semantica(Codigo,Significado).
*/

%correcto: fazer tabela de correspondencias
traduza(1, integer_overflow).
traduza(2, divisao_por_zero).
traduza(3, id_desconhecido).
 
% assim pode-se
% traduza(1,Y).
% traduza(X,divisao_por_zero).
