#INCLUDE 'TOTVS.CH'

/* 7 - Ler a hora de início e a hora de fim de um jogo
de Poker (considere apenas horas inteiras, sem os
minutos) e calcule a duração do jogo em horas,
sabendo-se que o tempo máximo de duração do
jogo é de 24 horas e que o jogo pode iniciar em um
dia e terminar no dia seguinte. */

User Function Lista2_7()
    Local nHoraInicio := 0 //Declaração das variáveis
    Local nHoraFim    := 0
    Local nDuracao    := 0


    nHoraInicio := VAL(FWInputBox('Insira o horário do início da partida: ')) //Recebendo os valores
    nHoraFim:= VAL(FWInputBox('Insira o horário do final da partida: '))

    // Verifica se a duração ultrapassa as 24 horas
    if nDuracao > 24
	    // Exibe mensagem de erro e solicita o horário de início e término novamente
		FwAlertInfo('O valor de duração de jogo é inválido. Por favor, verifique as horas de início e fim informadas.')
        nHoraInicio := VAL(FWInputBox('Insira o horário do início da partida: '))
        nHoraFim:= VAL(FWInputBox('Insira o horário do final da partida: '))

    Endif

    // Cálculo da duração do jogo em horas
    If  nHoraInicio > nHoraFim
        nDuracao := (24 - nHoraInicio) + nHoraFim
    Elseif nDuracao := nHoraFim - nHoraInicio
    Endif


    //Imprime a duração da partida
    FwAlertInfo('A duração da partida foi de ' + cValToChar(nDuracao) + ' horas' , 'Duração da partida')

Return
