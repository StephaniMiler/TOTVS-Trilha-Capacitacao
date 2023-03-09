#INCLUDE 'TOTVS.CH'

/* Parte 1: Elaborar um jogo do tipo adivinhe o
número. Onde deverá ser sorteado um número
entre 0 e 100. Em seguida solicitado que o usuário
adivinhe qual foi o número sorteado. Após o
“chute” do usuário apresentar uma mensagem
informando se o número sorteado é maior, menor ou
igual ao número “chutado”. */

User function Adivinhar()

    Local nNumeroSorteado := 0 //Declaração das variáveis
    Local nChute          := 0

    nNumeroSorteado := Randomize(0, 100) //O número sorteado deverá ser aleatório

    While nChute <> nNumeroSorteado
        nChute := Val(FWInputBox('Adivinhe o número sorteado (entre 0 e 100): ')) //Pede para o usuário digitar um número
        If nChute < nNumeroSorteado
          FwAlertInfo('O número sorteado é maior que o seu chute. ') //Caso o número digitado seja maior que o sorteado
        elseif nChute > nNumeroSorteado
          FwAlertInfo('O número sorteado é menor que o seu chute. ') //Caso o número digitado seja menor que o sorteado
        else
          FwAlertInfo('Parabéns! Você acertou o número sorteado.') //Caso o número digitado igual ao sorteado
        endif
    end

Return
