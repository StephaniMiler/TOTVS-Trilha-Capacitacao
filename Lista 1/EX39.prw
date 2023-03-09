#INCLUDE 'TOTVS.CH'

/* 39 - Faça um programa que realiza o sorteio de um
nome. Os nomes contidos no programa devem os
nomes dos participantes da trilha de capacitação
do Projeto Start II. */

User Function NovosTotvers() 

    Local aNomes := {'Ste','Nana','Dani','','Cake','Ruan',;
                        'Thami','Giu','Quirino','Rick','Gustavo',;
                        'Gabriela','Pintor','Joao','Lucas','Fábio'}
    Local cSorteado := ''

    cSorteado := aNomes[RANDOMIZE(1,LEN( aNomes ))] // Sorteia um nome
    FwAlertInfo(cSorteado , 'Nome Sorteado!') // Imprime o nome sorteado

Return
