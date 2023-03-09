#INCLUDE 'TOTVS.CH'


/* 10 - Ler 3 valores (considere que não serão
informados valores iguais) e escrevê-los em ordem
crescente. */

User Function Ordenar()

    Local nPrimeiro := 0
    Local nSegundo  := 0 
    Local nTerceiro := 0

  nPrimeiro := VAL(FwInputBox('Digite o primeiro valor: ')) // Recebendo os valores
  nSegundo  := VAL(FwInputBox('Digite o segundo valor: ')) 
  nTerceiro := VAL(FwInputBox('Digite o terceiro valor: '))

  if nPrimeiro < nSegundo  .and. nPrimeiro < nTerceiro // se o primeiro número for o menor
    if nSegundo  < nTerceiro
      FwAlertInfo('A ordem crescente é: ' + ALLTRIM(STR(nPrimeiro)) + ', ' + ALLTRIM(STR(nSegundo)) + ' e ' + ALLTRIM(STR(nTerceiro)), 'Resultado') 
    else
      FwAlertInfo('A ordem crescente é: ' + ALLTRIM(STR(nPrimeiro)) + ', ' + ALLTRIM(STR(nTerceiro)) + ' e ' + ALLTRIM(STR(nSegundo)), 'Resultado') 
    endif

  elseif nSegundo < nPrimeiro .and. nSegundo < nTerceiro // se o segundo número for o menor
    if nPrimeiro < nTerceiro
      FwAlertInfo('A ordem crescente é: ' + ALLTRIM(STR(nSegundo)) + ', ' + ALLTRIM(STR(nPrimeiro)) + ' e ' + ALLTRIM(STR(nTerceiro)), 'Resultado') 
    else
      FwAlertInfo('A ordem crescente é: ' + ALLTRIM(STR(nSegundo)) + ', ' + ALLTRIM(STR(nTerceiro)) + ' e ' + ALLTRIM(STR(nPrimeiro)), 'Resultado') 
    endif
  
  else
    if nPrimeiro < nSegundo // se o terceiro número for o menor
      FwAlertInfo('A ordem crescente é: ' + ALLTRIM(STR(nTerceiro)) + ', ' + ALLTRIM(STR(nPrimeiro)) + ' e ' + ALLTRIM(STR(nSegundo)), 'Resultado') 
    else
      FwAlertInfo('A ordem crescente é: ' + ALLTRIM(STR(nTerceiro)) + ', ' + ALLTRIM(STR(nSegundo)) + ' e ' + ALLTRIM(STR(nPrimeiro)), 'Resultado') 
    endif 
  endif

Return 
