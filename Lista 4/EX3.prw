#INCLUDE 'PROTHEUS.CH'

/*3 - Escreva um algoritmo para ler o sal�rio mensal
atual de um funcion�rio e o percentual de
reajuste. Calcular e escrever o valor do novo
sal�rio.*/

User Function Lista4_3()

  Local nSalarioAtual := Space(20)
  Local nReajuste     := Space(20)
  Local nSalarioNovo  := 0
  Local cTitle        := 'C�lculo novo sal�rio:'
  Local oDlg          := NIL
  Local nOpcao        := 0
  
  //Solicita ao usu�rio o sal�rio atual e a porcentagem do reajuste
  DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 100, 600 PIXEL
  @ 014, 010 SAY 'Insira o sal�rio atual: '           SIZE 100, 07 OF oDlg PIXEL
  @ 023, 010 SAY 'Insira a porcentagem do reajuste: ' SIZE 100, 07 OF oDlg PIXEL
  @ 014, 180 MSGET nSalarioAtual SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 9999,99'
  @ 023, 180 MSGET nReajuste     SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 9999,99'
  DEFINE SBUTTON FROM 011, 260 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
  DEFINE SBUTTON FROM 025, 260 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg
  
  ACTIVATE MSDIALOG oDlg CENTERED

  nSalarioAtual := Val(nSalarioAtual)
  nSalarioNovo  := Val(nSalarioNovo)
  nReajuste     := Val(nReajuste)
      
     //Se a op��o for ok e os valores forem v�lidos, calula o novo sal�rio, caso contr�rio, imprime mensagem de erro.
     if nOpcao == 1 .AND. nSalarioAtual > 0 .AND. nReajuste > 0
         nReajuste    := nSalarioAtual * (nReajuste/100)  
         nSalarioNovo := nSalarioAtual + nReajuste 
         FwAlertSuccess('O sal�rio com reajuste �: R$ ' + CValToChar(nSalarioNovo) , 'Novo Sal�rio')
      else
         FwAlertError('Cancelado pelo usu�rio ou o valor inserido � inv�lido!', 'Cancelado!')
      endif
      
Return
