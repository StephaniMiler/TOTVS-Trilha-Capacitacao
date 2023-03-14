/*5 – Escreva um programa que pergunte a
quantidade de Km percorridos por um carro
alugado e a quantidade de dias pelos quais ele foi
alugado. Calcule o preço a pagar, sabendo que o
carro custa R$60,00/dia e R$0,15/Km rodado. */

#INCLUDE 'PROTHEUS.CH'
#DEFINE TITULO_TELA 'Cálculo carro alugado'

/*/{Protheus.doc} User Function ValorAluguel
    Calcula o valor do aluguel de um veículo
    @type  Function
    @author Stephani Miler
    @since 13/03/2023
/*/
User Function ValorAluguel()

    Local nKm    := Space(20)
    Local nDias  := Space(20)
    Local nValor := 0
    Local oDlg   := NIL
    Local nOpcao := 0
     
    //Solicita ao usuário a quantidade de km percorridos e por quantos dias que o carro foi usado
    DEFINE MSDIALOG oDlg TITLE TITULO_TELA FROM 000, 000 TO 100, 600 PIXEL
    @ 014, 010 SAY 'Insira a quantidade de km percorridos: ' SIZE 100, 07 OF oDlg PIXEL
    @ 023, 010 SAY 'Insira a quantidade de dias utilizado: ' SIZE 100, 07 OF oDlg PIXEL
    @ 014, 180 MSGET nKm   SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
    @ 023, 180 MSGET nDias SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
    DEFINE SBUTTON FROM 011, 260 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 025, 260 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg
  
    ACTIVATE MSDIALOG oDlg CENTERED

    nKm    := Val(nKm)
    nDias  := Val(nDias)
  
    //Caso a opção e valores sejam válidos, realiza o cálculo, caso contrário exibe mensagem de erro. 
    if nOpcao == 1 .AND. nKm > 0 .AND. nDias > 0
        nValor  := (60 * nDias) + (0.15 * nKm)
        FwAlertSuccess('A quantidade de km rodados foram: ' + CValToChar(nKm) + ' km' + CRLF ;
        + 'A quantidade de dias de utilização do carro foram: ' + CValToChar(nDias) + ' dias';
        + CRLF + 'O valor total a ser pago é: R$ ' + cValToChar(nValor) , 'Informações carro alugado')
    else
        FwAlertError('Cancelado pelo usuário ou o valor inserido é inválido!', 'Cancelado!')
    endif

Return
