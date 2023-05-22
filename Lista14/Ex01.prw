/*1 – Desenvolva um programa que executa uma
rotina automática para cadastrar um cliente.
Obs: Preencher apenas os campos obrigatórios.*/

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function IncAuto
  Rotina automática para cadastrar um cliente
  @type  Function
  @author Stephani Miler
  @since 17/05/2023
  /*/
User Function IncAuto()

    Local aVetor := {}
    Local nOper  := 3
    Private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    Aadd(aVetor, {'A1_FILIAL'  , xFilial('SA1'), NIL})
    Aadd(aVetor, {'A1_COD'     , 'CL0002'      , NIL})
    Aadd(aVetor, {'A1_LOJA'    , '01'          , NIL})
    Aadd(aVetor, {'A1_NOME'    , 'EXERC UM'    , NIL})
    Aadd(aVetor, {'A1_NREDUZ'  , 'EX UM'       , NIL})
    Aadd(aVetor, {'A1_END'     , 'RUA TESTE,1' , NIL})
    Aadd(aVetor, {'A1_EST'     , 'SP'          , NIL})
    Aadd(aVetor, {'A1_COD_MUN' , '26902'       , NIL})
    Aadd(aVetor, {'A1_TIPO'    , 'F'           , NIL})

    MSExecAuto({|x, y| MATA030(x, y)}, aVetor, nOper) 

    if lMsErroAuto
        MostraErro()
    endif
    
Return
