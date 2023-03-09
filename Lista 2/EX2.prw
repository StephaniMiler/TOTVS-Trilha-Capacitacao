#INCLUDE 'TOTVS.CH'

/* 2 - Efetuar o cálculo da quantidade de litros de
combustível gastos em uma viagem, utilizando-se
um automóvel que faz 12 Km por litro. Para obter o
cálculo, o usuário deverá fornecer o tempo gasto
na viagem e a velocidade média durante a mesma.
Desta forma, será possível obter a distância
percorrida com a fórmula:
DISTÂNCIA = TEMPO x VELOCIDADE.
Tendo o valor da distância, basta calcular a
quantidade de litros de combustível utilizada na
viagem com a fórmula:
LITROS_USADOS = DISTÂNCIA / 12.
O programa deverá apresentar os valores da
velocidade média, tempo gasto na vigem, a
distância percorrida e a quantidade de litros
utilizada na viagem.*/

USER Function Lista2_2()

    Local nTempo           := 0 //Declaração das variáveis
    Local nVelocidadeMedia := 0
    Local nDistancia       := 0
    Local nLitros          := 0

    nTempo           := VAL(FWInputBox('Informe o tempo gasto na viagem: ')) //Recebendo os valores
    nVelocidadeMedia := VAL(FWInputBox('Informe a velocidade média da viagem: '))

    nDistancia := nTempo * nVelocidadeMedia //Cálculo da distância percorrida
    nLitros    := nDistancia / 12           //Cálculo da quantidade de combusível utilizada


    //Imprime os resultados solicitados
    FwAlertInfo('A velocidade média foi: ' + cValToChar(nVelocidadeMedia) + ' Km/h' + CRLF + 'O tempo gasto na viagem foi: ' + cValToChar(nTempo) + ' Horas';
    + CRLF + 'A distância percorrida foi: ' + cValToChar(nDistancia) + ' KM' + CRLF + 'A quantidade de combusível utilizada foi: ' + cValToChar(nLitros) + ;
    ' litros' , 'Informações da Viagem:')
    
Return
