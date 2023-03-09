#INCLUDE 'TOTVS.CH'

/* 14 - Faça um programa que calcule a somatória dos
"n" primeiros números naturais pares ou ímpares.
O usuário informará através de digitação a
quantidade de números desejada ("n") e escolherá
entre par ou ímpar. */

User function Somatoria()
    
    Local nLimite := 0
    Local nSoma := 0
    Local cOpcao := ''
    Local nContador := 0

    nLimite := VAL(FwInputBox('Digite um número limtie: ')) //Solicita um número
    nOpcao := Upper(FwInputBox('Digite P ou I para exibir números ímpares ou pares '))

    If cOpcao == 'P'
        For nContador := 1 to (nLimite*2)
            If nContador % 2 == 0
                nSoma := nSoma + nContador
            Endif
        Next nContador

        FwAlertInfo('A soma dos  ' + alltrim(Str(nLimite)) + ' primeiros números naturais pares é ' + alltrim(STR(nSoma)) , 'Resultado')

    Elseif cOpcao == 'I'
        For nContador := 1 to (nLimite*2) step 2
            If nContador % 2 != 0
                nSoma := nSoma + nContador
            Endif
        Next nContador

        FwAlertInfo('A soma dos  ' + alltrim(Str(nLimite)) + ' primeiros números naturais ímpares é ' + alltrim(STR(nSoma)) , 'Resultado')
    Endif
        
Return
