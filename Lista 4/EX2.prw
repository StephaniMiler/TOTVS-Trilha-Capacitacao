#INCLUDE 'PROTHEUS.CH'

/*2 – Desenvolva um programa que converta Dólar
(US$) para Real (R$). O programa deverá solicitar
ao usuário o valor do Dólar e a quantidade de
dólares que deseja converter. No final,
apresentar o valor total convertido para reais.*/

User Function Lista4_2()

  Local nDolarHoje    := Space(20)
  Local nQuantDolar   := Space(20)
  Local nQuantReais   := 0
  Local cTitle        := 'Insira a cotação do dólar e a quantidade em U$:'
  Local oDlg          := NIL
  Local nOpcao        := 0
  
  //Solicita ao usuário a quantidade de dinheiro em U$
  DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 120, 400 PIXEL
  @ 014, 010 SAY 'Valor Dólar hoje: ' SIZE 55, 07 OF oDlg PIXEL
  @ 023, 010 SAY 'Quantidade em U$'   SIZE 55, 07 OF oDlg PIXEL
  @ 011, 100 MSGET nDolarHoje  SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
  @ 020, 100 MSGET nQuantDolar SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
  DEFINE SBUTTON FROM 011, 160 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
  DEFINE SBUTTON FROM 030, 160 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg
  
  ACTIVATE MSDIALOG oDlg CENTERED

  nDolarHoje    := Val(nDolarHoje)
  nQuantDolar   := Val(nQuantDolar)

      if nOpcao == 1 .AND. nDolarHoje > 0 .AND. nQuantDolar > 0 //Se os números forem válidos, calcula.
          nQuantReais := nDolarHoje * nQuantDolar
          FwAlertSuccess('A quantidade de dinheiro em reais é: R$ ' + CValToChar(nQuantReais) , 'Resultado')
      else
          FwAlertError('Cancelado pelo usuário ou o valor inserido é inválido!', 'Cancelado!') //Se os números não forem válidos, cancela.
      endif
      
Return
