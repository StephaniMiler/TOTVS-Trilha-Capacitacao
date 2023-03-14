/*3 - Escreva um algoritmo para ler o salário mensal
atual de um funcionário e o percentual de
reajuste. Calcular e escrever o valor do novo
salário.*/

#INCLUDE 'PROTHEUS.CH'
#DEFINE TITULO_TELA 'Cálculo novo salário'

/*/{Protheus.doc} User Function CalculoSalario
    Calcula salário com reajuste
    @type  Function
    @author Stephani Miler
    @since 13/03/2023
/*/
User Function CalculoSalario()

    Local nSalarioAtual := Space(20)
    Local nReajuste     := Space(20)
    Local nSalarioNovo  := 0
    Local oDlg          := NIL
    Local nOpcao        := 0
    
    //Solicita ao usuário o salário atual e a porcentagem do reajuste
    DEFINE MSDIALOG oDlg TITLE TITULO_TELA FROM 000, 000 TO 100, 600 PIXEL
    @ 014, 010 SAY 'Insira o salário atual: '           SIZE 100, 07 OF oDlg PIXEL
    @ 023, 010 SAY 'Insira a porcentagem do reajuste: ' SIZE 100, 07 OF oDlg PIXEL
    @ 014, 180 MSGET nSalarioAtual SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 9999,99'
    @ 023, 180 MSGET nReajuste     SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 9999,99'
    DEFINE SBUTTON FROM 011, 260 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 025, 260 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg
    
    ACTIVATE MSDIALOG oDlg CENTERED

    nSalarioAtual := Val(nSalarioAtual)
    nSalarioNovo  := Val(nSalarioNovo)
    nReajuste     := Val(nReajuste)
      
    //Se a opção for ok e os valores forem válidos, calula o novo salário, caso contrário, imprime mensagem de erro.
    If nOpcao == 1 .AND. nSalarioAtual > 0 .AND. nReajuste > 0
        nReajuste    := nSalarioAtual * (nReajuste/100) 
        nSalarioNovo := nSalarioAtual + nReajuste 
        FwAlertSuccess('O salário com reajuste é: R$ ' + CValToChar(nSalarioNovo) , 'Novo Salário')
  Else
        FwAlertError('Cancelado pelo usuário ou o valor inserido é inválido!', 'Cancelado!')
  Endif
     
Return
