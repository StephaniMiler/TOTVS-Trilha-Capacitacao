/*3 – Desenvolva um programa que executa uma
rotina automática para excluir um Fornecedor.
Obs: Se houver algum problema no processo,
deve ser apresentada uma mensagem que indica
onde está o problema.*/

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function ExcAuto
  Rotina automática para excluir um Fornecedor
  @type  Function
  @author Stephani Miler
  @since 17/05/2023
  /*/
User Function ExcAuto()

    Local aVetor := {}
    Local nOper  := 5
    Private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    Aadd(aVetor, {'A2_COD', 'E03', NIL})
    Aadd(aVetor, {'A2_NOME', 'EXCLUIDO', NIL})

    MSExecAuto({|x, y| MATA020(x, y)}, aVetor, nOper) 

    if lMsErroAuto
      MostraErro()
    endif
    
Return
