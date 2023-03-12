#INCLUDE 'TOTVS.CH'
#INCLUDE "FWMVCDEF.CH"

/*7 – Desenvolva uma rotina para que ao incluir um
novo Cadastro de Fornecedor, o campo “LOJA”
seja preenchido automaticamente antes da
abertura da tela de cadastro, ou seja, quando a
tela carregar, o campo LOJA já estará preenchido.
O número da loja deverá ser gerado
automaticamente e estar entre 01 e 09.*/


User Function CUSTOMERVENDOR()

	Local aParam := PARAMIXB
	Local lRet := .T.
	Local oObj := ""
	Local cIdPonto := ""
	Local cIdModel := ""


	If aParam <> NIL
		oObj := aParam[1]
		cIdPonto := aParam[2]
		cIdModel := aParam[3]
		if  cIdPonto == 'BUTTONBAR'
			oObj:GetModel("SA2MASTER"):LoadValue("A2_LOJA", "0" + Alltrim(Str(Randomize(1,9))))
			oView := FwViewActive()
			oView:Refresh()
		endif
	endif


Return lRet
