/*1 � Ler dois n�meros positivos e apresentar a
soma, diferen�a, produto e quociente entre eles.*/

#INCLUDE 'PROTHEUS.CH'
#DEFINE TITULO_TELA 'Insira dois n�meros positivos'

/*/{Protheus.doc} User Function Operacoes
    Ler dois n�meros positivos e apresentar a
    soma, diferen�a, produto e quociente entre eles
    @type  Function
    @author Stephani Miler
    @since 13/03/2023
/*/
User Function Operacoes()

      Local nNumero1   := Space(20)
      Local nNumero2   := Space(20)
      Local nSoma      := 0
      Local nDiferenca := 0
      Local nProduto   := 0
      Local nQuociente := 0
      Local oDlg       := NIL
      Local nOpcao     := 0
  
      //Insere a janela que ir� coletar as informa��es do usu�rio:
      DEFINE MSDIALOG oDlg TITLE TITULO_TELA FROM 000, 000 TO 080, 300 PIXEL
      @ 014, 010 SAY 'Primeiro N�mero' SIZE 55, 07 OF oDlg PIXEL
      @ 023, 010 SAY 'Segundo N�mero'  SIZE 55, 07 OF oDlg PIXEL
      @ 011, 060 MSGET nNumero1 SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999999999'
      @ 020, 060 MSGET nNumero2 SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999999999'
      DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
      DEFINE SBUTTON FROM 025, 120 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg
  
      ACTIVATE MSDIALOG oDlg CENTERED

      // Converte os n�meros de string para n�mero inteiro
      nNumero1   := Val(nNumero1)
      nNumero2   := Val(nNumero2)
  
      //Se o usu�rio clicar em 'ok' e inserir n�meros positivos:
      if nOpcao == 1 .AND. nNumero1 > 0 .AND. nNumero2 > 0
            nSoma      := nNumero1 + nNumero2
            nDiferenca := nNumero1 - nNumero2
            nProduto   := nNumero1 * nNumero2
            nQuociente := nNumero1 / nNumero2
            //Imprime os resultados
            FwAlertSuccess('Soma dos dois n�meros: ' + CValToChar(nSoma) + CRLF + 'Diferen�a dos dois n�meros: ' + CValToChar(nDiferenca) + CRLF + ;
            'Produto dos dois n�meros: ' + CValToChar(nProduto) + CRLF + 'Quociente dos dois n�meros: ' + CValToChar(nQuociente), 'Resultados')
      else
            FwAlertError('Cancelado pelo usu�rio ou o valor inserido � inv�lido!', 'Cancelado!') //imprime mensagem de erro
      endif


Return
