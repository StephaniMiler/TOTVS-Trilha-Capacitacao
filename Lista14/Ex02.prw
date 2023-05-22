/*2 – Desenvolva uma rotina para alterar
automaticamente o cadastro criado no exercício
anterior. Deve-se alterar o endereço e o
telefone do cliente.
Obs: Se houver algum problema no processo,
deve ser apresentada uma mensagem que indica
onde está o problema.*/

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function AltAuto
  Rotina para alterar automaticamente o cadastro criado no exercício anterior
  @type  Function
  @author Stephani Miler
  @since 17/05/2023
  /*/
User Function AltAuto()

    Local aVetor := {}
    Local nOper  := 4
    Private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    Aadd(aVetor, {'A1_COD', 'CL0002'              , NIL})
    Aadd(aVetor, {'A1_END', 'EX DOIS ALTERADO AUT', NIL})
    Aadd(aVetor, {'A1_TEL', '777777777'           , NIL})

    MSExecAuto({|x, y| MATA030(x, y)}, aVetor, nOper)

    if lMsErroAuto
      MostraErro()
    endif

Return
