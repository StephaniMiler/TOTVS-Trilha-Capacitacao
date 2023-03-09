#INCLUDE 'PROTHEUS.CH'

/*2 � Desenvolva um programa que converta D�lar
(US$) para Real (R$). O programa dever� solicitar
ao usu�rio o valor do D�lar e a quantidade de
d�lares que deseja converter. No final,
apresentar o valor total convertido para reais.*/

User Function Lista4_2()

  Local nDolarHoje    := Space(20)
  Local nQuantDolar   := Space(20)
  Local nQuantReais   := 0
  Local cTitle        := 'Insira a cota��o do d�lar e a quantidade em U$:'
  Local oDlg          := NIL
  Local nOpcao        := 0
  
  //Solicita ao usu�rio a quantidade de dinheiro em U$
  DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 120, 400 PIXEL
  @ 014, 010 SAY 'Valor D�lar hoje: ' SIZE 55, 07 OF oDlg PIXEL
  @ 023, 010 SAY 'Quantidade em U$'   SIZE 55, 07 OF oDlg PIXEL
  @ 011, 100 MSGET nDolarHoje  SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
  @ 020, 100 MSGET nQuantDolar SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
  DEFINE SBUTTON FROM 011, 160 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
  DEFINE SBUTTON FROM 030, 160 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg
  
  ACTIVATE MSDIALOG oDlg CENTERED

  nDolarHoje    := Val(nDolarHoje)
  nQuantDolar   := Val(nQuantDolar)

      if nOpcao == 1 .AND. nDolarHoje > 0 .AND. nQuantDolar > 0 //Se os n�meros forem v�lidos, calcula.
          nQuantReais := nDolarHoje * nQuantDolar
          FwAlertSuccess('A quantidade de dinheiro em reais �: R$ ' + CValToChar(nQuantReais) , 'Resultado')
      else
          FwAlertError('Cancelado pelo usu�rio ou o valor inserido � inv�lido!', 'Cancelado!') //Se os n�meros n�o forem v�lidos, cancela.
      endif
      
Return
