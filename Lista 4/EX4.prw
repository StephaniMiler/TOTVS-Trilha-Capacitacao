#INCLUDE 'PROTHEUS.CH'

/*4 � Fa�a um programa que leia a largura e a altura
de uma parede em metros, calcule sua �rea e a
quantidade de tinta necess�ria para pint�-la,
sabendo que cada litro de tinta pinta uma �rea de 2
metros quadrados. */

User Function Lista4_4()

  Local nLargura := Space(20)
  Local nAltura  := Space(20)
  Local nArea    := 0
  Local cTitle   := 'C�lculo �rea'
  Local oDlg     := NIL
  Local nOpcao   := 0
  Local nTinta   := 0      
  
  //Solicita ao usu�rio a altura e largura da parede
  DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 100, 600 PIXEL
  @ 014, 010 SAY 'Insira a largura da parede: ' SIZE 100, 07 OF oDlg PIXEL
  @ 023, 010 SAY 'Insira a altura da parede: '  SIZE 100, 07 OF oDlg PIXEL
  @ 014, 180 MSGET nLargura SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
  @ 023, 180 MSGET nAltura  SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
  DEFINE SBUTTON FROM 011, 260 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
  DEFINE SBUTTON FROM 025, 260 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg
  
  ACTIVATE MSDIALOG oDlg CENTERED

  nLargura := Val(nLargura)
  nAltura  := Val(nAltura)
  
     //Caso a op��o e n�meros inseridos sejam v�lidos, calcula, se n�o, exibe mensagem de erro.
     if nOpcao == 1 .AND. nLargura > 0 .AND. nAltura > 0
            nArea  := nLargura * nAltura
            nTinta := nArea / 2
            FwAlertSuccess('A �rea da parede �: ' + CValToChar(nArea) + ' metros quadrados' + CRLF ;
            + 'A quantidade de tinta necess�ria �: ' + CValToChar(nTinta) + ' litros', '�rea da parede')
      else
            FwAlertError('Cancelado pelo usu�rio ou o valor inserido � inv�lido!', 'Cancelado!')
      endif

Return
