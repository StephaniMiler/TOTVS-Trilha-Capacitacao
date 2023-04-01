#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_BLO
    Blocos Apartamentos
    @type  Function
    @author Stephani Miler
    @since 30/03/2023 
    /*/
User Function MVC_BLO()
    Local cAlias := 'ZZE'
    Local cTitle := 'Cadastro de Blocos'
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:ACTIVATE()
        
Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir'  ACTION 'VIEWDEF.MVC_BLO' OPERATION 3 ACCESS 0 
    ADD OPTION aRotina TITLE 'Alterar'  ACTION 'VIEWDEF.MVC_BLO' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'  ACTION 'VIEWDEF.MVC_BLO' OPERATION 5 ACCESS 0 

Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVC_BLOM')
    Local oStruZZE := FwFormStruct(1, 'ZZE')

    oStruZZE:SetProperty('ZZE_CDG', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, "GETSXENUM('ZZE','ZZE_CDG')"))
    
    oModel:AddFields('ZZEMASTER' , NIL, oStruZZE)
    oModel:SetDescription('Cadastro de Blocos')
    oModel:GetModel('ZZEMASTER'):SetDescription('Cadastro de Blocos')
    oModel:SetPrimaryKey({'ZZE_CDG'})

Return oModel

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVC_BLO')
    Local oStruZZE := FwFormStruct(2, 'ZZE')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZE' , oStruZZE , 'ZZEMASTER')

    oView:CreateHorinzontalBox('Blocos' , 100)

    oView:SetOwnerView('VIEW_ZZE' , 'Blocos')

Return oView
