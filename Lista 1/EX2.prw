#INCLUDE 'TOTVS.CH'

/*2- Escreva um algoritmo para ler as dimensões de um retângulo (base e altura), 
calcular e escrever a área desse retângulo.*/

USER Function AreaRetangulo()

    Local nBase   :=0
    Local nAltura :=0
    Local nArea   :=0

    nBase := FwInputBox('Digite o valor da base do retângulo: ') //* Pede para o usuário informar o valor da base do retângulo
    nAltura := FwInputBox('Digite o valor da altura do retângulo: ') //*Pede para o usuário informar a altura do retângulo

    nArea := VAL(nBase) * VAL(nAltura) //*Cálculo da área

    FwAlertInfo('O valor da área do retângulo é ' + cValToChar( nArea ))

RETURN
