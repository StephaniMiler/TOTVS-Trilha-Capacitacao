#INCLUDE 'TOTVS.CH'

/* 35 - Faça um programa que receba várias idades e
que calcule e mostre a média das idades digitadas.
Finalize o processo de entrada de dados digitando
a idade igual a zero */

User Function MediaIdades()

    Local nIdade := 1
    Local nSoma := 0
    Local nMedia := 0
    Local nContador := 0

 Do while nIdade <> 0
        nIdade := VAL(FwInputBox('Informe uma idade ou digite 0 para finalizar: ')) //Solicita uma idade ou finaliza o programa
        if nIdade <> 0                
      nSoma += nIdade
      nContador++
    endif
  end

    nMedia := nSoma / nContador //cálculo da média
    if nContador > 0
    FwAlertInfo('Média das idades: ' + cValToChar(nMedia))
  else
    FwAlertInfo('Nenhuma idade foi digitada!')
  endif

Return
