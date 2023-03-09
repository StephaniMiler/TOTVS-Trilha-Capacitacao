#INCLUDE 'PROTHEUS.CH'

/*1 – Ler dois números positivos e apresentar a
soma, diferença, produto e quociente entre eles.*/

User Function Lista4_1()

  Local nNumero1   := Space(20)
  Local nNumero2   := Space(20)
  Local cTitle     := 'Insira dois números positivos:'
  Local nSoma      := 0
  Local nDiferenca := 0
  Local nProduto   := 0
  Local nQuociente := 0
  Local oDlg       := NIL
  Local nOpcao     := 0
  
  //Insere a janela que irá coletar as informações do usuário:
  DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 080, 300 PIXEL
  @ 014, 010 SAY 'Primeiro Número' SIZE 55, 07 OF oDlg PIXEL
  @ 023, 010 SAY 'Segundo Número'  SIZE 55, 07 OF oDlg PIXEL
  @ 011, 060 MSGET nNumero1 SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999999999'
  @ 020, 060 MSGET nNumero2 SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999999999'
  DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
  DEFINE SBUTTON FROM 025, 120 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg
  
  ACTIVATE MSDIALOG oDlg CENTERED


  nNumero1   := Val(nNumero1)
  nNumero2   := Val(nNumero2)
  
  //Se o usuário clicar em 'ok' e inserir números positivos:
      if nOpcao == 1 .AND. nNumero1 > 0 .AND. nNumero2 > 0
            nSoma      := nNumero1 + nNumero2
            nDiferenca := nNumero1 - nNumero2
            nProduto   := nNumero1 * nNumero2
            nQuociente := nNumero1 / nNumero2
            //Imprime os resultados
            FwAlertSuccess('Soma dos dois números: ' + CValToChar(nSoma) + CRLF + 'Diferença dos dois números: ' + CValToChar(nDiferenca) + CRLF + ;
            'Produto dos dois números: ' + CValToChar(nProduto) + CRLF + 'Quociente dos dois números: ' + CValToChar(nQuociente), 'Resultados')
      else
            FwAlertError('Cancelado pelo usuário ou o valor inserido é inválido!', 'Cancelado!') //imprime mensagem de erro
      endif


Return

