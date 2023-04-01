#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_APT
    Apartamentos
    @type  Function
    @author Stephani Miler
    @since 30/03/2023 
    /*/
User Function MVC_APT()
    Local cAlias := 'ZZF'
    Local cTitle := 'Cadastro de Apartamentos'
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:ACTIVATE()
        
Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir'  ACTION 'VIEWDEF.MVC_APT' OPERATION 3 ACCESS 0 
    ADD OPTION aRotina TITLE 'Alterar'  ACTION 'VIEWDEF.MVC_APT' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'  ACTION 'VIEWDEF.MVC_APT' OPERATION 5 ACCESS 0 

Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVC_APTM')
    Local oStruZZF := FwFormStruct(1, 'ZZF')

    oStruZZF:SetProperty('ZZF_CDG', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, "GETSXENUM('ZZF','ZZF_CDG')"))
    
    oModel:AddFields('ZZFMASTER' , NIL, oStruZZF)
    oModel:SetDescription('Cadastro de Apartamentos')
    oModel:GetModel('ZZFMASTER'):SetDescription('Cadastro de Apartamentos')
    oModel:SetPrimaryKey({'ZZF_CDG'})

Return oModel

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVC_APT')
    Local oStruZZF := FwFormStruct(2, 'ZZF')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZF' , oStruZZF , 'ZZFMASTER')

    oView:CreateHorinzontalBox('Apartamentos' , 100)

    oView:SetOwnerView('VIEW_ZZF' , 'Apartamentos')

Return oView
