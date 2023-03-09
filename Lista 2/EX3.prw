#INCLUDE 'TOTVS.CH'

/* 3 – Alterar o programa do exercício anterior de
modo que ele possa ser usado em veículos com
padrão de consumo diferente de 12 Km por litro. */

USER Function Lista2_3()


    Local nTempo           := 0 //Declaração das variáveis
    Local nConsumo         := 0 
    Local nVelocidadeMedia := 0
    Local nDistancia       := 0
    Local nLitros          := 0

    nTempo           := VAL(FWInputBox('Informe o tempo gasto na viagem: ')) //Recebendo os valores
    nVelocidadeMedia := VAL(FWInputBox('Informe a velocidade média da viagem: '))
    nConsumo         := VAL(FWInputBox('Quantos km o veículo faz por litro de combustível?'))

    nDistancia := nTempo * nVelocidadeMedia //Cálculo da distância percorrida
    nLitros    := nDistancia / nConsumo           //Cálculo da quantidade de combusível utilizada


    //Imprime os resultados solicitados
    FwAlertInfo('A velocidade média foi: ' + cValToChar(nVelocidadeMedia) + ' Km/h' + CRLF + 'O tempo gasto na viagem foi: ' + cValToChar(nTempo) + ' Horas';
    + CRLF + 'A distância percorrida foi: ' + cValToChar(nDistancia) + ' KM' + CRLF + 'A quantidade de combusível utilizada foi: ' + cValToChar(nLitros) + ;
    ' litros' , 'Informações da Viagem:')
    
Return
