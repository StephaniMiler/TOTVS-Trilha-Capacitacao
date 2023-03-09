#INCLUDE 'TOTVS.CH'

/* Parte 2: Continue o desenvolvimento do jogo.
Agora, o programa deverá continuar dando dicas a
cada palpite do usuário até que ele acerte o
número sorteado. Quando o usuário acertar o
número gerado deverá ser apresentado o
resultado do teste da seguinte forma:
• Em menos de 5 tentativas exibir a mensagem:
“Você é muito bom, acertou em “x” tentativas.”
• Em mais que 5 e menos que 9 tentativas:
“Você é bom, acertou em “x” tentativas".
• Em mais que 9 e menos que 13 tentativas:
“Você é mediano, acertou em “x” tentativas”.
• Em mais que 13: “Você é muito fraco, acertou
em “x” tentativas” */

User function JogoAdivinhar()

    Local nNumeroSorteado := 0 //Declaração das variáveis
    Local nChute          := 0
    Local nTentativas     := 0

    nNumeroSorteado := Randomize(0, 100) //O número sorteado deverá ser aleatório

    While .T.
        nTentativas ++
        nChute := Val(FWInputBox('Adivinhe o número sorteado (entre 0 e 100): '))

        While nChute <> nNumeroSorteado
            nChute := Val(FWInputBox('Adivinhe o número sorteado (entre 0 e 100): ')) //Pede para o usuário digitar um número
            If nChute < nNumeroSorteado
                FwAlertInfo('O número sorteado é maior que o seu chute. ') //Caso o número digitado seja maior que o sorteado
            Elseif nChute > nNumeroSorteado
                FwAlertInfo('O número sorteado é menor que o seu chute. ') //Caso o número digitado seja menor que o sorteado
            Else
                FwAlertInfo('Parabéns! Você acertou o número sorteado.') //Caso o número digitado igual ao sorteado
            Endif
        
            IF nTentativas < 5
                FwAlertInfo('Você é muito bom, acertou em ' + cValToChar(nTentativas) + 'tentativas.')
            Elseif nTentativas < 9
                FwAlertInfo('Você é bom, acertou em ' + cValToChar(nTentativas) + 'tentativas.')
            Elseif nTentativas < 13
                FwAlertInfo('Você é mediano, acertou em ' + cValToChar(nTentativas) + 'tentativas.')
            Else
                FwAlertInfo('Você é muito fraco, acertou em ' + cValToChar(nTentativas) + 'tentativas.')
            Endif

        
        End   

    End

    
Return

