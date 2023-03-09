#INCLUDE 'TOTVS.CH'

/* 6 – Efetuar a leitura de quatro números inteiros e
apresentar os números que são divisíveis por 2 e 3. */

User Function Lista2_6()

    Local nNumero1    := 0 //Declaração das variáveis
    Local cDivisiveis := ''
    Local nContador   := 0
 
    For nContador := 1 to 4
        nNumero1 := VAL(FWInputBox('Insira o primeiro número: ')) //Recebendo os valores
        If nNumero1 % 2 == 0 .And. nNumero1 % 3 == 0 //verifica quais números são divisíveis por 2 e 3
            cDivisiveis += ALLTRIM(STR(nNumero1)) + ', ' 
        Endif
        
    Next
   
    FwAlertInfo('Os valores digitados que são divisíveis por 2 e 3: ' + (cDivisiveis) , 'Resultado')


Return

