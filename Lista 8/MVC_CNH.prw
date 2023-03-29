#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_CNH
    Menu CNH
    @type  Function
    @author Stephani Miler
    @since 28/03/2023 
    /*/
User Function MVC_CNH()
    Local cAlias := 'ZZC'
    Local cTitle := 'Cadastro de CNH'
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:ACTIVATE()
        
Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir'  ACTION 'VIEWDEF.MVC_CNH' OPERATION 3 ACCESS 0 
    ADD OPTION aRotina TITLE 'Alterar'  ACTION 'VIEWDEF.MVC_CNH' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'  ACTION 'VIEWDEF.MVC_CNH' OPERATION 5 ACCESS 0 

Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVC_CNHM', Nil, {|oModel| ValidSigla(oModel)})
    Local oStruZZC := FwFormStruct(1, 'ZZC')
    Local aGatilho := FwStruTrigger('ZZC_CDV', 'ZZC_NMV', 'ZZV->ZZV_NOME', .T., 'ZZV', 1, "XFILIAL('ZZV')+ ALLTRIM(M->ZZC_CDV)")

    oStruZZC:SetProperty('ZZC_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, "GETSXENUM('ZZC','ZZC_COD')"))

    oStruZZC:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])

    

    oModel:AddFields('ZZCMASTER' , NIL, oStruZZC)
    oModel:SetDescription('Cadastro de CNH')
    oModel:GetModel('ZZCMASTER'):SetDescription('Cadastro de CNH')
    oModel:SetPrimaryKey({'ZZC_COD'})

Return oModel

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVC_CNH')
    Local oStruZZC := FwFormStruct(2, 'ZZC')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZC' , oStruZZC , 'ZZCMASTER')

    oView:CreateHorinzontalBox('CNH' , 100)

    oView:SetOwnerView('VIEW_ZZC' , 'CNH')

Return oView


Static Function ValidSigla(oModel)
    Local lRetorno := .T. 
    Local nOper    := oModel:GetOperation()
    Local cSigla   := ALLTRIM(oModel:GetValue('ZZCMASTER', 'ZZC_SIGLA'))

    If nOper == 3 .or. nOper == 4
        If Len(cSigla)== 2 
            Help(,,'Sigla inválida!',,'A Sigla não pode ter 2 dígitos', 1, 0,,,,,,{'Cadastre uma sigla com 1 ou 3 dígitos'})
            lRetorno := .F.
        Endif
    Endif

Return lRetorno

